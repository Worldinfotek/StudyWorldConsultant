class KycBankDetailModel {
  final String bankName;
  final String accountTitle;
  final String accountNumber;
  final String iban;
  final String accountCurrency;
  final String swiftCode;
  final String bankAddress;
  final String email;
  final String website;
  final String concernPerson;

  const KycBankDetailModel({
    required this.bankName,
    required this.accountTitle,
    required this.accountNumber,
    required this.iban,
    required this.accountCurrency,
    required this.swiftCode,
    required this.bankAddress,
    required this.email,
    this.website = '',
    this.concernPerson = '',
  });
}