import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/Shop_App/cubit.dart';
import '../../../Layout/Shop_App/state.dart';
import '../../../sheard/component/component/component.dart';
import '../../../sheard/component/conestant/conestent.dart';

class SettingsScreen extends StatelessWidget
{
  var name =TextEditingController();
  var email=TextEditingController();
  var phone =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: CubitShopLayout.get(context).UserMoldeData!=null,
      builder: (BuildContext context) {
        return BlocConsumer<CubitShopLayout,StateShopLayout>(
          listener: (context,state){
            if (state is SuccessUsermodleState) {
              name.text=state.modle.data.name;
              email.text=state.modle.data.email;
              phone.text=state.modle.data.phone;
            }
          },
          builder: (context,state){
            var modle=CubitShopLayout.get(context).UserMoldeData;
            name.text=modle!.data.name;
            email.text=modle!.data.email;
            phone.text=modle!.data.phone;

            return  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                  defultTextFromFild(
                      Controller: name,
                      KeypordType: TextInputType.text,
                      valid: (String? val)
                      {
                        if(val!.isEmpty)
                        {
                          return 'Name Can\'t be empty';
                        }
                      },
                      ICON: Icons.person,
                      lable: 'name '),
                  SizedBox(height: 30,),

                  defultTextFromFild(
                      Controller: email,
                      KeypordType: TextInputType.text,
                      valid: (String? val)
                      {
                        if(val!.isEmpty)
                        {
                          return 'Email Coc\'t be empty';
                        }
                      },
                      ICON: Icons.email_outlined,
                      lable: 'Email Address'),
                  SizedBox(height: 30,),

                  defultTextFromFild(
                      Controller: phone,
                      KeypordType: TextInputType.number,
                      valid: (String? val)
                      {
                        if(val!.isEmpty)
                        {
                          return 'Phone Coc\'t be empty';
                        }
                      },
                      ICON: Icons.phone,
                      lable: 'phone '),
                  SizedBox(height: 40,),
                  defultButton(onpressd: (){
                    signOut(context);
                  }, text: 'Logout'),
                  SizedBox(height: 30,),
                  defultButton(
                      onpressd: (){
                        CubitShopLayout.get(context).UpdateData(name: name.text, phone: phone.text, email: email.text, );
                      },
                      text: 'Update'),
                ],
              ),
            );
          },
        );
      },
      fallback: (BuildContext context) {
        return Center(
          child: CircleAvatar(

            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),

          ),
        );
      },

    );
  }

}