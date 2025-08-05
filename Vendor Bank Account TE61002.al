tableextension 61002 "Vendor bank account - autofill" extends "Vendor Bank Account"
{
    fields
    {
        // adds 'payment format' to the vendor bank account
        field(61001; PaymentFormat; Option)
        {
            Caption = 'Payment Format';
            OptionMembers = ,BranchAccount,IbanSwift,AccountSwift;
            FieldClass = FlowField;
            CalcFormula = lookup("Country/Region".PaymentFormat where("Code" = field("Country/Region Code")));
            Editable = false;
        }
    }
    // ensures that there is always 10 digits in a danish bank account
    trigger OnAfterModify()
    var
        CountryCode: Code[10];
    begin
        CountryCode := Rec."Country/Region Code";

        if (CountryCode = 'DK') and (Rec."Bank Account No." <> '') and (StrLen(Rec."Bank Account No.") < 10) then begin
            Rec."Bank Account No." := COPYSTR('0000000000', 1, 10 - STRLEN(Rec."Bank Account No.")) + Rec."Bank Account No.";
            Modify(true);
        end;
    end;

}
