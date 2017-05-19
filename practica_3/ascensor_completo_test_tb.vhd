
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY ascensor_completo_test IS
	
END ascensor_completo_test;

ARCHITECTURE ascensor_completo_arquitectura_test OF ascensor_completo_test IS
COMPONENT ascensor_completo
          PORT(piso_donde_va: IN STD_LOGIC_VECTOR (1 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
     END COMPONENT;

     FOR X:ascensor_completo USE ENTITY work.ascensor_completo(arquitectura_ascensor_completo);

     CONSTANT periodo : TIME := 20 ns; 
     SIGNAL piso_donde_va: std_logic_vector(1 DOWNTO 0);
     SIGNAL codigo_piso: std_logic_vector(1 DOWNTO 0);

BEGIN

     X: ascensor_completo PORT MAP(piso_donde_va => piso_donde_va, codigo_piso => codigo_piso);
	piso_donde_va <= "00",
         "01" AFTER (periodo * 1),
         "10" AFTER (periodo * 2),
         "10" AFTER (periodo * 3),
         "11" AFTER (periodo * 4),
	 "10" AFTER (periodo * 5),
         "11" AFTER (periodo * 6),
         "10" AFTER (periodo * 7),
         "00" AFTER (periodo * 8);
	

END ascensor_completo_arquitectura_test;
