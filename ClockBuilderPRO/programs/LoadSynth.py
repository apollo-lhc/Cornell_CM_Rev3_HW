#!/usr/bin/env python 

import serial
import time
import io
import argparse
import os
import pdb
import re

dir = os.path.dirname(os.path.abspath(__file__))

#parser = optparse.OptionParser()
parser = argparse.ArgumentParser()
# allow user to specify the required destination synthesizer in upper/lower/mixed case
synth_choices = ["r0a", "r0b", "r1a", "r1b", "r1c"]
parser.add_argument("synth_id", type=str.lower, choices=synth_choices, help='[required] synthesizer to configure {R0A, R0B, R1A, R1B, R1C}')
# the required register list filename has to be an exact match
parser.add_argument("Reg_List", help='[required] Register List .h file from ClockBuilderPRO')
parser.add_argument('--tty', default='ttyUSB0', help='Specify tty device. ttyUL1 for ZYNQ. ttyUSB0 or ttyUSB1 for CPU.')
parser.add_argument('--quiet', action="store_true", default=False, help='Do not print out get_command output')
#o, a = parser.parse_args()

args = parser.parse_args()
print("Arguments parsed:")
print(f"synth_id: {args.synth_id}")
print(f"Reg_List: {args.Reg_List}")
print(f"tty: {args.tty}")
print(f"quiet: {args.quiet}")
i2c_active_map = "0x80"
# define variables for accessing each synth
if args.synth_id == "r0a" :
    # SI5395 on mux channel 0 (mask = 0x01)
    i2c_port = "2"
    i2c_addr = "0x6b"
    i2c_mux_mask = "0x01"
    Def_List = dir+"/../defaults/Si5395-RevA-default-Registers.h"
    i2c_active_map = "0x80"
elif args.synth_id == "r0b" :
    # SI5395 on mux channel 1 (mask = 0x02)
    i2c_port = "2"
    i2c_addr = "0x6b"
    i2c_mux_mask = "0x02"
    Def_List = dir+"/../defaults/Si5395-RevA-default-Registers.h"
    i2c_active_map = "0x8f"
elif args.synth_id == "r1a" :
    # SI5395 on mux channel 2 (mask = 0x04)
    i2c_port = "2"
    i2c_addr = "0x6b"
    i2c_mux_mask = "0x04"
    Def_List = dir+"/../defaults/Si5395-RevA-default-Registers.h"
elif args.synth_id == "r1b" :
    # SI5395 on mux channel 3 (mask = 0x08)
    i2c_port = "2"
    i2c_addr = "0x6b"
    i2c_mux_mask = "0x08"
    Def_List = dir+"/../defaults/Si5395-RevA-default-Registers.h"
elif args.synth_id == "r1c" :
    # SI5395 on mux channel 4 (mask = 0x10)
    i2c_port = "2"
    i2c_addr = "0x6b"
    i2c_mux_mask = "0x10"
    Def_List = dir+"/../defaults/Si5395-RevA-default-Registers.h"

serPort = "/dev/"+args.tty

ser = serial.Serial(serPort,baudrate=115200,timeout=0.05)  # open serial port
print(ser.portstr)         # check which port was really used

ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')


def get_command(command):
    lines = []
    # just ensure command has newline 
    command = command.rstrip() + '\r\n'
    # show what will be sent to the board    
    print(command)
    ser.write(command.encode()) # write one char from an int
    done = False
    # wait for the MCU to send back a "%" prompt    
    iters = 0
    trials = 0
    while ( not done ):
        line  = ser.readline().rstrip().decode()
        line = ansi_escape.sub('', line)
        if args.tty == "ttyUL1":
            if ( len(line) and '%' in line ) :
                done = True
            else :
                lines.append(line)
        else :
            if ( len(line) and line[0] == '%' ) :
                done = True
            else :
                if ( len(line) ) :
                    lines.append(line)
        iters = iters + 1
        if ( iters > 20 ) :
            print("stuck: ", line, iters)
            ser.write(command.encode())
            trials += 1
    if trials > 0:
        for trial in range(1,trials):
            done = False
            while ( not done ):
                line  = ser.readline().rstrip().decode()
                line = ansi_escape.sub('', line)
                if args.tty == "ttyUL1":
                    if ( len(line) and '%' in line ) :
                        done = True
                    else :
                        lines.append(line)
                else :
                    if ( len(line) and line[0] == '%' ) :
                        done = True
                    else :
                        lines.append(line)
    return lines

