pageextension 61000 "Vendor Card - adding" extends "Vendor Card"
{
    layout
    {
        modify("Payment Terms Code")
        {
            ShowMandatory = true;
        }
        modify("VAT Bus. Posting Group")
        {
            ShowMandatory = true;
        }
        modify("Creditor No.")
        {
            Caption = 'FIK/Giro No.';
        }
        // adds the union state field to the page from the table
        addafter("Country/Region Code")
        {
            field(UnionState; Rec.UnionState)
            {
                Caption = 'Union State';
                ToolTip = 'Specifies what union the country is in.';
                ApplicationArea = all;
            }
        }
    }
}
