class LoginState{}
class LoginInitial extends LoginState{}
class LoginFailure extends LoginState{
  final String message;
  LoginFailure(this.message);
}
class LoginSuccess extends LoginState{
  final String message;
  LoginSuccess(this.message);
}