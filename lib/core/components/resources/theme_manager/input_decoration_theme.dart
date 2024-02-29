import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../font_manager.dart';
import '../size_manager.dart';

class MyLightInputTheme {

  TextStyle _buildTextStyle(Color color, {double size = 16}){
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: FontConstants.mainFontFamily,
        fontWeight: FontWeightManager.regular
    );
  }

  OutlineInputBorder _buildBorder(Color color,{double width = 0.8}){
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(SizeManager.mediumRadius)),
        borderSide: BorderSide(
            color: color,
            width: width
        )
    );
  }

  InputDecorationTheme theme()=>InputDecorationTheme(

    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    //isDense: true,
    //floatingLabelBehavior: FloatingLabelBehavior.always,
    // constraints: BoxConstraints(maxWidth: 150),
    enabledBorder: _buildBorder(ColorManager.borderColor.withOpacity(0.4)),
    errorBorder: _buildBorder(ColorManager.cautionColor),
    focusedBorder: _buildBorder(ColorManager.ministryColor,width: 0.8),
    // suffixStyle: _buildTextStyle(Colors.black),
    floatingLabelStyle: _buildTextStyle(ColorManager.ministryColor,size: 16),
    errorStyle: _buildTextStyle(ColorManager.cautionColor,size: 12),
    hintStyle: _buildTextStyle(ColorManager.inputDecorationColor),
    labelStyle: _buildTextStyle(ColorManager.inputDecorationColor,size: 14),
    suffixIconColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.focused)) {
        return ColorManager.ministryColor;
      }
      else if (states.contains(MaterialState.error)){
        return ColorManager.cautionColor;
      }
      return ColorManager.inputDecorationColor;
    }),
    prefixIconColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.focused)) {
        return ColorManager.ministryColor;
      }
      else if (states.contains(MaterialState.error)){
        return ColorManager.cautionColor;
      }
      return ColorManager.inputDecorationColor;
    }),
    fillColor: ColorManager.white,
    filled: true,


  );

}