pageextension 61000 "Vendor Card" extends "Vendor Card"
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
            trigger OnAfterValidate()
            begin
                if CopyStr(Rec."Creditor No.", 1, 1) = '8' then begin
                    Rec.Validate("Payment Method Code", '71');
                    CurrPage.Update();
                end
                else if Rec."CPM SSN" <> '' then begin
                    Rec.Validate("Payment Method Code", 'NKC');
                    CurrPage.Update();
                end;
            end;
        }
        modify("CPM SSN")
        {
            trigger OnAfterValidate()
            begin
                if Rec."CPM SSN" <> '' then begin
                    Rec.Validate("Payment Method Code", 'NKC');
                    CurrPage.Update();
                end
                else if CopyStr(Rec."Creditor No.", 1, 1) = '8' then begin
                    Rec.Validate("Payment Method Code", '71');
                    CurrPage.Update();
                end;
            end;
        }
    }
}