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
        modify("Country/Region Code")
        {
            ShowMandatory = true;
        }
        // adds factbox with document attachment from the vendor
        addlast(FactBoxes)
        {
            part(DocAttachments; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(DATABASE::Vendor), "No." = field("Vendor No.");
            }
        }
    }
    // Sets 'BANK' as the standard code for 'Vendor Bank Account Card'
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec.Code := 'BANK';
    end;
}
