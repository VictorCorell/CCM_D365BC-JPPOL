tableextension 61000 "Countries/Regions" extends "Country/Region"
{
    fields
    {
        // add a union state field
        field(61000; UnionState; Option)
        {
            Caption = 'Union state';
            OptionMembers = ,DOMESTIC,EU,FOREIGN;
        }
    }
}