import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/modules/shop_app/register_screen/state.dart';
import 'package:shopapp_ui/sheard/network/remode/dio_helper.dart';

import '../../../modles/modle_register.dart';
import '../../../sheard/network/remode/end_points.dart';
class CubitRegister extends Cubit<RegisterState>
{
  CubitRegister():super(initState());

  static CubitRegister get(context)
  {
    return BlocProvider.of(context);
  }

  RegisterModle? modle;
  void signIn(
      {
        required String name,
        required String phone,
        required String email,
        required String password,
      }
      )
  {
    emit(LoadingStateSignIn());
    dioHelper.postData(
        path: Register,
        data: {
          'name':name,
          'phone':phone,
          'email':email,
          'password':password


        }).then((value) {
      modle=RegisterModle.FromJason(Jason: value?.data);
      emit(SuccsseSignInSate(modle!));

    }).catchError((Error){
      print(Error.toString());
      emit(ErrorSigninState());

    });

  }
}
