library ieee;
use ieee.std_logic_1164.all;

			 use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


			 package ddr_ctl_auk_ddr_datapath_pack is

  component ddr_ctl_auk_ddr_datapath is
PORT (
    signal ddr_dm : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        signal ddr_dqs : INOUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        signal clk_to_sdram : OUT STD_LOGIC;
        signal control_rdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal ddr_dq : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        signal clk_to_sdram_n : OUT STD_LOGIC;
        signal capture_clk : IN STD_LOGIC;
        signal resynch_clk : IN STD_LOGIC;
        signal control_wdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal reset_n : IN STD_LOGIC;
        signal control_wdata_valid : IN STD_LOGIC;
        signal write_clk : IN STD_LOGIC;
        signal control_doing_wr : IN STD_LOGIC;
        signal control_doing_rd : IN STD_LOGIC;
        signal control_be : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        signal control_dqs_burst : IN STD_LOGIC;
        signal clk : IN STD_LOGIC;
        signal postamble_clk : IN STD_LOGIC
      );
  end component ddr_ctl_auk_ddr_datapath;



 end ddr_ctl_auk_ddr_datapath_pack;