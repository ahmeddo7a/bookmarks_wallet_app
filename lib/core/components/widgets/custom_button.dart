import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';



class CustomButton extends StatelessWidget {
  final int widthPercentage;
  final Function() onPressed;
  final Color backgroundColor;
  final double myFontSize;
  final FontWeight myFontWeight;
  final Color myTextColor;
  final double myVerticalPadding;
  final double myHorizontalPadding;
  final double myBorderRadius;
  final String myFontFamily;
  final Widget widget;

  const CustomButton(
      {
        Key? key,
        this.widthPercentage=100,
        required this.onPressed,
        required this.widget,
        this.myTextColor=ColorManager.white,
        this.backgroundColor=ColorManager.ministryColor,
        this.myFontSize=FontSize.s20,
        this.myFontWeight=FontWeightManager.bold,
        this.myVerticalPadding=PaddingManger.p3,
        this.myHorizontalPadding=PaddingManger.p6,
        this.myBorderRadius=SizeManager.bigRadius,
        this.myFontFamily = FontConstants.mainFontFamily,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: myWidth*widthPercentage,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: myVerticalPadding,horizontal:myHorizontalPadding )),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(myBorderRadius),
                side: BorderSide(
                    color: backgroundColor
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          child: widget
      ),
    );
  }
}