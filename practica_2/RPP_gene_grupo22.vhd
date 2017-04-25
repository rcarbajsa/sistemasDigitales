LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registro_PP IS
	GENERIC (retardo:time:= 0 ns; num_bits:natural);
	PORT(ent_datos:IN std_logic_vector (num_bits-1 DOWNTO 0);clear, clk: IN std_logic;sal_datos: OUT std_logic_vector (num_bits-1 DOWNTO 0));
END registro_PP;

ARCHITECTURE con_generate OF registro_PP IS
	COMPONENT biestable_D_con_Clr IS
		GENERIC(retardo: time:= 0 ns);
		PORT(clear, clk, D: IN std_logic; Q: OUT std_logic);
	END COMPONENT;
	BEGIN
		C: FOR I IN 0 TO num_bits-1 GENERATE
			C:  biestable_D_con_Clr PORT MAP(clear => clear, clk=> clk, D=> ent_datos(I), Q=>sal_datos(I));
		END GENERATE;
END con_generate;
