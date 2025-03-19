# Test program for CM Rev3 checkout

This is test code for a test program for checkout of the Rev3 command module.

To recreate the project, run the following command from the `Vivado` directory.
```sh
vivado -mode batch -script src/prod_test.tcl
```
This will create a project file and also launch bitfile creation. The project can be opened from the vivado gui as per usual.

The program is usable on either FPGA.

## Frequency Counters

The program includes frequency counters for all MGT clocks and logic clocks input to each FPGA. The 200 MHz clock from the on-board oscillator is also sent to the other FPGA for testing the oscillator data path.

## I2C monitor
The results of the clock frequency counters can be read out via the generic i2c data path from the MCU on the CM. The I2C device responds to the address 0x2b.

### I2C register address map

| Address | Register name |
| --- | --- | 
| 0x0 | Read/write test register 0 | 
| 0x4 | Read/write test register 1 | 

## Microblaze core
A microblaze processor is included. It is currently not fully debugged. It has its own register address map to access the frequency counter registers. A UART is intended to be used which sends the output to the front panel via the HDMI connector.