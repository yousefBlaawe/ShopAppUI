import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/Layout/Shop_App/state.dart';

import '../../modules/shop_app/search/search.dart';
import '../../sheard/component/component/component.dart';
import 'cubit.dart';

class shopLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CubitShopLayout,StateShopLayout>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit=CubitShopLayout.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text(
              'Sallh',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                navegatorTo(context, SearchSecreen());
              }, icon:Icon(Icons.search) )
            ],
          ),
          body:cubit.ListOfScreens[cubit.count] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.count,
            onTap: (index){
              cubit.chaingNav(index);
            },
            fixedColor: Colors.deepOrange,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.apps),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.settings),
                label:'Settings',
              )
            ],

          ),
        );
      },
    );

  }
//     return BlocConsumer<cubitShopLayout,stateShopLayout>(
//       listener: (cintext,state){},
//       builder: (context,state){
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'yousef Market ',
//             ),
//             actions: [
//               IconButton(onPressed: (){
//                 navegatorTo(context, SearchSecreen());
//               }, icon: Icon(Icons.search)),
//             ],
//           ),
//           body: cubitShopLayout.get(context).ListOfScreens[cubitShopLayout.get(context).counter],
//           bottomNavigationBar: BottomNavigationBar(
//             onTap: (val){
//               cubitShopLayout.get(context).changeNavBar(val);
//             },
//             currentIndex: cubitShopLayout.get(context).counter,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.home),
//               label: 'Home'
//               ),
//               BottomNavigationBarItem(icon: Icon(Icons.apps),
//                   label: 'category'
//               ),
//               BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
//                   label: 'favorite'
//               ),
//               BottomNavigationBarItem(icon: Icon(Icons.settings),
//                   label: 'Settings'
//               ),
//             ],
//
//           ),
//         );
//       },
//     );

}