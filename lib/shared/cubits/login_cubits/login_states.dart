abstract class LogInStates{}
class LogInInitialState extends LogInStates{}
class ChangeIconVisibleState extends LogInStates{}
class LogInLoadingState extends LogInStates{}
class LogInSuccessState extends LogInStates{}
class LogInErrorState extends LogInStates{
  final String error;
  LogInErrorState(this.error);
}
