import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/Shop_App/cubit.dart';
import '../../../Layout/Shop_App/state.dart';
import '../../../modles/modle_category.dart';
import '../../../modles/modle_home.dart';

class shopProductes extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShopLayout,StateShopLayout>(
      listener: (context,state){},
      builder: (conext,state){
        return ConditionalBuilder(
            condition: CubitShopLayout.get(context).modle != null && CubitShopLayout.get(context).modleCategory != null ,
            builder: (context) => productesBuilder(context,CubitShopLayout.get(context).modle,CubitShopLayout.get(context).modleCategory,),
            fallback: (contetx){
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                  color: Colors.black,
                ),
              );
            });
      },
    );
  }
  Widget productesBuilder (context,ModleHome? modle,ModleCategory? modlecategory ) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: modle?.data.banners.map((e) => Image(image: NetworkImage('${e.image}'),
              fit: BoxFit.cover, width: double.infinity,)).toList(),
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              initialPage: 0,
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CATEGORIES  ',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily:'NewFontlogin.ttf',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                height: 105,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context,index){
                    return buildCategoryItems(modlecategory.data!.data[index]) ;
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(width: 6,);
                  },
                  itemCount: modlecategory!.data!.data.length,),
              ),
              SizedBox(height: 20,),
              Text('New Productes',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'NewFontlogin.ttf',
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            modle!.data.products.length,
                (index) => itmeBulder(modle.data.products[index],context),
          ),
        ),
      ],
    ),
  );

  Widget itmeBulder(productesData modle,context)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image(
            image: NetworkImage('${modle.image}',

            ),
            width: double.infinity,
            fit: BoxFit.contain,
            height: 200,
          ),
          if(modle.discount !=0)
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
      Padding(
        padding: EdgeInsetsDirectional.only(start: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${modle.name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                  fontWeight: FontWeight.w900
              ),
            ),
            Row(
              children:
              [
                Text('${modle.price}',
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
                if(modle.discount !=0)
                  Text('${modle.old_price}',
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
                      CubitShopLayout.get(context).changeFavorites(modle.id);
                    },
                    icon:Icon(CubitShopLayout.get(context).favorites![modle.id]!?Icons.favorite:Icons.favorite_border,
                        size: 20.0,
                        color: Colors.red
                    ) ),




              ],
            ),
          ],
        ),
      ),


    ],
  );

  Widget buildCategoryItems(DatamodleUser list)
  {
    return  Stack(
      children: [

        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage('${list.image}'),
              )
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 75),
          child: Container(
            width: 100,
            color: Colors.black.withOpacity(0.8),
            child:Text('${list.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
// عشان اعمل من اشي معين list من List موجوده عندي
// nameof List .map ((e) =>(حط ايش بدك توخد منها ).tolist)