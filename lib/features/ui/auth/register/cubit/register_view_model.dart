import 'package:e_commerce_app/domain/useCases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
    : super(RegisterInitialStates());

  //todo: hold data , handle logic
  TextEditingController fullNameController = TextEditingController(
    text: "Nada Nasr",
  );
  TextEditingController phoneController = TextEditingController(
    text: "01007687534",
  );
  TextEditingController emailController = TextEditingController(
    text: "nada@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "1234567899",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "1234567899",
  );
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingStates());
      var either = await registerUseCase.invoke(
        fullNameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (error) => emit(RegisterErrorStates(errors: error)),
        (response) => emit(RegisterSuccessStates(responseEntity: response)),
      );
    }
  }
}
