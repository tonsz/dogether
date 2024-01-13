import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/features/onboarding/widgets/page_one.dart';
import 'package:dogether/features/onboarding/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            PageOne(),
            PageTwo(),
          ],
        ),
        Positioned(
          top: 50.h,
          right: 20.w,
          child: GestureDetector(
            onTap: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            },
            child: Row(
              children: [
                CustomText(
                  text: "Skip",
                  style: customTextStyle(18, AppConst.prLight.withOpacity(0.50),
                      FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 40.h,
          left: AppConst.appWidth * 0.45,
          child: GestureDetector(
            onTap: null,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: AppConst.secTan,
                dotColor: AppConst.prLight,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
