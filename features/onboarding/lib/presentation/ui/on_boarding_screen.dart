import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_page_cubit.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_page_state.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_state.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_cubit.dart';
import 'package:dependencies/introduction_screen/introduction_screen.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key});
  final AuthRouter _authRouter = sl();
  final listTitle = [
    "No More Long Lines",
    "More Coffe More Earn",
    "Make Your Day"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingPageCubit, OnBoardingPageState>(
          builder: (context, state) {
        // final status = state.onBoardingState.status;
        // if (status.isHasData) {
        //   _authRouter.navigateToSignIn();
        // }
        // },
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 1.sh / 4),
              color: Color(0xffC5E6EE),
              child: PageView(
                onPageChanged: (value) {
                  context
                      .read<OnBoardingPageCubit>()
                      .changePage(pageIndex: value);
                },
                children: [
                  Center(
                    child: Assets.images.onboarding.onboarding1.svg(
                      width: 250.w,
                      height: 250.h,
                    ),
                  ),
                  Center(
                    child: Assets.images.onboarding.onboarding2.svg(
                      width: 250.w,
                      height: 250.h,
                    ),
                  ),
                  Center(
                    child: Assets.images.onboarding.onboarding3.svg(
                      width: 250.w,
                      height: 250.h,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                height: 0.35.sh,
                width: 1.sw,
                child: Column(
                  children: [
                    Text(listTitle[context
                        .read<OnBoardingPageCubit>()
                        .state
                        .onBoardingPageState
                        .data!
                        .toInt()]),
                    Text("Send"),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 60),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: ColorName.textBlack,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // IntroductionScreen(
            //   // globalBackgroundColor: Color(0xffC5E6EE),
            //   pages: [
            //     PageViewModel(
            //       image: Assets.images.onboarding.onboarding1.svg(
            //         width: 205.w,
            //         height: 205.h,
            //       ),
            //       title: "No More Long Lines",
            //       body: "Cari, temukan dan beli produk favoritmu ",
            //       decoration: PageDecoration(
            //         imageFlex: 2,
            //         titlePadding:
            //             const EdgeInsets.only(bottom: 10.0, top: 64.0),
            //         contentMargin: const EdgeInsets.symmetric(horizontal: 64.0),
            //         titleTextStyle: TextStyle(
            //           color: ColorName.textBlack,
            //           fontSize: 20.sp,
            //           fontWeight: FontWeight.w500,
            //         ),
            //         bodyTextStyle: TextStyle(
            //           color: ColorName.textLightGrey,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ),
            //     PageViewModel(
            //       image: Assets.images.onboarding.onboarding2.svg(
            //         width: 205.w,
            //         height: 205.h,
            //       ),
            //       title: "More Coffe More Earn",
            //       body: "Cari, temukan dan beli produk favoritmu ",
            //       decoration: PageDecoration(
            //         imageFlex: 2,
            //         titlePadding:
            //             const EdgeInsets.only(bottom: 10.0, top: 64.0),
            //         contentMargin: const EdgeInsets.symmetric(horizontal: 64.0),
            //         titleTextStyle: TextStyle(
            //           color: ColorName.textBlack,
            //           fontSize: 20.sp,
            //           fontWeight: FontWeight.w500,
            //         ),
            //         bodyTextStyle: TextStyle(
            //           color: ColorName.textLightGrey,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ),
            //     PageViewModel(
            //       image: Assets.images.onboarding.onboarding3.svg(
            //         width: 205.w,
            //         height: 205.h,
            //       ),
            //       title: "Make Your Day",
            //       body: "Cari, temukan dan beli produk favoritmu ",
            //       decoration: PageDecoration(
            //         imageFlex: 2,
            //         titlePadding:
            //             const EdgeInsets.only(bottom: 10.0, top: 64.0),
            //         contentMargin: const EdgeInsets.symmetric(horizontal: 64.0),
            //         titleTextStyle: TextStyle(
            //           color: ColorName.textBlack,
            //           fontSize: 20.sp,
            //           fontWeight: FontWeight.w500,
            //         ),
            //         bodyTextStyle: TextStyle(
            //           color: ColorName.textLightGrey,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ),
            //   ],
            //   onDone: () =>
            //       context.read<OnBoardingCubit>().saveOnBoardingStatus(),
            //   showBackButton: false,
            //   showNextButton: false,
            //   showSkipButton: true,
            //   dotsDecorator: const DotsDecorator(
            //     size: Size(10.0, 10.0),
            //     color: ColorName.textGrey,
            //     activeColor: ColorName.green,
            //     activeSize: Size(22.0, 10.0),
            //     activeShape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(25.0),
            //       ),
            //     ),
            //   ),
            //   skip: Text(
            //     "Skip",
            //     style: TextStyle(
            //       color: ColorName.green,
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   done: Container(
            //     padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
            //     decoration: BoxDecoration(
            //         color: ColorName.green,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Text(
            //       "Get Started",
            //       style: TextStyle(
            //         color: ColorName.white,
            //         fontSize: 12.sp,
            //         fontWeight: FontWeight.w700,
            //       ),
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(25),
            //             topRight: Radius.circular(25))),
            //     height: 0.35.sh,
            //     width: 1.sw,
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}
