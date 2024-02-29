import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/basics/data_validator.dart';
import '../../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../../core/components.dart';
import '../../../../../core/components/resources/route_manager.dart';
import '../../../domain/use_case/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());


  static RegisterCubit get(context) => BlocProvider.of(context);



  IconData passwordIcon = Icons.visibility_off_outlined;
  bool isPassword = true;

  void showPassword() {
    emit(RegisterInitial());
    if (isPassword) {
      isPassword = false;
      passwordIcon = Icons.visibility_outlined;
    } else {
      isPassword = true;
      passwordIcon = Icons.visibility_off_outlined;
    }
    emit(RegisterShowPassword());
  }



  Map<String, dynamic> registerData = {};
  void register({required BuildContext context}) async {
    emit(RegisterWaiting());
    if (registerValidateData(registerData: registerData)) {

      final result =
      await registerUseCase(AuthParameters(authData: registerData));
      result.fold((l) {
        showToast(text: l.message, type: ToastTypes.ERROR);
        emit(RegisterFailed());
      }, (r) {
        Navigator.popAndPushNamed(context, Routes.loginRoute);
        showToast(text: r.message, type: ToastTypes.SUCCESS);
      });
    } else {
      emit(RegisterFailed());
    }
  }

}
