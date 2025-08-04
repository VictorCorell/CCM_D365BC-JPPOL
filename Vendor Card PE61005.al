pageextension 61005 "Vendor card - automation" extends "Vendor Card"
{
    layout
    {
        // vat bus. posting group is determined by union state
        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            var
                CountryRegionRec: Record "Country/Region";
            begin
                if CountryRegionRec.Get(Rec."Country/Region Code") then begin
                    if CountryRegionRec.UnionState = CountryRegionRec.UnionState::EU then
                        Rec.Validate("VAT Bus. Posting Group", 'EU')
                    else if CountryRegionRec.UnionState = CountryRegionRec.UnionState::Domestic then
                        Rec.Validate("VAT Bus. Posting Group", 'DOMESTIC')
                    else if CountryRegionRec.UnionState = CountryRegionRec.UnionState::Foreign then
                        Rec.Validate("VAT Bus. Posting Group", 'FOREIGN');
                end;
            end;
        }
        // if creditor no start with 8 (FIK) payment method code will be '71'
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
        // if CPM SSN is filled payment method code will be 'NKC'
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