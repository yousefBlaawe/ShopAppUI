import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/Shop_App/cubit.dart';
import '../../../Layout/Shop_App/state.dart';
import '../../../modles/modle_category.dart';


class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShopLayout,StateShopLayout>(
        builder: (context,state)=>ListView.separated(
            itemBuilder:
                (context,index)
            {
              return bulidCategoriesItems(CubitShopLayout.get(context).modleCategory!.data!.data[index]);
            },
            separatorBuilder:
                (context,index)
            {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                  width: double.infinity,
                ),
              );
            },
            itemCount: CubitShopLayout.get(context).modleCategory!.data!.data.length),
        listener: (context,state){});

  }

  Widget bulidCategoriesItems(DatamodleUser modle)
  {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image(image: NetworkImage("${modle.image}"),
            height: 120,
            width: 120,
          ),
          SizedBox(width: 20,),
          Text('${modle.name}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios,
            size: 25,
            color: Colors.black,
          )
        ],
      ),
    );
  }

}