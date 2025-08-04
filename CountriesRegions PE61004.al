pageextension 61004 "Countries/Regions" extends "Countries/Regions"
{
    layout
    {
        addafter("County Name")
        {
            field(UnionState; Rec.UnionState)
            {
                ApplicationArea = all;
            }
        }
    }
}