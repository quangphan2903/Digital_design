-- VHDL Entity alien_game_lib.c3_t2_top_level.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:49:38 05/31/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_top_level IS
   PORT( 
      btn            : IN     std_logic_vector (3 DOWNTO 0);
      clk            : IN     std_logic;
      rst_n          : IN     std_logic;
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      your_signals   : OUT    std_logic
   );

-- Declarations

END c3_t2_top_level ;

--
-- VHDL Architecture alien_game_lib.c3_t2_top_level.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 21:49:38 05/31/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY pre_made;

ARCHITECTURE struct OF c3_t2_top_level IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL alien_color    : std_logic_vector(23 DOWNTO 0);
   SIGNAL alien_x_coord  : std_logic_vector(7 DOWNTO 0);
   SIGNAL alien_y_coord  : std_logic_vector(7 DOWNTO 0);
   SIGNAL bullet_color   : std_logic_vector(23 DOWNTO 0);
   SIGNAL bullet_x_coord : std_logic_vector(7 DOWNTO 0);
   SIGNAL bullet_y_coord : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout           : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout1          : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout2          : std_logic_vector(23 DOWNTO 0);
   SIGNAL enable         : std_logic;
   SIGNAL frame_done     : std_logic;
   SIGNAL gun_color      : std_logic_vector(23 DOWNTO 0);
   SIGNAL gun_px_idx     : std_logic_vector(1 DOWNTO 0);
   SIGNAL gun_x_coord    : std_logic_vector(7 DOWNTO 0);
   SIGNAL gun_y_coord    : std_logic_vector(7 DOWNTO 0);
   SIGNAL middle_x       : std_logic_vector(7 DOWNTO 0);
   SIGNAL module_select  : std_logic_vector(1 DOWNTO 0);
   SIGNAL w_rdy          : std_logic;
   SIGNAL write          : std_logic;


   -- Component Declarations
   COMPONENT c2_t7_x_coord
   PORT (
      clk         : IN     std_logic ;
      enable      : IN     std_logic ;
      hit         : IN     std_logic ;
      rst_n       : IN     std_logic ;
      alien_color : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord     : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord     : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c3_t1_gun_module
   PORT (
      btn        : IN     std_logic_vector (3 DOWNTO 0);
      clk        : IN     std_logic ;
      enable     : IN     std_logic ;
      gun_px_idx : IN     std_logic_vector (1 DOWNTO 0);
      rst_n      : IN     std_logic ;
      gun_color  : OUT    std_logic_vector (23 DOWNTO 0);
      middle_x   : OUT    std_logic_vector (7 DOWNTO 0);
      x_coord    : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord    : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c3_t2_write_sequencer
   PORT (
      clk           : IN     std_logic ;
      rst_n         : IN     std_logic ;
      write_ready   : IN     std_logic ;
      enable        : OUT    std_logic ;
      frame_done    : OUT    std_logic ;
      gun_px_idx    : OUT    std_logic_vector (1 DOWNTO 0);
      module_select : OUT    std_logic_vector (1 DOWNTO 0);
      write         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT c3_t4_bullet
   PORT (
      btn            : IN     std_logic ;
      clk            : IN     std_logic ;
      en             : IN     std_logic ;
      gun_x_coord    : IN     std_logic_vector (7 DOWNTO 0);
      rst_n          : IN     std_logic ;
      bullet_color   : OUT    std_logic_vector (23 DOWNTO 0);
      bullet_x_coord : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_y_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT z_black_box_y
   PORT (
      clk            : IN     std_logic;
      color_BGR      : IN     std_logic_vector (23 DOWNTO 0);
      frame_done     : IN     std_logic;
      rst_n          : IN     std_logic;
      write          : IN     std_logic;
      x_coord        : IN     std_logic_vector (7 DOWNTO 0);
      y_coord        : IN     std_logic_vector (7 DOWNTO 0);
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      w_rdy          : OUT    std_logic;
      your_signals   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t7_x_coord USE ENTITY alien_game_lib.c2_t7_x_coord;
   FOR ALL : c3_t1_gun_module USE ENTITY alien_game_lib.c3_t1_gun_module;
   FOR ALL : c3_t2_write_sequencer USE ENTITY alien_game_lib.c3_t2_write_sequencer;
   FOR ALL : c3_t4_bullet USE ENTITY alien_game_lib.c3_t4_bullet;
   FOR ALL : z_black_box_y USE ENTITY pre_made.z_black_box_y;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(alien_x_coord, gun_x_coord, bullet_x_coord, 
                          module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => dout <= alien_x_coord;
      WHEN "01" => dout <= gun_x_coord;
      WHEN "10" => dout <= bullet_x_coord;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(alien_y_coord, gun_y_coord, bullet_y_coord, 
                          module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => dout1 <= alien_y_coord;
      WHEN "01" => dout1 <= gun_y_coord;
      WHEN "10" => dout1 <= bullet_y_coord;
      WHEN OTHERS => dout1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'mux'
   u_6combo_proc: PROCESS(alien_color, gun_color, bullet_color, 
                          module_select)
   BEGIN
      CASE module_select IS
      WHEN "00" => dout2 <= alien_color;
      WHEN "01" => dout2 <= gun_color;
      WHEN "10" => dout2 <= bullet_color;
      WHEN OTHERS => dout2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_6combo_proc;

   -- Instance port mappings.
   U_1 : c2_t7_x_coord
      PORT MAP (
         clk         => clk,
         enable      => enable,
         hit         => btn(0),
         rst_n       => rst_n,
         alien_color => alien_color,
         x_coord     => alien_x_coord,
         y_coord     => alien_y_coord
      );
   U_2 : c3_t1_gun_module
      PORT MAP (
         btn        => btn,
         clk        => clk,
         enable     => enable,
         gun_px_idx => gun_px_idx,
         rst_n      => rst_n,
         gun_color  => gun_color,
         middle_x   => middle_x,
         x_coord    => gun_x_coord,
         y_coord    => gun_y_coord
      );
   U_3 : c3_t2_write_sequencer
      PORT MAP (
         clk           => clk,
         rst_n         => rst_n,
         write_ready   => w_rdy,
         enable        => enable,
         frame_done    => frame_done,
         gun_px_idx    => gun_px_idx,
         module_select => module_select,
         write         => write
      );
   U_7 : c3_t4_bullet
      PORT MAP (
         btn            => btn(2),
         clk            => clk,
         en             => enable,
         gun_x_coord    => middle_x,
         rst_n          => rst_n,
         bullet_color   => bullet_color,
         bullet_x_coord => bullet_x_coord,
         bullet_y_coord => bullet_y_coord
      );
   U_0 : z_black_box_y
      PORT MAP (
         clk            => clk,
         color_BGR      => dout2,
         frame_done     => frame_done,
         rst_n          => rst_n,
         write          => write,
         x_coord        => dout,
         y_coord        => dout1,
         if_you_name    => if_you_name,
         iotre_will     => iotre_will,
         like_this      => like_this,
         of_this_course => of_this_course,
         throw_you_out  => throw_you_out,
         w_rdy          => w_rdy,
         your_signals   => your_signals
      );

END struct;
