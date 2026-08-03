import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_personal_detail_event.dart';

part 'kyc_personal_detail_state.dart';

class KycPersonalDetailBloc
    extends Bloc<KycPersonalDetailEvent, KycPersonalDetailState> {
  KycPersonalDetailBloc() : super(const KycPersonalDetailState()) {
    on<EnglishProficiencyChanged>((event, emit) {
      emit(state.copyWith(englishProficiency: event.value));
    });
  }
}
