tableextension 61001 "Vendor" extends "vendor"
{
    fields
    {
        // adds the union state field from countries/regions table to vendor
        field(61000; UnionState; Option)
        {
            Caption = 'Union State';
            OptionMembers = ,DOMESTIC,EU,FOREIGN;
            FieldClass = FlowField;
            CalcFormula = Lookup("Country/Region".UnionState WHERE("Code" = FIELD("Country/Region Code")));
            Editable = false;
        }
    }
}