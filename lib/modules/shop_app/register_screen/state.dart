
import '../../../modles/modle_register.dart';

abstract class RegisterState{}
class initState extends RegisterState{}
class LoadingStateSignIn extends RegisterState{}
class SuccsseSignInSate extends RegisterState
{
  final RegisterModle modle;
  SuccsseSignInSate(this.modle);
}
class ErrorSigninState extends RegisterState{}