import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/modules/shop_app/register_screen/state.dart';
import 'package:shopapp_ui/sheard/network/local/cach_helper.dart';

import '../../../Layout/Shop_App/ShopLayout.dart';
import '../../../sheard/component/component/component.dart';
import '../../../sheard/component/conestant/conestent.dart';
import 'cubit.dart';
class RegisterScreen  extends StatelessWidget
{
  var KEY=GlobalKey<FormState>();
  var name =TextEditingController();
  var phone=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) {
        return CubitRegister();
      },
      child: BlocConsumer<CubitRegister,RegisterState>(
        listener: (context,state){
          if (state is SuccsseSignInSate) {
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
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Register'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: KEY,
                  child: Column(
                    children: [
                      defultTextFromFild(
                          Controller: name,
                          KeypordType: TextInputType.text,
                          valid: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return 'name con\'t be null ';
                            }
                          },
                          ICON: Icons.person,
                          lable: 'Name'),
                      SizedBox(height: 20,),
                      defultTextFromFild(
                          Controller: phone,
                          KeypordType: TextInputType.number,
                          valid: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return 'Phone con\'t be null ';
                            }
                          },
                          ICON: Icons.phone,
                          lable: 'Phone'),
                      SizedBox(height:20 ,),
                      defultTextFromFild(
                          Controller: email,
                          KeypordType: TextInputType.text,
                          valid: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return 'email con\'t be null ';
                            }
                          },
                          ICON: Icons.email,
                          lable: 'Email'),
                      SizedBox(height:20 ,),
                      defultTextFromFild(
                          Controller: password,
                          KeypordType: TextInputType.text,
                          valid: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return 'Password con\'t be null ';
                            }
                          },
                          ICON: Icons.password,
                          lable: 'Password'),
                      SizedBox(height: 30,),
                      ConditionalBuilder(
                        condition: state is! LoadingStateSignIn,
                        builder: (BuildContext context) {
                          return defultButton(
                              onpressd: (){
                                if (KEY.currentState!.validate()) {
                                  CubitRegister.get(context).signIn(
                                      name: name.text, phone: phone.text, email: email.text, password: password.text
                                  );
                                }

                              },
                              text: 'SignIn');
                        },
                        fallback: (BuildContext context) { return CircularProgressIndicator() ;},

                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}