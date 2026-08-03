class KycBusinessDetailModel {
  final String companyName;
  final String companyLegalStatus;
  final String businessType;
  final String ownershipPercentage;
  final String ntn;
  final String issueDate;
  final String lob;
  final String mobile;
  final String natureOfBusiness;
  final String officeAddress;
  final String poBox;
  final String companyEmail;
  final String website;

  const KycBusinessDetailModel({
    required this.companyName,
    required this.companyLegalStatus,
    required this.businessType,
    required this.ownershipPercentage,
    required this.ntn,
    required this.issueDate,
    required this.lob,
    required this.mobile,
    required this.natureOfBusiness,
    required this.officeAddress,
    required this.poBox,
    required this.companyEmail,
    this.website = '',
  });

  KycBusinessDetailModel copyWith({
    String? companyName,
    String? companyLegalStatus,
    String? businessType,
    String? ownershipPercentage,
    String? ntn,
    String? issueDate,
    String? lob,
    String? mobile,
    String? natureOfBusiness,
    String? officeAddress,
    String? poBox,
    String? companyEmail,
    String? website,
  }) {
    return KycBusinessDetailModel(
      companyName: companyName ?? this.companyName,
      companyLegalStatus: companyLegalStatus ?? this.companyLegalStatus,
      businessType: businessType ?? this.businessType,
      ownershipPercentage: ownershipPercentage ?? this.ownershipPercentage,
      ntn: ntn ?? this.ntn,
      issueDate: issueDate ?? this.issueDate,
      lob: lob ?? this.lob,
      mobile: mobile ?? this.mobile,
      natureOfBusiness: natureOfBusiness ?? this.natureOfBusiness,
      officeAddress: officeAddress ?? this.officeAddress,
      poBox: poBox ?? this.poBox,
      companyEmail: companyEmail ?? this.companyEmail,
      website: website ?? this.website,
    );
  }
}