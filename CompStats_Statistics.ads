package CompStats_Statistics is

    
    type Values_Array is array (Integer range <>) of Float;

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

private

end CompStats_Statistics;

