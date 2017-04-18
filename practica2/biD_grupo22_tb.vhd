--TEST--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_test IS
END biestable_D_test;

ARCHITECTURE test_general OF biestable_D_test IS

     COMPONENT biestable_D_con_Clr IS
          GENERIC(retardo: time:= 0 ns);
          PORT(clear, clk, d: IN std_logic; q: OUT std_logic);
     END COMPONENT;

     FOR id: Biestable_D USE ENTITY WORK.biestable_D_con_Clr(flujo_asin);

     SIGNAL reloj: std_logic:= '1';
     SIGNAL entrada, reset: std_logic;
     SIGNAL salidaQ: std_logic;
BEGIN
    id: biestable_D_con_Clr PORT MAP(clear=>reset, clk=> reloj, d=>entrada, q=>salidaQ);

     reset<= '1',
             '0' AFTER 25 ns,
             '1' AFTER 50 ns;

     reloj<= NOT reloj AFTER 5 ns;

     entrada<= '1',
               '0' AFTER 10 ns,
               '1' AFTER 20 ns,
               '0' AFTER 30 ns,
               '1' AFTER 40 ns,
	       '0' AFTER 50 ns;

END test_general;