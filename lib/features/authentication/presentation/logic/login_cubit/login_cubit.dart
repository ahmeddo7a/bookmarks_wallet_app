import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/basics/data_validator.dart';
import '../../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../../core/components.dart';
import '../../../../../core/components/resources/route_manager.dart';
import '../../../../../core/services/cache_helper.dart';
import '../../../domain/use_case/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());


  static LoginCubit get(context) => BlocProvider.of(context);


  IconData passwordIcon = Icons.visibility_off_outlined;
  bool isPassword = true;

  void showPassword() {
    emit(LoginInitial());
    if (isPassword) {
      isPassword = false;
      passwordIcon = Icons.visibility_outlined;
    } else {
      isPassword = true;
      passwordIcon = Icons.visibility_off_outlined;
    }
    emit(LoginShowPassword());
  }


  Map<String, dynamic> loginData = {};

  // LOGIN FUNCTION
  void login({required BuildContext context}) async {
    emit(LoginWaiting());
    if (loginValidateData(loginData: loginData)) {
      final result = await loginUseCase(AuthParameters(authData: loginData));
      result.fold((l) {
        showToast(text: l.message, type: ToastTypes.ERROR);
        emit(LoginFailed());
      }, (r) {
        CacheHelper.saveStringData(key: 'access_token', value: r.accessToken);
        CacheHelper.saveStringData(key: 'refresh_token', value: r.refreshToken);
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeRoute,
              (route) => false,
        );
      });
    } else {
      emit(LoginFailed());
    }
  }

}
