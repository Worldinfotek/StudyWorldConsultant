part of 'kyc_personal_detail_bloc.dart';

abstract class KycPersonalDetailEvent {}

class EnglishProficiencyChanged extends KycPersonalDetailEvent {
  final String value;
  EnglishProficiencyChanged(this.value);
}