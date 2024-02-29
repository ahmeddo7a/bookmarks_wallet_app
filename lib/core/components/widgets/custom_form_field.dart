import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/size_manager.dart';

enum CustomFieldType { email, name, password, repeatPassword, phone, custom }
class CustomFormField extends StatelessWidget {

  final Function? onSubmit;
  final Function(String)? onChange;
  final Function? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixPressed;
  final CustomFieldType customFieldType;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final String label;
  final TextInputType? inputType;
  final Color myCursorColor;
  final double myBorderRadius;
  final bool isPassword;
  final TextStyle? myStyle;

  const CustomFormField(
      {
        Key? key,
        required this.customFieldType,
        this.controller,
        required this.label,
        this.prefixIcon,
        this.onSubmit,
        this.onChange,
        this.onTap,
        this.suffixIcon,
        this.suffixPressed,
        this.validate,
        this.myCursorColor=ColorManager.grey,
        this.myBorderRadius=SizeManager.smallRadius,
        this.isPassword =false,
        this.inputType,
        required this.myStyle,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType? type;
    String? formFieldLabel;
    IconData? customPrefix;
    switch(customFieldType){
      case CustomFieldType.name:
        formFieldLabel='Username';
        type=TextInputType.name;
        customPrefix = Icons.account_circle_outlined;
        break;
      case CustomFieldType.email:
        formFieldLabel = 'Email';
        type=TextInputType.emailAddress;
        customPrefix=Icons.mail_outline;
        break;
      case CustomFieldType.phone:
        formFieldLabel="Phone Number";
        type=TextInputType.phone;
        customPrefix=Icons.phone;
        break;
      case CustomFieldType.password:
        formFieldLabel='Password';
        type=TextInputType.visiblePassword;
        customPrefix=Icons.lock_outline;
        break;
      case CustomFieldType.repeatPassword:
        formFieldLabel="Repeat Password";
        type=TextInputType.visiblePassword;
        customPrefix=Icons.lock_outline;
        break;
      case CustomFieldType.custom:
        formFieldLabel=label;
        type= inputType;
        customPrefix = prefixIcon;
        break;
    }
    return TextFormField(
      validator: validate,
      controller: controller,
      cursorColor: myCursorColor,
      onChanged: onChange,
      keyboardType: type,
      obscureText: customFieldType == CustomFieldType.password ||
          customFieldType == CustomFieldType.repeatPassword
          ? !isPassword
          : isPassword,
      style:  myStyle,

      decoration: InputDecoration(
        label: Text(formFieldLabel,style: myStyle,),
        //hintText: formFieldLabel,
        prefixIcon: Icon(customPrefix),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
      ),
      onTapOutside: ((event) {
        FocusScope.of(context).unfocus();
      }),
    );
  }
}