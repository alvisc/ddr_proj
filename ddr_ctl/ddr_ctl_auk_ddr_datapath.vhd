--Legal Notice: (C)2025 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ddr_ctl_auk_ddr_datapath is 
        port (
              -- inputs:
                 signal capture_clk : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal control_be : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal control_doing_rd : IN STD_LOGIC;
                 signal control_doing_wr : IN STD_LOGIC;
                 signal control_dqs_burst : IN STD_LOGIC;
                 signal control_wdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal control_wdata_valid : IN STD_LOGIC;
                 signal postamble_clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal resynch_clk : IN STD_LOGIC;
                 signal write_clk : IN STD_LOGIC;

              -- outputs:
                 signal clk_to_sdram : OUT STD_LOGIC;
                 signal clk_to_sdram_n : OUT STD_LOGIC;
                 signal control_rdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal ddr_dm : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal ddr_dq : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal ddr_dqs : INOUT STD_LOGIC_VECTOR (1 DOWNTO 0)
              );
end entity ddr_ctl_auk_ddr_datapath;


architecture europa of ddr_ctl_auk_ddr_datapath is
  component ddr_ctl_auk_ddr_clk_gen is
PORT (
    signal clk_to_sdram : OUT STD_LOGIC;
        signal clk_to_sdram_n : OUT STD_LOGIC;
        signal clk : IN STD_LOGIC;
        signal reset_n : IN STD_LOGIC
      );
  end component ddr_ctl_auk_ddr_clk_gen;
  component ddr_ctl_auk_ddr_dqs_group is
PORT (
    signal ddr_dm : OUT STD_LOGIC;
        signal ddr_dqs : INOUT STD_LOGIC;
        signal control_rdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        signal ddr_dq : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        signal capture_clk : IN STD_LOGIC;
        signal resynch_clk : IN STD_LOGIC;
        signal control_wdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        signal reset_n : IN STD_LOGIC;
        signal control_wdata_valid : IN STD_LOGIC;
        signal write_clk : IN STD_LOGIC;
        signal control_doing_wr : IN STD_LOGIC;
        signal control_doing_rd : IN STD_LOGIC;
        signal control_be : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        signal control_dqs_burst : IN STD_LOGIC;
        signal clk : IN STD_LOGIC;
        signal postamble_clk : IN STD_LOGIC
      );
  end component ddr_ctl_auk_ddr_dqs_group;
                signal be_temp :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal capture_clk_int :  STD_LOGIC;
                signal internal_clk_to_sdram :  STD_LOGIC;
                signal internal_clk_to_sdram_n :  STD_LOGIC;
                signal internal_ddr_dm :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal postamble_clk_int :  STD_LOGIC;
                signal rdata_temp :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal resynch_clk_int :  STD_LOGIC;
                signal wdata_temp :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal write_clk_int :  STD_LOGIC;

begin

  --
  --************************
  -- Clock generator module 
  ddr_clk_gen : ddr_ctl_auk_ddr_clk_gen
    port map(
            clk => clk,
            clk_to_sdram => internal_clk_to_sdram,
            clk_to_sdram_n => internal_clk_to_sdram_n,
            reset_n => reset_n
    );

  --
  --**********************************
  -- DQS group instantiation for dqs[0] 
  wdata_temp(15 DOWNTO 0) <= Std_Logic_Vector'(control_wdata(23 DOWNTO 16) & control_wdata(7 DOWNTO 0));
  control_rdata(23 DOWNTO 16) <= rdata_temp(15 DOWNTO 8);
  control_rdata(7 DOWNTO 0) <= rdata_temp(7 DOWNTO 0);
  be_temp(1 DOWNTO 0) <= Std_Logic_Vector'(A_ToStdLogicVector(control_be(2)) & A_ToStdLogicVector(control_be(0)));
  \g_datapath:0:g_ddr_io\ : ddr_ctl_auk_ddr_dqs_group
    port map(
            capture_clk => capture_clk_int,
            clk => clk,
            control_be => be_temp(1 DOWNTO 0),
            control_doing_rd => control_doing_rd,
            control_doing_wr => control_doing_wr,
            control_dqs_burst => control_dqs_burst,
            control_rdata => rdata_temp(15 DOWNTO 0),
            control_wdata => wdata_temp(15 DOWNTO 0),
            control_wdata_valid => control_wdata_valid,
            ddr_dm => internal_ddr_dm(0),
            ddr_dq => ddr_dq(7 DOWNTO 0),
            ddr_dqs => ddr_dqs(0),
            postamble_clk => postamble_clk_int,
            reset_n => reset_n,
            resynch_clk => resynch_clk_int,
            write_clk => write_clk_int
    );

  --
  --**********************************
  -- DQS group instantiation for dqs[1] 
  wdata_temp(31 DOWNTO 16) <= Std_Logic_Vector'(control_wdata(31 DOWNTO 24) & control_wdata(15 DOWNTO 8));
  control_rdata(31 DOWNTO 24) <= rdata_temp(31 DOWNTO 24);
  control_rdata(15 DOWNTO 8) <= rdata_temp(23 DOWNTO 16);
  be_temp(3 DOWNTO 2) <= Std_Logic_Vector'(A_ToStdLogicVector(control_be(3)) & A_ToStdLogicVector(control_be(1)));
  \g_datapath:1:g_ddr_io\ : ddr_ctl_auk_ddr_dqs_group
    port map(
            capture_clk => capture_clk_int,
            clk => clk,
            control_be => be_temp(3 DOWNTO 2),
            control_doing_rd => control_doing_rd,
            control_doing_wr => control_doing_wr,
            control_dqs_burst => control_dqs_burst,
            control_rdata => rdata_temp(31 DOWNTO 16),
            control_wdata => wdata_temp(31 DOWNTO 16),
            control_wdata_valid => control_wdata_valid,
            ddr_dm => internal_ddr_dm(1),
            ddr_dq => ddr_dq(15 DOWNTO 8),
            ddr_dqs => ddr_dqs(1),
            postamble_clk => postamble_clk_int,
            reset_n => reset_n,
            resynch_clk => resynch_clk_int,
            write_clk => write_clk_int
    );

  --vhdl renameroo for output signals
  clk_to_sdram <= internal_clk_to_sdram;
  --vhdl renameroo for output signals
  clk_to_sdram_n <= internal_clk_to_sdram_n;
  --vhdl renameroo for output signals
  ddr_dm <= internal_ddr_dm;
--synthesis translate_off
    write_clk_int <=  transport NOT clk after 2500 ps ;
    resynch_clk_int <= resynch_clk;
    postamble_clk_int <=  transport NOT clk after 2500 ps ;
    capture_clk_int <= capture_clk;
--synthesis translate_on
--synthesis read_comments_as_HDL on
--    write_clk_int <= write_clk;
--    resynch_clk_int <= resynch_clk;
--    postamble_clk_int <= postamble_clk;
--    capture_clk_int <= capture_clk;
--synthesis read_comments_as_HDL off

end europa;

