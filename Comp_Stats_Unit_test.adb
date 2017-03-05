

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
with CompStats_Statistics;
use CompStats_Statistics;


procedure Comp_Stats_Unit_test is

    Values: CompStats_Statistics.Values_Array(1..20);
    Values2 : CompStats_Statistics.Values_Array(1..10);


    procedure Test_Get_Count (Values : CompStats_Statistics.Values_Array) is

        Result : INTEGER;

    begin
        Put("Get_Count : ");
        Result := Get_Count(Values);
        if Result = 20 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Count;


    procedure Test_Get_Minimum (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Minimum : ");
        Result := Get_Minimum(Values);
        if Result = -1.405158 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Minimum;


    procedure Test_Get_Maximum (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Maximum : ");
        Result := Get_Maximum(Values);
        if Result = 2.614303 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Maximum;


    procedure Test_Get_Range (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Range : ");
        Result := Get_Range(Values);
        if Result = 4.019462 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Range;


    procedure Test_Get_Sum (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Sum : ");
        Result := Get_Sum(Values);
        if Result = 4.070304 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Sum;


    procedure Test_Get_Mean (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Mean : ");
        Result := Get_Mean (Values);
        if Result = 0.2035152 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Mean;


    procedure Test_Get_Sum_Of_Squares (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Sum_Of_Squares : ");
        Result := Get_Sum_Of_Squares (Values);
        if Result = 24.19856 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Sum_Of_Squares;


    procedure Test_Get_Population_Variance (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Population_Variance : ");
        Result := Get_Population_Variance (Values);
        if Result = 1.209928 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Population_Variance;

    
    procedure Test_Get_Sample_Variance (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Sample_Variance : ");
        Result := Get_Sample_Variance (Values);
        if Result = 1.273608 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Sample_Variance;


    procedure Test_Get_Population_Standard_Deviation (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Population_Standard_Deviation : ");
        Result := Get_Population_Standard_Deviation (Values);
        if Result = 1.099967 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Population_Standard_Deviation;


    procedure Test_Get_Sample_Standard_Deviation (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Sample_Standard_Deviation : ");
        Result := Get_Sample_Standard_Deviation (Values);
        if Result = 1.128543 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Sample_Standard_Deviation;


    procedure Test_Get_Standard_Error_of_Mean (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Standard_Error_of_Mean : ");
        Result := Get_Standard_Error_of_Mean (Values);
        if Result = 0.2523498 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Standard_Error_of_Mean;


    procedure Test_Get_Coefficient_Of_Variation (Values : CompStats_Statistics.Values_Array) is

        Result : FLOAT;

    begin
        Put("Get_Coefficient_Of_Variation : ");
        Result := Get_Coefficient_Of_Variation (Values);
        if Result = 5.54525 then
            Put("True");
        else 
            Put(" False - ");
            Put(Result);
        end if;
        New_Line;
    end Test_Get_Coefficient_Of_Variation;


    procedure Test_Get_Unique_Values (Values : CompStats_Statistics.Values_Array) is

    begin
        Put("Get_Unique_Values : ");
        declare 
            Result : CompStats_Statistics.Values_Array := Get_Unique_Values (Values);
        begin
            for index in Integer range 1..Result'Length loop
                put(Result(index));
                put(", ");
            end loop;
            New_Line;
        end;
    end Test_Get_Unique_Values;



begin
    Values := (0.4926728,-0.9673927, -0.4806392, 1.8226585, -1.3384936, 1.1307992, -0.3709324, 2.6143034, 0.6338060, -1.1862009, -0.5621848, 0.7465022, 1.8787472, -0.1642065, -1.4051581, 0.1519102, 0.1349542, 0.8196982, -0.7524447, 0.8719052);
    Values2 := (1.0, 1.0, 1.0, 2.3, 2.3, 2.3, -1.0, -1.0, -6.0, 0.0);
    Test_Get_Count      (Values);
    Test_Get_Minimum    (Values);
    Test_Get_Maximum    (Values);
    Test_Get_Range      (Values);
    Test_Get_Sum        (Values);
    Test_Get_Mean       (Values);
    Test_Get_Sum_Of_Squares (Values);
    Test_Get_Population_Variance (Values);
    Test_Get_Sample_Variance (Values);
    Test_Get_Population_Standard_Deviation (Values);
    Test_Get_Sample_Standard_Deviation (Values);
    Test_Get_Standard_Error_of_Mean (Values);
    Test_Get_Coefficient_Of_Variation (Values);
    Test_Get_Unique_Values (Values2);

    
end Comp_Stats_Unit_test;


-- 0.4926728,-0.9673927, -0.4806392, 1.8226585, -1.3384936, 1.1307992, -0.3709324, 2.6143034, 0.6338060, -1.1862009, -0.5621848, 0.7465022, 1.8787472, -0.1642065, -1.4051581, 0.1519102, 0.1349542, 0.8196982, -0.7524447, 0.8719052
