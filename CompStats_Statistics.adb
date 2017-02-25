with Ada.Numerics.Elementary_Functions;
    
Package body CompStats_Statistics is


function Get_Count (Values: Values_Array) return Integer is
   Count: Integer;   -- Stores final count

begin
   Count := Values'Length;
   return Count;
end Get_Count;


function Get_Minimum (Values: Values_Array) return Float is
   Count: Integer;  -- Length of array
   Minimum: Float;  -- Stores minimum
   
begin
   Count := Get_Count(Values);
   Minimum := Values(0);
   for index in Integer range 2 .. Count loop
      if Values(index) < Minimum then
         Minimum := Values(index);
      end if;
   end loop;
   return Minimum;
end Get_Minimum;


function Get_Maximum (Values: Values_Array) return Float is
   Count: Integer;  -- Length of array
   Maximum: Float;  -- Stores maximum
   
begin
   Count := Get_Count(Values);
   Maximum := Values(0);
   for index in Integer range 2 .. Count loop
      if Values(index) > Maximum then
         Maximum := Values(index);
      end if;
   end loop;
   return Maximum;
end Get_Maximum;


function Get_Range (Values: Values_Array) return Float is
   CS_Range: Float;  -- Stores range
   Minimum: Float; 
   Maximum: Float;
   
begin
   Minimum := Get_Minimum(Values);
   Maximum := Get_Maximum(Values);
   CS_Range := Maximum - Minimum;
   return CS_Range;
end Get_Range;


function Get_Sum (Values: Values_Array) return Float is
   Sum: Float;
   Count: Integer;

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


function Get_Mean (Values: Values_Array) return Float is
   Mean: Float;
   Sum: Float;
   Count: Integer;
   
begin
   Count := Get_Count(values);
   if count = 0 then
      return 0.0; -- should throw an error
   end if;
   Sum := Get_Sum(Values);
   Mean := Sum / Float(count);
   return Mean;
end Get_Mean;


function Get_Sum_Of_Squares (Values: Values_Array) return Float is
    SS: Float;
    Mean:Float;
    Difference: Float;
    Count : Integer;

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


function Get_Population_Variance (Values: Values_Array) return Float is
    Population_Variance : Float;
    Count : Integer;
    
begin
    Count := Get_Count (values);
    if count = 0 then
        return 0.0; -- should throw an error
    end if;
    Population_Variance := Get_Sum_Of_Squares(Values) / Float(Count);
    return Population_Variance;
end Get_Population_Variance;


function Get_Sample_Variance (Values: Values_Array) return Float is
    Sample_Variance : Float;
    Count : Integer;
    
begin
    Count := Get_Count (values);
    if count = 0 then
        return 0.0; -- should throw an error
    end if;
    Sample_Variance := Get_Sum_Of_Squares(Values) / Float(Count - 2);
    return Sample_Variance;
end Get_Sample_Variance;


function Get_Population_Standard_Deviation (Values: Values_Array) return Float is
    Population_Standard_Deviation : Float;
    Population_Variance : Float;
    Count : Integer;
    
begin
    Count := Get_Count (values);
    if count = 0 then
        return 0.0; -- should throw an error
    end if;
    Population_Variance := Get_Population_Variance(Values);
    Population_Standard_Deviation := Ada.Numerics.Elementary_Functions.Sqrt(Population_Variance);
    return Population_Variance;
end Get_Population_Standard_Deviation;


function Get_Sample_Standard_Deviation (Values: Values_Array) return Float is
    Sample_Standard_Deviation : Float;
    Sample_Variance : Float;
    Count : Integer;
    
begin
    Count := Get_Count (values);
    if count = 0 then
        return 0.0; -- should throw an error
    end if;
    Sample_Variance := Get_Sample_Variance(Values);
    Sample_Standard_Deviation := Ada.Numerics.Elementary_Functions.Sqrt(Sample_Variance);
    return Sample_Standard_Deviation;
end Get_Sample_Standard_Deviation;


function Get_Standard_Error_of_Mean (Values : Values_Array) return Float is
    Standard_Error : Float;
    Count : Integer;

begin
    Count := Get_Count(Values);
    if count = 0 then
        return 0.0; -- should throw an error
    end if;
    Standard_Error := Get_Sample_Standard_Deviation(Values) / Ada.Numerics.Elementary_Functions.Sqrt(Float(Count));
    return Standard_Error;
end Get_Standard_Error_of_Mean;

end CompStats_Statistics;

