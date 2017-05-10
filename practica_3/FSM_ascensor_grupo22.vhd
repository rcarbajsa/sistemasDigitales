
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FSM_ascensor IS 
	PORT (clk, reset: IN STD_LOGIC; -- activo por flanco de subida
	codigo_piso: IN STD_LOGIC_VECTOR (1 DOWNTO 0); --código binario del Nº de piso pulsado
 	sube, baja: OUT STD_LOGIC; -- dirección movimiento del motor
 	piso_donde_esta: OUT STD_LOGIC_VECTOR (1 DOWNTO 0)); -- código binario del piso donde se
 	--encuentra que coincide con el código asignado a la luz del panel 
END FSM_ascensor;

ARCHITECTURE FSM_arquitectura OF FSM_ascensor IS
	TYPE pisos IS (piso0, piso1, piso2);
	SIGNAL e_actual, e_futuro: pisos := piso0;
BEGIN
	PROCESS (e_actual, codigo_piso)
	BEGIN
		CASE e_actual IS
			WHEN piso0 =>
				IF codigo_piso = "01" THEN
					e_futuro <= piso1;
					sube <= '1';
					baja <= '0';
				ELSE
					e_futuro <= piso2;
					sube <= '1';
					baja <= '0';
				END IF;
			WHEN piso1 =>
				IF codigo_piso = "10" THEN
					e_futuro <= piso2;
					sube <= '1';
					baja <= '0';
				ELSE 
					e_futuro <= piso0;
					sube <= '0';
					baja <= '1';
				END IF;
			WHEN piso2 =>
				IF codigo_piso = "01" THEN
					e_futuro <= piso1;
					sube <= '0';
					baja <= '1';
				ELSE 
					e_futuro <= piso0;
					sube <= '0';
					baja <= '1';
				END IF;
		END CASE;
	END PROCESS;

	PROCESS (e_actual, codigo_piso)
	BEGIN 
		IF(e_actual = piso2 AND codigo_piso = "11") THEN
			piso_donde_esta<="11";
		ELSE
			piso_donde_esta<="00";
		END IF;
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