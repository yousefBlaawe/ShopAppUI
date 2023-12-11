import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/modules/shop_app/Login_screen/state.dart';
import 'package:shopapp_ui/sheard/network/local/cach_helper.dart';

import '../../../Layout/Shop_App/ShopLayout.dart';
import '../../../sheard/component/component/component.dart';
import '../../../sheard/component/conestant/conestent.dart';
import '../register_screen/register.dart';
import 'cubit.dart';


class ShopLoginSecreen extends StatelessWidget{
  var EamilControllor =TextEditingController();
  var PasswordControllor =TextEditingController();
  var KEY =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShopcubitLogin();
      },
      child: BlocConsumer<ShopcubitLogin,ShopStateLogin>(
        listener: (context,state){
          if (state is successStateLogin)
          {
            if(state.modle.status)
            {
              print(state.modle.message);
              print(state.modle.data.token);
              // defultToast(message: '${state.modle.message}', state: ToastState.SUCCESS);
              cachHelper.SaveData(key: 'token', val:state.modle.data.token ).then((value) {
                token=state.modle.data.token;
                NavegatorAndFinsh(context, shopLayout());
              });
            }
            else
            {

              print(state.modle.message);
              // defultToast(message: '${state.modle.message}', state: ToastState.ERROR);
            }
          }
        },
        builder: (context,state){return  Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Form(
                  key: KEY,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        'login now to browse our hot offers ',
                        style: TextStyle(fontSize: 20.0,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                      SizedBox(height: 20.0,),
                      defultTextFromFild(
                        Controller: EamilControllor,
                        KeypordType: TextInputType.text,
                        IconColorpreAndsuf: Colors.deepOrange,
                        valid: (String? val){
                          if(val!.isEmpty)
                            return 'Email con\'t be empty';
                          else
                            return null;

                        },
                        ICON: Icons.email,
                        lable: 'Email',
                        outlineColor: Colors.deepOrange,
                      ),
                      SizedBox(height: 10.0,),
                      SizedBox(height: 15.0),
                      defultTextFromFild(
                        IconColorpreAndsuf: Colors.deepOrange,
                        Controller:PasswordControllor,
                        KeypordType: TextInputType.text,
                        valid: (String? val){
                          if(val!.isEmpty)
                            return 'Password con\'t be empty';
                          else
                            return null;

                        },
                        ICON: Icons.email,
                        lable: 'Password',
                        outlineColor: Colors.deepOrange,
                        obscore: ShopcubitLogin.get(context).obsquer,
                        IconB: IconButton(onPressed: (){
                          ShopcubitLogin.get(context).sufexclickIcon();
                        }, icon:  Icon(ShopcubitLogin.get(context).iconofsufex,color: Colors.deepOrange
                          ,)),
                      ),
                      SizedBox(height: 30.0,),
                      ConditionalBuilder(
                        condition:state is! LoadingStateLogin, //state is! LoadingStateLogin,
                        builder: (context){
                          return  defultButton(
                            onpressd: (){
                              if(KEY.currentState!.validate())
                              {
                                ShopcubitLogin.get(context).UserLogin(
                                    email:EamilControllor.text ,
                                    password:PasswordControllor.text );
                                print('${EamilControllor.toString()}');
                                print('${PasswordControllor.toString()}');
                              }
                            },
                            text: 'login',
                            backgrundColor: Colors.deepOrange,
                          );
                        },
                        fallback: (context){
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.deepOrange,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Text('if you don\'t have an account? ',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                          defultTextButton(
                              onpress: (){
                                navegatorTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: 'register',
                              colorofText: Colors.deepOrange,
                              size: 20.0
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );},
      ),
    );
  }

}