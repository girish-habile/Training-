SET Serveroutput ON;
Set Verify Off;
SET Define ON;


--1
DECLARE
    TYPE Nestedtable_Type IS TABLE OF INTEGER INDEX BY BINARY_INTEGER;
    Nestedtable Nestedtable_Type; 

BEGIN
    Nestedtable(1) := 10; 
    Nestedtable(2) := 20; 
    Nestedtable(3) := 30; 
      Nestedtable(4) := 40;
        Nestedtable(5) :=50; 
    DBMS_OUTPUT.PUT_LINE('Number of elements in the nested table: ' || Nestedtable.COUNT);

    FOR i IN 1..Nestedtable.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || Nestedtable(i));
    END LOOP;
END;
/





