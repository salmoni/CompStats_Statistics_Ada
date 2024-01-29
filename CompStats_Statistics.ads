package CompStats_Statistics is

    
    type Values_Array is array (Integer range <>) of Float;

    type Frequencies_Array is array (Integer range <>) of Integer;

    type Values_and_Frequencies_Record is record
        -- A record that has two vectors (a linked list):
        -- The first vector is a list of unique values in the incoming array
        -- The second vector is a list of frequencies of each unique value
        Values      : Values_Array;
        Frequencies : Frequencies_Array;
    end record;

    function Get_Count (Values : in Values_Array) return Integer;

    function Get_Minimum (Values : in Values_Array) return Float;

    function Get_Maximum (Values : Values_Array) return Float;

    function Get_Range (Values : Values_Array) return Float;

    function Get_Sum (Values : Values_Array) return Float;

    function Get_Mean (Values : Values_Array) return Float;

    function Get_Sum_Of_Squares (Values: Values_Array) return Float;

    function Get_Population_Variance (Values: Values_Array) return Float; 

    function Get_Sample_Variance (Values: Values_Array) return Float;

    function Get_Population_Standard_Deviation (Values: Values_Array) return Float;

    function Get_Sample_Standard_Deviation (Values: Values_Array) return Float;

    function Get_Standard_Error_Of_Mean (Values: Values_Array) return Float;

    function Get_Coefficient_Of_Variation (Values: Values_Array) return Float;

    function Get_Unique_Values (Values : Values_Array) return Values_Array;

    -- function Get_Slice (Values : Values_Array) return Integer;

    function Get_Unique_Values_And_Frequencies (Values : Values_Array) return Values_and_Frequencies_Record;

private

    function Is_Value_In_Array (Values : Values_Array; Value : Float) return Boolean;

end CompStats_Statistics;

