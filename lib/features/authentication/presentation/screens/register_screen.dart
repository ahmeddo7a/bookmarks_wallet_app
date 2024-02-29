import 'package:bookmarks_wallet/features/authentication/presentation/logic/register_cubit/register_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/components/resources/assets_manager.dart';
import '../../../../core/components/resources/color_manager.dart';
import '../../../../core/components/resources/string_manager.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/components/widgets/custom_form_field.dart';
import '../../../../core/services/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => sl<RegisterCubit>(),
  child: BlocBuilder<RegisterCubit, RegisterState>(
  builder: (context, state) {
    final cubit = RegisterCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              SvgPicture.asset(ImageAssetsManager.registerLogin,height: myHeight*0.4,),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: 'Email',
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.email_outlined,
                onChange: (String? value) {
                  cubit.registerData.addAll({'email': value});
                },
              ),
              SizedBox(
                height: myHeight * 0.02,
              ),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: AppStrings.username,
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.person_outline,
                onChange: (String? value) {
                  cubit.registerData.addAll({'username': value});
                },
              ),
              SizedBox(height: myHeight*0.02,),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: AppStrings.password,
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.lock_outline,
                suffixIcon: cubit.passwordIcon,
                suffixPressed: () {
                  cubit.showPassword();
                },
                isPassword: cubit.isPassword,
                onChange: (String? value) {
                  cubit.registerData.addAll({'password': value});
                },
              ),
              SizedBox(height: myHeight*0.02,),
              CustomFormField(
                customFieldType: CustomFieldType.custom,
                label: AppStrings.confirmPassword,
                myStyle: Theme.of(context).textTheme.bodyMedium,
                prefixIcon: Icons.lock_outline,
                suffixIcon: cubit.passwordIcon,
                suffixPressed: () {
                  cubit.showPassword();
                },
                isPassword: cubit.isPassword,
                onChange: (String? value) {
                  cubit.registerData.addAll({'confirmPassword': value});
                },
              ),
              SizedBox(
                height: myHeight * 0.04,
              ),
              SizedBox(
                height: myHeight * 0.05,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.09),
                  child: ConditionalBuilder(
                    fallback: (context) => LoadingAnimationWidget.threeArchedCircle(color: ColorManager.mainColor, size: 30),
                    condition: RegisterState is! RegisterWaiting,
                    builder: (context) => CustomButton(
                        onPressed: () {
                          cubit.register(context: context);
                        },
                        widget: const Text(AppStrings.registerNow)),
                  ),
                ),
              ),
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
