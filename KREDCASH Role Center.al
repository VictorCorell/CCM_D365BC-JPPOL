pageextension 61003 "KREDCASH Role Renter" extends "Bookkeeper Role Center"
{
    actions
    {
        addafter("&Purchase Invoice")
        {
            action("Purchase Credit Memo")
            {
                ApplicationArea = All;
                Caption = 'Purchase Credit Memo';
                Image = PurchaseCreditMemo;
                RunObject = page "Purchase Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase credit memo.';
            }
        }
    }
}