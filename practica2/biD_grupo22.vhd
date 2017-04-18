LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_con_Clr IS
     GENERIC(retardo: time:= 0 ns);
     PORT(clear, clk, d: IN std_logic; q: OUT std_logic);
END biestable_D_con_Clr;

ARCHITECTURE flujo_asin OF biestable_D_con_Clr IS
BEGIN
     q<= '0' AFTER retardo WHEN clear= '1' ELSE
         d AFTER retardo WHEN rising_edge(clk);
END flujo_asin;

