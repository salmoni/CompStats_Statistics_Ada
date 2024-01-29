
with Ada.Numerics.Elementary_Functions;
    
Package body CompStats_Statistics is


function Get_Count (Values: Values_Array) return Integer is
   Count    : Integer;   -- Stores final count

begin
   Count := Values'Length;
   return Count;
end Get_Count;
--------------------------------------------------------------

function Get_Minimum (Values: Values_Array) return Float is
   Count    : Integer;  -- Length of array
   Minimum  : Float;  -- Stores minimum
   
begin
   Count := Get_Count(Values);
   Minimum := Values(1);

   for index in Integer range 2 .. Count loop

      if Values(index) < Minimum then
         Minimum := Values(index);
      end if;

   end loop;

   return Minimum;

end Get_Minimum;
--------------------------------------------------------------

function Get_Maximum (Values: Values_Array) return Float is
   Count    : Integer;  -- Length of array
   Maximum  : Float;  -- Stores maximum
   
begin
   Count := Get_Count(Values);
   Maximum := Values(1);

   for index in Integer range 2 .. Count loop

      if Values(index) > Maximum then
         Maximum := Values(index);
      end if;

   end loop;

   return Maximum;

end Get_Maximum;
--------------------------------------------------------------

function Get_Range (Values: Values_Array) return Float is
   CS_Range : Float;  -- Stores range
   Minimum  : Float; 
   Maximum  : Float;
   
begin
   Minimum := Get_Minimum(Values);
   Maximum := Get_Maximum(Values);
   CS_Range := Maximum - Minimum;
   return CS_Range;
end Get_Range;
--------------------------------------------------------------

function Get_Sum (Values: Values_Array) return Float is
   Sum      : Float;
   Count    : Integer;

begin
   Count := Get_Count(values);

   if count = 0 then
      return 0.0; -- should throw an error
   end if;

   Sum := 0.0;

   for index in Integer range 1 .. Count loop
      Sum := Sum + Values(index);
   end loop;

   return Sum;

end Get_Sum;
--------------------------------------------------------------

function Get_Mean (Values: Values_Array) return Float is
   Mean     : Float;
   Sum      : Float;
   Count    : Integer;
   
begin
   Count := Get_Count(values);

   if count = 0 then
      return 0.0; -- should throw an error
   end if;

   Sum := Get_Sum(Values);
   Mean := Sum / Float(count);

   return Mean;

end Get_Mean;
--------------------------------------------------------------

function Get_Sum_Of_Squares (Values: Values_Array) return Float is
    SS          : Float;
    Mean        : Float;
    Difference  : Float;
    Count       : Integer;

