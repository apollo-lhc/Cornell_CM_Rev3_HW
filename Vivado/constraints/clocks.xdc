# 200 MHz oscillator
#create_clock -period 5.000 -name clk_200 -waveform {0.000 2.500} [get_nets clk_200]
create_clock -period 5.000 -name clk_200 -waveform {0.000 2.500} [get_ports p_clk_200]
# random
create_clock -period 10.000 -name lf_x12_r0_clk -waveform {0.000 5.000} [get_ports p_lf_x12_r0_clk]
create_clock -period 12.000 -name lf_x4_r0_clk -waveform {0.000 6.000} [get_ports p_lf_x4_r0_clk]
create_clock -period 14.000 -name rt_x12_r0_clk -waveform {0.000 7.000} [get_ports p_rt_x12_r0_clk]
create_clock -period 16.000 -name rt_x4_r0_clk -waveform {0.000 8.000} [get_ports p_rt_x4_r0_clk]

## 325 MHz clock from clock wizard
#create_generated_clock -name clk_325  [ get_nets clk_325_clk_wiz_0]
##create_generated_clock -period 3.076 -name clk_325  [ get_nets clk_325]
## 100 MHz clock from clock wizard
#create_generated_clock -period 10.000 -name clk_100  [ get_nets clk_100]
## 7 MHz clock
#create_generated_clock -period 143.08 -name clk_7 [ get_nets clk_7]

# LHC clock at 40 MHz
create_clock -period 25.000 -name lhc_clk -waveform {0.000 12.500} [get_ports p_lhc_clk]

# tcds clock at 40 MHz
create_clock -period 25.000 -name tcds40_clk -waveform {0.000 12.500} [get_ports p_tcds40_clk]


# not sure exactly what this does? 
set_clock_groups -asynchronous -group lf_x12_r0_clk -group lf_x4_r0_clk -group rt_x12_r0_clk -group rt_x4_r0_clk -group tcds40_clk -group lhc_clk -group clk_200 -group clk_325_clk_wiz_0 -group clk_100_clk_wiz_0 -group clk_7_clk_wiz_0
# includes generated clocks from clocking wizard