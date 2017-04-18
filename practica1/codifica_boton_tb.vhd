LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY codifica_Test IS
END codifica_Test;


ARCHITECTURE  arquitectura_cod_boton_tb OF codifica_Test IS
     COMPONENT codifica_boton
          PORT(piso_donde_va: IN STD_LOGIC_VECTOR (2 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
     END COMPONENT;

     FOR X:codifica_boton USE ENTITY work.codifica_boton(arquitectura_cod_boton);

 
     SIGNAL piso_donde_va: std_logic_vector(2 DOWNTO 0);
     SIGNAL codigo_piso: std_logic_vector(1 DOWNTO 0);
BEGIN

     X: codifica_boton PORT MAP(piso_donde_va => piso_donde_va, codigo_piso => codigo_piso);
	--** Error: C:/SistemasDigitales/codifica_boton_tb.vhd(22): Enumeration literal '1' is not of type ieee.std_logic_1164.STD_LOGIC_VECTOR.
	piso_donde_va <= "000",
         "001" AFTER 20 ns,
         "010" AFTER 40 ns,
         "100" AFTER 80 ns,
         "011" AFTER 100 ns,
	 "101" AFTER 120 ns,
         "111" AFTER 140 ns,
         "110" AFTER 160 ns,
         "000" AFTER 180 ns;


END arquitectura_cod_boton_tb;

