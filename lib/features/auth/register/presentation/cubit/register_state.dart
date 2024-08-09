class RegisterState{}
class RegisterInitial extends RegisterState{}
class RegisterFailure extends RegisterState{
  final String message;
  RegisterFailure(this.message);
}
class RegisterSuccess extends RegisterState{
  final String message;
  RegisterSuccess(this.message);
}