#write to ClockSynthesizer
#When 'noisy' print out returned data of get_command
def write_reg(ListOfRegs,ListOfDefs,Optimize,Noisy):
    HighByte = -1
    Match = False
    for register in ListOfRegs:
        if Optimize :
            # skip sending register contents if it matches the default
            DefIndx = 0
            Found = False
            Match = False            
            while not Found and DefIndx < len(ListOfDefs) :
               if int(register[0][2:6],16) == int(ListOfDefs[DefIndx][0][2:6],16) :
                   # addresses match
                   Found = True
                   if int(register[1][2:4],16) == int(ListOfDefs[DefIndx][1][2:4],16) :
                       # data matches
                       Match = True
               
               if Match :
                    # data matches default
                    break
               elif not Found :
                    # have not found a matching address
                    DefIndx += 1

        if not Match:
            # determine if the register page has changed
            ChangePage = True if int(register[0][2:4],16)!=HighByte else False
            HighByte = int(register[0][2:4],16)
            if ChangePage:
                # write the new page number to address 0x01
                command = "".join(["i2cwr ",i2c_port," ",i2c_addr," 1 0x01 1 ",register[0][0:4],""])
                if Noisy:
                    print(get_command(command)[-1])
                else:
                    get_command(command)
            # write the register address and value
            command = "".join(["i2cwr ",i2c_port," ",i2c_addr," 1 0x",register[0][4:6]," 1 ",register[1],""])
            if Noisy:
                print(get_command(command)[-1])
            else:
                get_command(command)

    #Set page back to 0 in the end
    page_reset = "".join(["i2cwr ",i2c_port," ",i2c_addr," 1 0x01 1 0x00"])

    if Noisy:
        print(get_command(page_reset)[-1])
    else:
        get_command(page_reset)
        
# send 'help' command and print out results to show that the MCU is communicating
#print(get_command("help"))

# take semaphore 2
# 
semaphore = get_command("semaphore 2 take")
print(semaphore[-1])
for line in semaphore:
    if "failed to acquire semaphore" in line:
        success = False
        print(get_command("semaphore 2 release"))
        while (not success):
            semaphore = get_command("semaphore 2 take")
            print(semaphore[-1])
            if not ("failed" in semaphore[:-1]):
                success = True

# eventually move the I2C register port setup elsewhere.
# enable ports 6 and 7 on U84 at 0x70   
print(get_command("i2cw "+i2c_port+" 0x70 1 0xc0")[-1])
# Ping the registers at 0x20 and 0x21 to make sure they are indeed enabled
print(get_command("i2crr "+i2c_port+" 0x20 1 0x06 1")[-1])
print(get_command("i2crr "+i2c_port+" 0x21 1 0x06 1")[-1])
# Setting Control Registers at 0x20 on U88 (TCA9555) to have outputs on P07, P03..P00, P15..P12, and P10 (set '0' for outputs)
print(get_command("i2cwr "+i2c_port+" 0x20 1 0x06 1 0x70")[-1]) # 0b01110000
print(get_command("i2cwr "+i2c_port+" 0x20 1 0x07 1 0xc2")[-1]) # 0b11000010
# Setting U88 outputs on P07 and P10 to '1' to negate active-lo reset signals.
# Also setting P03..P00 to '0' or '1' to use synth R0A or R0B to drive the R0 RefClks to the FPGA#1
# All others to '0'
#print(get_command("i2cwr "+i2c_port+" 0x20 1 0x02 1 8f")[-1]) #0b10001111
print(get_command("i2cwr "+i2c_port+" 0x20 1 0x02 1 "+i2c_active_map)[-1])  #0x80 for r0a, 0x8f for r0b
print(get_command("i2cwr "+i2c_port+" 0x20 1 0x03 1 01")[-1]) #0b00000001

