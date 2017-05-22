LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY ascensor_completo Is
PORT(B:IN std_logic_vector(2 DOWNTO 0);clk,reset:IN std_logic; 
sube,baja:OUT std_logic;piso_donde_esta:OUT std_logic_vector(1 DOWNTO 0));
END ascensor_completo;

ARCHITECTURE arquitectura_ascensor_completo OF ascensor_completo IS


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
FOR U1:fsm_ascensor USE ENTITY work.fsm_ascensor(fsm_aquitectura);
SIGNAL c:std_logic_vector(1 DOWNTO 0);


BEGIN
U0:codifica_boton PORT MAP(piso_donde_va=>B,codigo_piso=>c);
U1:FSM_ascensor PORT MAP(clk=>clk,reset=>reset,codigo_piso=>c,sube=>sube,baja=>baja,piso_donde_esta=>piso_donde_esta);
END arquitectura_ascensor_completo;
