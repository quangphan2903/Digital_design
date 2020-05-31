-- VHDL Entity alien_game_lib.c3_t1_gun_module.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:49:33 05/31/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t1_gun_module IS
   PORT( 
      btn        : IN     std_logic_vector (3 DOWNTO 0);
      clk        : IN     std_logic;
      enable     : IN     std_logic;
      gun_px_idx : IN     std_logic_vector (1 DOWNTO 0);
      rst_n      : IN     std_logic;
      gun_color  : OUT    std_logic_vector (23 DOWNTO 0);
      middle_x   : OUT    std_logic_vector (7 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c3_t1_gun_module ;

--
-- VHDL Architecture alien_game_lib.c3_t1_gun_module.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:49:33 05/31/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c3_t1_gun_module IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din1          : std_logic_vector(7 DOWNTO 0);
   SIGNAL dir           : std_logic_vector(1 DOWNTO 0);
   SIGNAL dout          : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout1         : std_logic_vector(7 DOWNTO 0);
   SIGNAL l_shift       : std_logic;
   SIGNAL r_shift       : std_logic;
   SIGNAL x_00          : std_logic_vector(7 DOWNTO 0);
   SIGNAL x_10          : std_logic_vector(7 DOWNTO 0);
   SIGNAL x_left_shift  : std_logic_vector(7 DOWNTO 0);
   SIGNAL x_right_shift : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_11_sel      : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL gun_color_internal : std_logic_vector (23 DOWNTO 0);
   SIGNAL middle_x_internal  : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_5' of 'adff'
   SIGNAL mw_U_5reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'gun_color' of 'adff'
   SIGNAL mw_gun_colorreg_cval : std_logic_vector(23 DOWNTO 0);

   -- Component Declarations
   COMPONENT c2_t3_left_shifter
   PORT (
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t4_right_shifter
   PORT (
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t3_left_shifter USE ENTITY alien_game_lib.c2_t3_left_shifter;
   FOR ALL : c2_t4_right_shifter USE ENTITY alien_game_lib.c2_t4_right_shifter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_5' of 'adff'
   middle_x_internal <= mw_U_5reg_cval;
   u_5seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_5reg_cval <= "00010000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_5reg_cval <= dout;
      END IF;
   END PROCESS u_5seq_proc;

   -- ModuleWare code(v1.12) for instance 'gun_color' of 'adff'
   gun_color_internal <= mw_gun_colorreg_cval;
   gun_colorseq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_gun_colorreg_cval <= "100000001000000010000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_gun_colorreg_cval <= gun_color_internal;
      END IF;
   END PROCESS gun_colorseq_proc;

   -- ModuleWare code(v1.12) for instance 'l_shift' of 'and'
   l_shift <= NOT(middle_x_internal(6)) AND btn(1) AND enable;

   -- ModuleWare code(v1.12) for instance 'r_shift' of 'and'
   r_shift <= enable AND btn(3) AND NOT(middle_x_internal(1));

   -- ModuleWare code(v1.12) for instance 'y_11' of 'and'
   y_11_sel <= gun_px_idx(0) AND gun_px_idx(1);

   -- ModuleWare code(v1.12) for instance 'const_y_11' of 'constval'
   din1 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'const_y_not_11' of 'constval'
   dout1 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'shift' of 'merge'
   dir <= l_shift & r_shift;

   -- ModuleWare code(v1.12) for instance 'x_move' of 'mux'
   x_movecombo_proc: PROCESS(middle_x_internal, x_right_shift, 
                             x_left_shift, dir)
   BEGIN
      CASE dir IS
      WHEN "00" => dout <= middle_x_internal;
      WHEN "01" => dout <= x_right_shift;
      WHEN "10" => dout <= x_left_shift;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS x_movecombo_proc;

   -- ModuleWare code(v1.12) for instance 'x_px_idx' of 'mux'
   x_px_idxcombo_proc: PROCESS(x_00, middle_x_internal, x_10, 
                               gun_px_idx)
   BEGIN
      CASE gun_px_idx IS
      WHEN "00" => x_coord <= x_00;
      WHEN "01" => x_coord <= middle_x_internal;
      WHEN "10" => x_coord <= x_10;
      WHEN "11" => x_coord <= middle_x_internal;
      WHEN OTHERS => x_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS x_px_idxcombo_proc;

   -- ModuleWare code(v1.12) for instance 'y_coord' of 'mux'
   y_coordcombo_proc: PROCESS(dout1, din1, y_11_sel)
   BEGIN
      CASE y_11_sel IS
      WHEN '0' => y_coord <= dout1;
      WHEN '1' => y_coord <= din1;
      WHEN OTHERS => y_coord <= (OTHERS => 'X');
      END CASE;
   END PROCESS y_coordcombo_proc;

   -- Instance port mappings.
   U_3 : c2_t3_left_shifter
      PORT MAP (
         data_in  => middle_x_internal,
         data_out => x_left_shift
      );
   U_6 : c2_t3_left_shifter
      PORT MAP (
         data_in  => middle_x_internal,
         data_out => x_00
      );
   U_2 : c2_t4_right_shifter
      PORT MAP (
         data_in  => middle_x_internal,
         data_out => x_right_shift
      );
   U_4 : c2_t4_right_shifter
      PORT MAP (
         data_in  => middle_x_internal,
         data_out => x_10
      );

   -- Implicit buffered output assignments
   gun_color <= gun_color_internal;
   middle_x  <= middle_x_internal;

END struct;
