---------------------------------------------------------------------------
-- Este diseño es propietario el autor y puede ser utilizado con fines de
-- estudio
---------------------------------------------------------------------------
-- Proyecto: Tercera práctica de Sistemas Digitales
-- Diseño: Máquina de Estados Finitos
-- Nombre del fichero: NOMBRE DEL FICHERO.vhd
-- Autor: Raúl Carbajosa González (y160311) y Máximo García Martínez (y160242)
-- Fecha: 23/05/2017
-- Versión: 1.0
-- Resumen: Contiene una entidad y una arquitectura de una
-- máquina de estados finitos que controla el funcionamiento de un ascensor
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales.
-- La arquitectura se realiza en estilo ESTRUCTURAL.
-- Modificaciones:
--
-- Fecha Autor Versión Descripción del cambio
-- ========================================================================
--
-- ========================================================================
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
     SIGNAL reloj: std_logic:='1';
     SIGNAL reset:std_logic:='1';
     SIGNAL piso_donde_esta:std_logic_vector(1 DOWNTO 0);
     SIGNAL piso_donde_va: std_logic_vector(2 DOWNTO 0);
     SIGNAL codigo_piso: std_logic_vector(1 DOWNTO 0);

BEGIN
	U0:codifica_boton PORT MAP(piso_donde_va=>piso_donde_va,codigo_piso=>codigo_piso);
	U1:FSM_ascensor PORT MAP(clk=>reloj,reset=>reset,codigo_piso=>codigo_piso,sube=>sube,baja=>baja,piso_donde_esta=>piso_donde_esta);


reloj <= NOT reloj AFTER periodo;
 reset <= '0', '1' after 1 ns;

	piso_donde_va <= "000",
         "001" AFTER periodo,
         "010" AFTER 2*periodo,
         "100" AFTER 3*periodo,
         "011" AFTER 4*periodo,
	 "101" AFTER 5*periodo,
         "111" AFTER 6*periodo,
         "110" AFTER 7*periodo,
         "000" AFTER 8*periodo,
	 "001" AFTER 9*periodo,
	 "010" AFTER 10*periodo;


END ascensor_completo_arquitectura_test;