# enable only the route through the I2C mux to the selected synth
print(get_command("i2cw "+i2c_port+" 0x70 1 "+i2c_mux_mask+"")[-1])
# ping the synth
print(get_command("i2cr "+i2c_port+" "+i2c_addr+"  1")[-1])


#pdb.set_trace()
# open files and create/initialize variables
with open(args.Reg_List, 'r') as regfile, open(Def_List, 'r') as deffile:
    PreambleList = []
    PostambleList = []
    RegisterList = []
    DefaultList = []
    line = []
    InPreamble = 0
    InRegisters = 0
    InPostamble = 0

    # read the default register settings from the "default" file
    while True:
        line = deffile.readline()
        if not line:
            break    
        # set or clear section flags at the start or end of the register section
        if "Start configuration registers" in line:
            print("Starting to read default register settings")
            InRegisters = 1
            continue
        elif "End configuration registers" in line:
            print("Finished reading default register settings")
            InRegisters = 0
            # bail out at the end of the register section
            break

        # line does not contain a section marker
        else:
            if InRegisters:
                # line is from the register sections
                if "/*" not in line:
                    # this is not a comment line that is embedded in a data section
                    for words in line.split('"'):
                        # extract the register address and value
                        reg_loc = words.find("0x")
                        reg = words[reg_loc:reg_loc+6]
                        val_loc = words.find("0x", reg_loc + 1)
                        val = words[val_loc:val_loc+4]
                        # append the register address and value to the default list
                        DefaultList.append((reg, val))   

    # read the desired register settings from the "register" file
    while True:
        line = regfile.readline()
        if not line:
            break    
        # set or clear section flags at the start or end of each section
        if "Start configuration preamble" in line:
            print("Starting to read the configuration preamble")
            InPreamble = 1
            continue
        elif "End configuration preamble" in line:
            print("Finished reading the configuration preamble")
            InPreamble = 0
            continue
        elif "Start configuration registers" in line:
            print("Starting to read the configuration data")
            InRegisters = 1
            continue
        elif "End configuration registers" in line:
            print("Finished reading the configuration data")
            InRegisters = 0
            continue
        elif "Start configuration postamble" in line:
            print("Starting to read the configuration postamble")
            InPostamble = 1
            continue
        elif "End configuration postamble" in line:
            print("Finished reading the configuration postamble")
            InPostamble = 0
            # bail out at the end of the postamble
            break

        # line does not contain a section marker
        else:
            if InPreamble or InRegisters or InPostamble:
                # line is from one of the register sections
                if "/*" not in line:
                    # not a comment line that is embedded with a section
                    for words in line.split('"'):
                        # not a comment line
                        # extract the register address and value
                        reg_loc = words.find("0x")
                        reg = words[reg_loc:reg_loc+6]
                        val_loc = words.find("0x", reg_loc + 1)
                        val = words[val_loc:val_loc+4]
                        # append the register address and value to the appropriate list
                        if InPreamble:
                            PreambleList.append((reg, val))
                        elif InRegisters:
                            RegisterList.append((reg, val))   
                        elif InPostamble:
                            PostambleList.append((reg, val))

# send the preamble, data, and postamble to the synth
def LoadClock(PreList,RegList,PostList,DefList,Read):
    # for the preamble, send all data    
    Optimize = False
    write_reg(PreList,DefList,Optimize,Read)
    time.sleep(0.4) #only need 400 msec
    # for the data section, eliminate data that matches the default configuration    
    Optimize = True
    write_reg(RegList,DefList,Optimize,Read)
    time.sleep(0.4)
    # for the postamble, send all data
    Optimize = False
    write_reg(PostList,DefList,Optimize,Read)

# send data off to synthesizer
LoadClock(PreambleList, RegisterList, PostambleList, DefaultList, not args.quiet)

# disable all of the channels in the switch
print(get_command("i2cw 2 0x70 1 0x00")[-1])
print(get_command("semaphore 2 release")[-1])

# close the tty port:
ser.close()
