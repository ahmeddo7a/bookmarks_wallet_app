import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/components/resources/assets_manager.dart';
import '../../core/components/resources/color_manager.dart';
import '../../core/components/resources/route_manager.dart';
import '../../core/components/resources/size_manager.dart';
import '../../core/components/resources/string_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),()=> Navigator.pushReplacementNamed(context, Routes.loginRoute));
  }

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SizedBox(
        height: myHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: myHeight *0.1,
              decoration: const BoxDecoration(
                color: ColorManager.ministryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeManager.bigRadius),
                  bottomRight: Radius.circular(SizeManager.bigRadius),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: myHeight*0.15,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth*0.1),
                    child: SizedBox(
                        height: myHeight*0.35,
                        width: myWidth,
                        child: SvgPicture.asset(ImageAssetsManager.mainLogo)),
                  ),
                  SizedBox(height: myHeight*0.15,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth*0.05),
                    child: Text(AppStrings.welcome,style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                  SizedBox(height: myHeight*0.1,),
                  LoadingAnimationWidget.staggeredDotsWave(color: ColorManager.ministryColor.withOpacity(0.8), size: SizeManager.bigSize),
                ],
              ),
            ),
            Container(
              height: myHeight *0.06,
              decoration: const BoxDecoration(
                color: ColorManager.ministryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeManager.bigRadius), topRight: Radius.circular(SizeManager.bigRadius)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
