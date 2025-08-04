pageextension 61002 "Purchase Invoice" extends "Purchase Invoice"
{
    layout
    {
        modify("Payment Reference")
        {
            ShowMandatory = (Rec."payment method code" = '71') or (Rec."payment method code" = '04');
        }
    }
}