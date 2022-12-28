import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/ui_helpers.dart';
import '/constants/app_color.dart';

import 'constants/app_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primeryColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UIHelper.verticalSpaceExtraLarge,
              UIHelper.verticalSpaceExtraLarge,
              UIHelper.verticalSpaceExtraLarge,
              Image.asset(AssetIcons.splashScreen),
              UIHelper.verticalSpaceExtraLarge,
              UIHelper.verticalSpaceExtraLarge,
              UIHelper.verticalSpaceMedium,
              Container(
                width: 140.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.text30,
                  width: 1.0,
                ))),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                "From",
                style: TextFontStyle.headline5StyleInter
                    .copyWith(color: AppColors.white),
              ),
              Text(
                "CODEMEN",
                style: TextFontStyle.headline5StyleInter
                    .copyWith(color: AppColors.white),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                "© 2022 Codemen. All Rights Reserved.",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white),
              ),
            ]),
      ),
    );
  }
}
