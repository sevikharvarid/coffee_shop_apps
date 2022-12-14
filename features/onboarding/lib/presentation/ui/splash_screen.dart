import 'package:common/utils/navigation/router/onboarding_router.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:resources/assets.gen.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:resources/colors.gen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key});
  final OnboardingRouter _onboardingRouter = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (ctx, state) {
          final status = state.splashState.status;
          if (status.isNoData) {
            _onboardingRouter.navigateToOnboarding();
          }
        },
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: ColorName.green,
          child: Center(
            child: Assets.images.logo.logo.svg(
              width: 350.w,
              height: 250.h,
            ),
          ),
        ),
      ),
    );
  }
}
