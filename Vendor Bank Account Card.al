pageextension 61001 "Vendor Bank Account Card" extends "Vendor Bank Account Card"
{
    layout
    {
        modify("Bank Branch No.")
        {
            ShowMandatory = rec."Country/Region Code" = 'DK';
        }
        modify("Bank Account No.")
        {
            ShowMandatory = (rec."Country/Region Code" = 'US') or (rec."Country/Region Code" = 'DK');
        }
        modify("SWIFT Code")
        {
            ShowMandatory = rec."Country/Region Code" = 'US';
        }
    }
}