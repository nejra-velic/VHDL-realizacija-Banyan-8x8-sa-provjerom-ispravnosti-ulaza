LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY banjan_8x8 IS
	PORT (
	X1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X3: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X4: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X5: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X6: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X7: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	X8: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y1: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y2: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y3: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y4: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y5: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y6: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y7: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y8: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	C: OUT STD_LOGIC
	
	);
END banjan_8x8;
ARCHITECTURE arch_banjan_8x8 OF banjan_8x8 IS
    COMPONENT switch_2x2 IS
		PORT (
			X: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			U: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			V: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			C: OUT STD_LOGIC
		);
	END COMPONENT;
		COMPONENT provjera_bita IS
		PORT(
			X: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL B1, B2, B3, B4, B5, B6, B7, B8: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL P1, P2, P3, P4, P5, P6, P7, P8: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL C11, C21, C31, C41, C12, C22, C32, C42, C13, C23, C33, C43: STD_LOGIC;
BEGIN
	pb1: provjera_bita
	PORT MAP (
		X => X1,
		Y => B1
	);
	pb2: provjera_bita
	PORT MAP (
		X => X2,
		Y => B2
	);
	pb3: provjera_bita
	PORT MAP (
		X => X3,
		Y => B3
	);
	pb4: provjera_bita
	PORT MAP (
		X => X4,
		Y => B4
	);
	pb5: provjera_bita
	PORT MAP (
		X => X5,
		Y => B5
	);
	pb6: provjera_bita
	PORT MAP (
		X => X6,
		Y => B6
	);
	pb7: provjera_bita
	PORT MAP (
		X => X7,
		Y => B7
	);
	pb8: provjera_bita
	PORT MAP (
		X => X8,
		Y => B8
	);
	
	sw11: switch_2x2
	PORT MAP (
		X => B1,
		Y => B5,
		S => "11",
		U => P1,
		V => P2,
		C => C11
	);
   sw21: switch_2x2
	PORT MAP (
		X => B2,
		Y => B6,
		S => "11",
		U => P3,
		V => P4,
		C => C21
	);
	sw31: switch_2x2
	PORT MAP (
		X => B3,
		Y => B7,
		S => "11",
		U => P5,
		V => P6,
		C => C31
	);
	sw41: switch_2x2
	PORT MAP (
		X => B4,
		Y => B8,
		S => "11",
		U => P7,
		V => P8,
		C => C41
	);
	sw12: switch_2x2
	PORT MAP (
		X => P1,
		Y => P5,
		S => "10",
		U => Q1,
		V => Q2,
		C => C12
	);
	sw22: switch_2x2
	PORT MAP (
		X => P3,
		Y => P7,
		S => "10",
		U => Q3,
		V => Q4,
		C => C22
	);
	sw32: switch_2x2
	PORT MAP (
		X => P2,
		Y => P6,
		S => "10",
		U => Q5,
		V => Q6,
		C => C32
	);
	sw42: switch_2x2
	PORT MAP (
		X => P4,
		Y => P8,
		S => "10",
		U => Q7,
		V => Q8,
		C => C42
	);
	sw13: switch_2x2
	PORT MAP (
		X => Q1,
		Y => Q3,
		S => "01",
		U => Y1,
		V => Y2,
		C => C13
	);
	sw23: switch_2x2
	PORT MAP (
		X => Q2,
		Y => Q4,
		S => "01",
		U => Y3,
		V => Y4,
		C => C23
	);
	sw33: switch_2x2
	PORT MAP (
		X => Q5,
		Y => Q7,
		S => "01",
		U => Y5,
		V => Y6,
		C => C33
	);
	sw43: switch_2x2
	PORT MAP (
		X => Q6,
		Y => Q8,
		S => "01",
		U => Y7,
		V => Y8,
		C => C43
	);
	C <= C11 OR C21 OR C31 OR C41 OR C12 OR C22 OR C32 OR C42 OR C13 OR C23 OR C33 OR C43;
END ARCHITECTURE;
	