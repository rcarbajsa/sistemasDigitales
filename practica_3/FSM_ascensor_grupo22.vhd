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
ENTITY FSM_ascensor IS 
	PORT (clk, reset: IN STD_LOGIC;
	codigo_piso: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
 	sube, baja: OUT STD_LOGIC;
 	piso_donde_esta: OUT STD_LOGIC_VECTOR (1 DOWNTO 0)); 
END FSM_ascensor;		

ARCHITECTURE FSM_arquitectura OF FSM_ascensor IS
	TYPE pisos IS (piso0, piso1, piso2);
	SIGNAL e_actual, e_futuro: pisos := piso0;
BEGIN
	PROCESS (e_actual, codigo_piso)
	BEGIN
		CASE e_actual IS
			WHEN piso0 =>		
				IF codigo_piso = "00" THEN
					e_futuro <= piso0;
					sube <= '0';
					baja <= '0';
				ELSIF codigo_piso = "01" THEN
					e_futuro <= piso1;
					sube <= '1';
					baja <= '0';
				ELSE
					e_futuro <= piso2;
					sube <= '1';
					baja <= '0';
				END IF;
				piso_donde_esta <= "00";
			WHEN piso1 =>
				IF codigo_piso = "00" THEN
					e_futuro <= piso0;
					sube <= '0';
					baja <= '1';
				ELSIF codigo_piso = "01" THEN
					e_futuro <= piso1;
					sube <= '0';
					baja <= '0';
				ELSE
					e_futuro <= piso2;
					sube <= '1';
					baja <= '0';
				END IF;
				piso_donde_esta <= "01";
			WHEN piso2 =>
				IF codigo_piso = "00" THEN
					e_futuro <= piso0;
					sube <= '0';
					baja <= '1';
				ELSIF codigo_piso = "01" THEN
					e_futuro <= piso1;
					sube <= '0';
					baja <= '1';
				ELSE
					e_futuro <= piso2;
					sube <= '0';
					baja <= '0';
				END IF;
				piso_donde_esta <= "10";
		END CASE;
	END PROCESS;
	
	PROCESS
	BEGIN
		WAIT UNTIL (rising_edge(clk) OR reset = '0');
		IF(reset ='0') THEN
			e_actual <= piso0;
		ELSE
			e_actual <= e_futuro;
		END IF;
	END PROCESS;
END FSM_arquitectura;
