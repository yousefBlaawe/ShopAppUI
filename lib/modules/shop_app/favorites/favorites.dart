import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/Shop_App/cubit.dart';
import '../../../Layout/Shop_App/state.dart';
import '../../../modles/favorites.dart';
class faveritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShopLayout,StateShopLayout>(
        builder: (context,state)=>ListView.separated(
          itemBuilder:
              (context,index)
          {
            return FavoritesItems(  CubitShopLayout.get(context).ModleFavorites!.data!.data![index],context);
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
          itemCount: CubitShopLayout.get(context).ModleFavorites!.data!.data!.length,),
        listener: (context,state){});
  }


  Widget FavoritesItems(FavoritesData modle,context)
  {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage("${modle.product!.image}",

                  ),
                  width: 120,
                  fit: BoxFit.contain,
                  height: 120,
                ),
                if(modle.product!.discount!=0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 15,
                      width: 70,
                      decoration: BoxDecoration(

                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${modle!.product!.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                  Spacer(),
                  Row(
                    children:
                    [
                      Text('${modle!.product!.price.toString()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0,
                            height: 1.3,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                      SizedBox(width: 5,),
                      if(1 !=0)
                        Text('${modle!.product!.oldPrice.toString()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.3,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(

                          onPressed: (){
                            CubitShopLayout.get(context).changeFavorites(modle.product!.id!);
                          },
                          icon:Icon(CubitShopLayout.get(context).favorites![modle.product!.id]!?Icons.favorite:Icons.favorite_border,
                              size: 20.0,
                              color: Colors.red
                          ) ),




                    ],
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}