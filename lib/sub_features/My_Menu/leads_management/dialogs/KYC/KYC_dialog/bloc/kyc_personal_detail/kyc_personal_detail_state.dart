part of 'kyc_personal_detail_bloc.dart';

class KycPersonalDetailState {
  final String englishProficiency;

  const KycPersonalDetailState({this.englishProficiency = 'IELTS'});

  KycPersonalDetailState copyWith({String? englishProficiency}) {
    return KycPersonalDetailState(
      englishProficiency: englishProficiency ?? this.englishProficiency,
    );
  }
}
