tableextension 61000 "Countries/Regions" extends "Country/Region"
{
    fields
    {
        // adds a union state field
        field(61000; UnionState; Option)
        {
            Caption = 'Union state';
            OptionMembers = ,DOMESTIC,EU,FOREIGN;
            BlankZero = true;
        }
        // adds a payment format field
        field(61001; PaymentFormat; Option)
        {
            Caption = 'Payment Format';
            OptionMembers = ,BranchAccount,IbanSwift,AccountSwift;
            BlankZero = true;
        }
    }
}
