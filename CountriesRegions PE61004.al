pageextension 61004 "Countries/Regions" extends "Countries/Regions"
{
    layout
    {
        // adds union state field to 'countries/regions'
        addafter("County Name")
        {
            field(UnionState; Rec.UnionState)
            {
                Caption = 'Union State';
                ToolTip = 'Specifies what union the country is in.';
                ApplicationArea = all;
            }
        }
        // adds payment format field to 'countries/regions'
        addafter(UnionState)
        {
            field(PaymentFormat; Rec.PaymentFormat)
            {
                Caption = 'Payment Format';
                ToolTip = 'Specifies with payment structure the country uses.';
                ApplicationArea = all;
            }
        }
    }
}