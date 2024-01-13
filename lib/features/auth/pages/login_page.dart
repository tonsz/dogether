import 'package:country_picker/country_picker.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_button.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_field.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController phone = TextEditingController();
  Country country = Country(
    phoneCode: "63",
    countryCode: "PH",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Philippines",
    example: "Philippines",
    displayName: 'Philippines',
    displayNameNoCountryCode: 'Philippines',
    e164Key: '0',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpacer(ht: 140.h),
              Image.asset('assets/images/peace.png'),
              HeightSpacer(ht: 30.h),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Dogether",
                  style: customTextStyle(32, AppConst.prLight, FontWeight.bold),
                ),
              ),
              HeightSpacer(ht: 40.h),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: " Please enter your phone number",
                  style:
                      customTextStyle(16, AppConst.prLight, FontWeight.normal),
                ),
              ),
              HeightSpacer(ht: 10.h),
              Center(
                child: CustomTextField(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.prLight,
                            bottomSheetHeight: AppConst.appHeight * 0.6,
                          ),
                          onSelect: (code) {
                            setState(() {});
                          },
                        );
                      },
                      child: CustomText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: customTextStyle(
                            18, AppConst.prDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  onChanged: null,
                  hintText: 'Enter phone number',
                  hintStyle:
                      customTextStyle(16, AppConst.prDark, FontWeight.normal),
                ),
              ),
              HeightSpacer(ht: 20.h),
              CustomButton(
                  onTap: () => context.go('/otp'),
                  width: AppConst.appWidth * 0.7,
                  height: AppConst.appHeight * 0.07,
                  bgColor: AppConst.secTan,
                  text: "Send Code"),
            ],
          ),
        ),
      ),
    );
  }
}
