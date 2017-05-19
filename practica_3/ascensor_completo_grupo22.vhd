LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY ascensor_completo IS
	PORT(
	piso_donde_va: IN STD_LOGIC_VECTOR (1 DOWNTO 0); 
	codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END ascensor_completo;

ARCHITECTURE arquitectura_ascensor_completo OF ascensor_completo IS
BEGIN
 	PROCESS(piso_donde_va) -- IMPORTANTE: debemos incluir aquí todas las entradas que luego intervengan en el resto del código
                        -- asociado al bloque process 
             BEGIN
             CASE(piso_donde_va) IS 
               	WHEN "01" => codigo_piso <= "00";          
              	WHEN "10" => codigo_piso <= "01";          
              	WHEN "00" => codigo_piso <= "10";                   
              	WHEN OTHERS => codigo_piso <= "11";         -- Este caso no aparece en la tabla de verdad         
              END CASE;
         END PROCESS;
END arquitectura_ascensor_completo;
