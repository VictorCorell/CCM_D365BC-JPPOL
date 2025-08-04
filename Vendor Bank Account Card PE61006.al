pageextension 61006 "Vendor Bank Account - automate" extends "Vendor Bank Account Card"
{
    layout
    {
        // makes fields mandatory depending on payment format
        modify("Bank Branch No.")
        {
            ShowMandatory = rec.PaymentFormat = rec.PaymentFormat::BranchAccount;
        }
        modify("Bank Account No.")
        {
            ShowMandatory = (rec.PaymentFormat = rec.PaymentFormat::BranchAccount) or (rec.PaymentFormat = rec.PaymentFormat::AccountSWIFT);
        }
        modify("IBAN")
        {
            ShowMandatory = rec.PaymentFormat = rec.PaymentFormat::IBANSWIFT;
        }
        modify("SWIFT Code")
        {
            ShowMandatory = (rec.PaymentFormat = rec.PaymentFormat::IBANSWIFT) or (rec.PaymentFormat = rec.PaymentFormat::AccountSWIFT);
        }
    }
}