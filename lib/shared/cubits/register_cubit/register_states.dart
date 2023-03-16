abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class ChangeIconVisibleState extends RegisterStates{}
class RegisterLoadingCreateState extends RegisterStates{}
class RegisterSuccessCreateState extends RegisterStates{}
class RegisterErrorCreateState extends RegisterStates{
  final String error;
  RegisterErrorCreateState(this.error);
}
class RegisterSuccessCreateUserState extends RegisterStates{}
class RegisterErrorCreateUserState extends RegisterStates{
  final String error;
  RegisterErrorCreateUserState(this.error);
}
