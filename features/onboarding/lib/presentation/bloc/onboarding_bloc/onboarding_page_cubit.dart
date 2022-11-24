import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_page_state.dart';

class OnBoardingPageCubit extends Cubit<OnBoardingPageState> {
  OnBoardingPageCubit()
      : super(
            OnBoardingPageState(onBoardingPageState: ViewData.loaded(data: 0)));

  void changePage({required int pageIndex}) => emit(OnBoardingPageState(
      onBoardingPageState: ViewData.loaded(data: pageIndex)));
}
