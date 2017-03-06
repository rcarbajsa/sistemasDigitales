--------------------------------------------------------------------------- 
-- Proyecto: Primera práctica de Sistemas Digitales 
-- Diseño: Codificador 
-- Nombre del fichero: codifica_boton_grupo_22.vhd
-- Autor: Máximo García Martínez(y160242) y Raúl Carbajosa González(y160311) 
-- Fecha: 23/2/2017 
-- Versión:0.1 
-- Resumen: entidad y arquitectura de un      
-- codificador. 
-- Se utilizan el tipo de datos STD_LOGIC_VECTOR para todas las señales. 
-- La arquitectura se realiza en estilo comportamiento. 
-- 
-- Modificaciones: 
-- 
-- Fecha:               Autor            Versión       Descripción del cambio 
-- ======================================================================== 
-- 
-- 
-- ======================================================================== 

LIBRARY ieee;--Llamamos a la libreria ieee
USE ieee.std_logic_1164.all; --Importamos los elementos declarados dentro del PACKAGE std_logic_1164


--En la entidad declaramos la entrada (piso_donde_va) y la salida (codigo_piso) 
--sin especificar su funcionamiento
ENTITY codifica_boton IS
     PORT(piso_donde_va: IN STD_LOGIC_VECTOR (2 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END codifica_boton;

--------------------------------------------------------------------------------------------
--En la arquitectura declaramos la funcionalidad del circuito
ARCHITECTURE arquitectura_cod_boton OF  codifica_boton IS
    BEGIN
        PROCESS(piso_donde_va) --Incluimos la Entrada
             BEGIN
             CASE(piso_donde_va) IS 
               	WHEN "001" => codigo_piso <= "00";          
              	WHEN "010" => codigo_piso <= "01";          
              	WHEN "100" => codigo_piso <= "10";                   
              	WHEN OTHERS => codigo_piso <= "11";                  
              END CASE;
         END PROCESS;
    END  arquitectura_cod_boton;
