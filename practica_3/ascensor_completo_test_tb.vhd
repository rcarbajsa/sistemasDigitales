LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ascensor_completo_test IS


END ascensor_completo_test;


ARCHITECTURE  ascensor_completo_arquitectura_test OF ascensor_completo_test IS
COMPONENT codifica_boton IS
     PORT(piso_donde_va: IN STD_LOGIC_VECTOR (2 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END COMPONENT;

COMPONENT FSM_ascensor IS 
	PORT (clk, reset: IN STD_LOGIC;
	codigo_piso: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
 	sube, baja: OUT STD_LOGIC;
 	piso_donde_esta: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)); 
END COMPONENT;	



FOR U0:codifica_boton USE ENTITY work.codifica_boton(arquitectura_cod_boton);
FOR U1:FSM_ascensor USE ENTITY work.FSM_ascensor(FSM_arquitectura);


     CONSTANT periodo : TIME := 20 ns;
     SIGNAL sube:std_logic;
     SIGNAL baja:std_logic;
     SIGNAL clk: std_logic:='1';
     SIGNAL reset:std_logic:='1';
     SIGNAL piso_donde_esta:std_logic_vector(1 DOWNTO 0);
     SIGNAL B: std_logic_vector(2 DOWNTO 0);
     SIGNAL c: std_logic_vector(1 DOWNTO 0);
BEGIN
 U0:codifica_boton PORT MAP(piso_donde_va=>B,codigo_piso=>c);
U1:FSM_ascensor PORT MAP(clk=>clk,reset=>reset,codigo_piso=>c,sube=>sube,baja=>baja,piso_donde_esta=>piso_donde_esta);


clk <= NOT clk AFTER periodo;
 reset <= '0', '1' after 1 ns;

	B <= "000",
         "001" AFTER periodo,
         "010" AFTER 2*periodo,
         "100" AFTER 3*periodo,
         "011" AFTER 4*periodo,
	 "101" AFTER 5*periodo,
         "111" AFTER 6*periodo,
         "110" AFTER 7*periodo,
         "000" AFTER 8*periodo;


END ascensor_completo_arquitectura_test;
