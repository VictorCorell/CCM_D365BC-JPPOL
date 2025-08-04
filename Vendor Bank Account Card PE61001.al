pageextension 61001 "Vendor Bank Account - adding" extends "Vendor Bank Account Card"
{
    layout
    {
        // adds payment format to 'vendor bank account'
        addafter("Country/Region Code")
        {
            field(PaymentFormat; Rec.PaymentFormat)
            {
                Caption = 'Payment Format';
                ToolTip = 'Specifies with payment structure the country uses.';
                ApplicationArea = all;
            }
        }
    }
    // Sets 'BANK' as the standard code for 'Vendor Bank Account Card'
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec.Code := 'BANK';
    end;
}