begin
    SS := 0.0;
    Count := Get_Count(values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Mean := Get_Mean(Values);

    for index in Integer range 1 .. Count loop
        Difference := Values(index) - Mean;
        SS := SS + (Difference * Difference);
    end loop;

    return SS;

end Get_Sum_Of_Squares;
--------------------------------------------------------------

function Get_Population_Variance (Values: Values_Array) return Float is
    Population_Variance : Float;
    Count               : Integer;
    
begin
    Count := Get_Count (values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Population_Variance := Get_Sum_Of_Squares(Values) / Float(Count);

    return Population_Variance;

end Get_Population_Variance;
--------------------------------------------------------------

function Get_Sample_Variance (Values: Values_Array) return Float is
    Sample_Variance : Float;
    Count           : Integer;
    
begin
    Count := Get_Count (values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Sample_Variance := Get_Sum_Of_Squares(Values) / Float(Count - 1);

    return Sample_Variance;

end Get_Sample_Variance;
--------------------------------------------------------------

function Get_Population_Standard_Deviation (Values: Values_Array) return Float is
    
    Population_Standard_Deviation   : Float;
    Population_Variance             : Float;
    Count                           : Integer;
    
begin
    Count := Get_Count (values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Population_Variance := Get_Population_Variance(Values);
    Population_Standard_Deviation := Ada.Numerics.Elementary_Functions.Sqrt(Population_Variance);

    return Population_Variance;

end Get_Population_Standard_Deviation;
--------------------------------------------------------------

function Get_Sample_Standard_Deviation (Values: Values_Array) return Float is
    Sample_Standard_Deviation   : Float;
    Sample_Variance             : Float;
    Count                       : Integer;
    
begin
    Count := Get_Count (values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Sample_Variance := Get_Sample_Variance(Values);
    Sample_Standard_Deviation := Ada.Numerics.Elementary_Functions.Sqrt(Sample_Variance);

    return Sample_Standard_Deviation;

end Get_Sample_Standard_Deviation;
--------------------------------------------------------------

function Get_Standard_Error_of_Mean (Values : Values_Array) return Float is
    Standard_Error  : Float;
    Count           : Integer;

begin
    Count := Get_Count(Values);

    if count = 0 then
        return 0.0; -- should throw an error
    end if;

    Standard_Error := Get_Sample_Standard_Deviation(Values) / Ada.Numerics.Elementary_Functions.Sqrt(Float(Count));

    return Standard_Error;

end Get_Standard_Error_of_Mean;
--------------------------------------------------------------

function Get_Coefficient_Of_Variation (Values : Values_Array) return Float is
    Sample_Standard_Deviation : Float;
    Mean : Float;
    Count : Integer;

begin
    Count := Get_Count(Values);

    if Count = 0 then
        return 0.0; -- should throw an error
    end if;

    Sample_Standard_Deviation := Get_Sample_Standard_Deviation (Values);
    Mean := Get_Mean (Values);

    if Mean /= 0.0 then
        return Sample_Standard_Deviation / Mean;
    else 
        return 0.0;
    end if;

end Get_Coefficient_Of_Variation;
--------------------------------------------------------------

function Is_Value_In_Array (Values : Values_Array; Value : Float) return Boolean is
    Count : Integer;

begin
    Count := Get_Count(Values);

    if Count = 0 then
        return FALSE; -- should throw an error
    end if;

    for index in Integer range 1..Count loop

        if Values(index) = Value then
            return True;
        end if;

    end loop;

    return false;

end Is_Value_In_Array;
--------------------------------------------------------------

function Get_Unique_Values_And_Frequencies (Values : Values_Array) return Values_and_Frequencies_Record is
    Count       : Integer;
    Index       : Integer;
    Value       : Float;
    Matched     : Boolean;
    Values_and_Frequencies  : Values_and_Frequencies_Record;
    Unique_Values           : Values_Array (Integer range 1..Values'Length);
    Unique_Frequencies      : Frequencies_Array (Integer range 1..Values'Length);

begin
    Index := 1;
    Count := Get_Count (Values);
    Unique_Values'First := Values'First;
    Unique_Frequencies'First := 1;

    for idx in Integer range 2..Count loop
        Value := Values (idx);
        Matched := false;

        for idy in Integer range 1..Index loop

            if Unique_Values (idy) = Value then
                Matched := true;
                Unique_Frequencies (idy) := Unique_Frequencies (idy) + 1;
            end if;

        end loop;

        if Matched = false then
            Index := Index + 1;
            Unique_Values (Index) := Value;
            Unique_Frequencies (Index) := 1;
        end if;

    end loop;

    Values_and_Frequencies.Values := Unique_Values (1..Index);
    Values_and_Frequencies.Frequencies := Unique_Frequencies (1..Index);
    return Values_and_Frequencies;

end Get_Unique_Values_And_Frequencies;
--------------------------------------------------------------

function Get_Unique_Values (Values : Values_Array) return Values_Array is
    Count           : Integer;
    Index           : Integer;
    Value           : Float;
    Matched         : Boolean;
    Initial_Array   : Values_Array (Integer range 1..Values'Length);

begin
    Count := Get_Count(Values);
    Index := 2;
    Initial_Array(1) := Values(1);

    for idx in Integer range 2..Count loop
        Value := Values(idx);
        Matched := False;

        for idy in Integer range 1..Index loop

            if Value = Initial_Array(idy) then
                Matched := True;
                exit;
            end if;

        end loop;

        if Matched = False then
            Initial_Array(Index) := Value;
            Index := Index + 1;
        end if;

    end loop;

    Index := Index - 1;

    -- Return array up to Index
    return Initial_Array(1..Index);

end Get_Unique_Values;
--------------------------------------------------------------




--------------------------------------------------------------

end CompStats_Statistics;

