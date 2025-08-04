tableextension 61002 "Vendor bank account - autofill" extends "Vendor Bank Account"
{
    fields
    {
        field(61001; PaymentFormat; Option)
        {
            Caption = 'Payment Format';
            OptionMembers = ,BranchAccount,IbanSwift,AccountSwift;
            FieldClass = FlowField;
            CalcFormula = lookup("Country/Region".PaymentFormat where("Code" = field("Country/Region Code")));
            Editable = false;
        }
    }
}