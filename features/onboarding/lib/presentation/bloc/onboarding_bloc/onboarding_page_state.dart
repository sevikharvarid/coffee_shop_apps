import 'package:dependencies/equatable/equatable.dart';
import 'package:common/utils/state/view_data_state.dart';

class OnBoardingPageState extends Equatable {
  final ViewData<int> onBoardingPageState;

  const OnBoardingPageState({
    required this.onBoardingPageState,
  });

  OnBoardingPageState copyWith({ViewData<int>? onBoardingState}) {
    return OnBoardingPageState(
        onBoardingPageState: onBoardingState ?? this.onBoardingPageState);
  }

  @override
  List<Object?> get props => [onBoardingPageState];
}
