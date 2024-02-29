import 'package:bookmarks_wallet/core/components/resources/assets_manager.dart';
import 'package:bookmarks_wallet/core/components/widgets/custom_form_field.dart';
import 'package:bookmarks_wallet/features/authentication/presentation/logic/login_cubit/login_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/components/resources/color_manager.dart';
import '../../../../core/components/resources/font_manager.dart';
import '../../../../core/components/resources/route_manager.dart';
import '../../../../core/components/resources/string_manager.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/services/service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => sl<LoginCubit>(),
  child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    final cubit = LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.05, vertical: myHeight * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssetsManager.loginLogo,height: myHeight*0.5,),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: 'Email',
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.email_outlined,
                onChange: (String? value) {
                  cubit.loginData.addAll({'email': value});
                },
              ),
              SizedBox(height: myHeight*0.02,),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: 'Password',
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.lock_outline,
                suffixIcon: cubit.passwordIcon,
                suffixPressed: () {
                  cubit.showPassword();
                },
                isPassword: cubit.isPassword,
                onChange: (String? value) {
                  cubit.loginData.addAll({'password': value});
                },
              ),
              SizedBox(
                height: myHeight * 0.04,
              ),
              SizedBox(
                height: myHeight * 0.05,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: myWidth * 0.09),
                  child: ConditionalBuilder(
                    builder: (context) => CustomButton(
                        onPressed: () {
                          cubit.login(context: context);
                        },
                        widget: const Text(AppStrings.login)),
                    condition: LoginState is! LoginWaiting,
                    fallback: (context) => Center(child: LoadingAnimationWidget.threeArchedCircle(color: ColorManager.mainColor, size: 30)),
                  ),
                ),
              ), //Login Button
              SizedBox(
                height: myHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAnAccount,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    width: myWidth * 0.02,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: Text(
                        AppStrings.registerNow,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: ColorManager.writingColor,
                            fontWeight: FontWeightManager.semiBold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}
