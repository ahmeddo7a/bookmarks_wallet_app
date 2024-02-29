import '../components.dart';
import '../components/resources/string_manager.dart';

bool loginValidateData({required Map<String, dynamic> loginData}) {
  if (!(loginData.containsKey('student_number'))) {
    showToast(text: AppStrings.pleaseEnterYourEmail, type: ToastTypes.ERROR);
    return false;
  }
  if (!(loginData.containsKey('password'))) {
    showToast(text: AppStrings.pleaseEnterYourPassword, type: ToastTypes.ERROR);
    return false;
  }
  if (loginData['password'].toString().length < 8) {
    showToast(
        text: AppStrings.passwordMustBeAtLeast8Chars, type: ToastTypes.ERROR);
    return false;
  }
  return true;
}

bool registerValidateData({required Map<String, dynamic> registerData}) {
  if (!(registerData.containsKey('email'))) {
    showToast(text: AppStrings.pleaseEnterYourEmail, type: ToastTypes.ERROR);
    return false;
  }
  if (!(registerData.containsKey('password'))) {
    showToast(text: AppStrings.pleaseEnterYourPassword, type: ToastTypes.ERROR);
    return false;
  }
  if (!(registerData.containsKey('confirmPassword'))) {
    showToast(text: AppStrings.pleaseEnterYourPassword, type: ToastTypes.ERROR);
    return false;
  }
  if (!(isValidEmail(registerData['email']))) {
    showToast(text: AppStrings.emailIsNotValid, type: ToastTypes.ERROR);
    return false;
  }
  if (registerData['password'].toString().length < 8) {
    showToast(
        text: AppStrings.passwordMustBeAtLeast8Chars, type: ToastTypes.ERROR);
    return false;
  }
  if (registerData['password'].toString() !=
      registerData['confirmPassword'].toString()) {
    showToast(text: AppStrings.passwordDoesntMatch, type: ToastTypes.ERROR);
    return false;
  }
  return true;
}

bool isValidEmail(String email) {
  // Regular expression for email validation
  // This pattern is a simplified version, and you may choose a more comprehensive one if needed.
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  return emailRegex.hasMatch(email);
}
