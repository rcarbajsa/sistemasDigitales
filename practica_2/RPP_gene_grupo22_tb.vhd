LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regPPtest IS
END regPPtest;

ARCHITECTURE regPPtestArch OF regPPtest IS
     COMPONENT registro_PP IS
          GENERIC (retardo: time:= 0 ns; num_bits:natural);
          PORT(clear, clk: IN std_logic; ent_datos : IN std_logic_vector (num_bits-1 DOWNTO 0); sal_datos: OUT std_logic_vector (num_bits-1 DOWNTO 0));
     END COMPONENT;
     
	CONSTANT N_BITS: integer:= 5;
	

     SIGNAL reloj: std_logic:='1';
     SIGNAL reset: std_logic;
     SIGNAL tabla_entrada: std_logic_vector(N_BITS-1 DOWNTO 0);
     SIGNAL tabla_salida: std_logic_vector(N_BITS-1 DOWNTO 0);
BEGIN
    id: registro_PP GENERIC MAP(num_bits=>N_BITS) PORT MAP(clear=>reset, clk=>reloj, ent_datos=>tabla_entrada, sal_datos=> tabla_salida);

     reset<= '1',
             '0' AFTER 50 ns;

     reloj<= NOT reloj AFTER 5 ns;

     tabla_entrada<= "00000",
               "00001" AFTER 10 ns,
               "00010" AFTER 20 ns,
               "01100" AFTER 30 ns,
               "10011" AFTER 40 ns,
	       "01100" AFTER 50 ns,
               "11110" AFTER 60 ns,
               "11101" AFTER 70 ns,
               "11000" AFTER 80 ns,
	       "01010" AFTER 90 ns,
               "11111" AFTER 100 ns;
END regPPtestArch;




