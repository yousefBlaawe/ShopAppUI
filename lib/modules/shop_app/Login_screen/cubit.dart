

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/modules/shop_app/Login_screen/state.dart';
import 'package:shopapp_ui/sheard/network/remode/dio_helper.dart';

import '../../../modles/modle_login.dart';
import '../../../sheard/network/remode/end_points.dart';


class ShopcubitLogin extends Cubit<ShopStateLogin>
{
  ModleLogin? Loginmodle=null;
  bool obsquer=true;
  IconData iconofsufex=Icons.remove_red_eye;
  ShopcubitLogin(): super(initStateLogin());
  static ShopcubitLogin get(context)
  {
    return BlocProvider.of(context);
  }

  void UserLogin({required String email,required String password})
  {
    emit(LoadingStateLogin());
    dioHelper.postData(
        path: Login,
        data: {
          'email':'${email}',
          'password':'${password}',
        }).then((value)
    {
      print(value.toString());
      Loginmodle= ModleLogin.FromJason( value?.data) ;
      emit(successStateLogin(Loginmodle!));
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorStateLogin());
    });

  }

  void sufexclickIcon()
  {
    obsquer=!obsquer;
    if(obsquer)
    {
      iconofsufex=Icons.remove_red_eye;
    }
    else
    {
      iconofsufex=Icons.panorama_fish_eye;
    }
    emit(obscurState());
  }


}