-- VHDL Entity alien_game_lib.c5_t2_reg_bank.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:05:06 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_reg_bank IS
   PORT( 
      clk        : IN     std_logic;
      frame_done : IN     std_logic;
      pixd_in    : IN     std_logic_vector (23 DOWNTO 0);
      rst_n      : IN     std_logic;
      write      : IN     std_logic;
      xr         : IN     std_logic_vector (7 DOWNTO 0);
      xw         : IN     std_logic_vector (7 DOWNTO 0);
      yr         : IN     std_logic_vector (7 DOWNTO 0);
      yw         : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out   : OUT    std_logic_vector (23 DOWNTO 0);
      w_rdy      : OUT    std_logic
   );

-- Declarations

END c5_t2_reg_bank ;

--
-- VHDL Architecture alien_game_lib.c5_t2_reg_bank.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 18:05:06 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c5_t2_reg_bank IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL en_w      : std_logic;
   SIGNAL en_w0     : std_logic;
   SIGNAL en_w1     : std_logic;
   SIGNAL pixd_out0 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL to_read   : std_logic;
   SIGNAL to_write  : std_logic;
   SIGNAL w_done    : std_logic;


   -- ModuleWare signal declarations(v1.12) for instance 'U_10' of 'adff'
   SIGNAL mw_U_10reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'U_11' of 'adff'
   SIGNAL mw_U_11reg_cval : std_logic;

   -- Component Declarations
   COMPONENT c5_t2_col_of_row
   PORT (
      clk      : IN     std_logic ;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      rst_n    : IN     std_logic ;
      write    : IN     std_logic ;
      xr       : IN     std_logic_vector (7 DOWNTO 0);
      xw       : IN     std_logic_vector (7 DOWNTO 0);
      yr       : IN     std_logic_vector (7 DOWNTO 0);
      yw       : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c5_t2_w_rdy
   PORT (
      clk        : IN     std_logic ;
      frame_done : IN     std_logic ;
      rst_n      : IN     std_logic ;
      w_rdy      : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c5_t2_col_of_row USE ENTITY alien_game_lib.c5_t2_col_of_row;
   FOR ALL : c5_t2_w_rdy USE ENTITY alien_game_lib.c5_t2_w_rdy;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_10' of 'adff'
   to_write <= mw_U_10reg_cval;
   to_read <= NOT(mw_U_10reg_cval);
   u_10seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_10reg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_10reg_cval <= en_w;
      END IF;
   END PROCESS u_10seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'adff'
   w_done <= mw_U_11reg_cval;
   u_11seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_11reg_cval <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_11reg_cval <= frame_done;
      END IF;
   END PROCESS u_11seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'and'
   en_w0 <= write AND en_w;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'and'
   en_w1 <= write AND NOT(en_w);

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(to_write, to_read, w_done)
   BEGIN
      CASE w_done IS
      WHEN '0' => en_w <= to_write;
      WHEN '1' => en_w <= to_read;
      WHEN OTHERS => en_w <= 'X';
      END CASE;
   END PROCESS u_2combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(pixd_out0, pixd_out1, en_w)
   BEGIN
      CASE en_w IS
      WHEN '0' => pixd_out <= pixd_out0;
      WHEN '1' => pixd_out <= pixd_out1;
      WHEN OTHERS => pixd_out <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- Instance port mappings.
   U_0 : c5_t2_col_of_row
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         write    => en_w0,
         xr       => xr,
         xw       => xw,
         yr       => yr,
         yw       => yw,
         pixd_out => pixd_out0
      );
   U_1 : c5_t2_col_of_row
      PORT MAP (
         clk      => clk,
         pixd_in  => pixd_in,
         rst_n    => rst_n,
         write    => en_w1,
         xr       => xr,
         xw       => xw,
         yr       => yr,
         yw       => yw,
         pixd_out => pixd_out1
      );
   U_7 : c5_t2_w_rdy
      PORT MAP (
         clk        => clk,
         frame_done => frame_done,
         rst_n      => rst_n,
         w_rdy      => w_rdy
      );

END struct;
