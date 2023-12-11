class ModleHome
{
  late bool status;
  late UserData data;
  ModleHome.formJson(Map<String,dynamic>Json)
  {
    status=Json['status'];
    data=UserData.fromJason(Json['data']);
  }
}


class UserData
{
  List<BannersData> banners=[];
  List<productesData> products=[];
  UserData.fromJason(Map<String,dynamic>Json)
  {
    Json['banners'].forEach((element){
      banners.add(BannersData.fromJason(element));
    });
    Json['products'].forEach((element){
      products.add(productesData.fromJason(element));
    });

  }
}

class BannersData
{
  late int id;
  late String image;
  BannersData.fromJason(Map<String,dynamic>Json)
  {
    id=Json['id'];
    image=Json['image'];
  }
}

class productesData
{
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool  inFavorites;
  late bool inCart;


  productesData.fromJason(Map<String,dynamic>Json)
  {
    id=Json['id'];
    price=Json['price'];
    old_price=Json['old_price'];
    discount=Json['discount'];
    image=Json['image'];
    name=Json['name'];
    inFavorites=Json['in_favorites'];
    inCart=Json['in_cart'];
  }
}

//
// import 'package:flutteryousef/modules/massenger/maslist.dart';
//
// class modleHomeShop
// {
//    late bool status;
//   late  Datamodle data;
//    modleHomeShop.FromJason(Map<String,dynamic>Jason)
//    {
//      status=Jason['status'];
//      data=Datamodle.FromJason(Jason['data']);
//    }
// }
//  class Datamodle
//  {
//     late List<bannersmodle> Banners=[] ;
//     late List<productsmodle> Productes=[];
//     Datamodle.FromJason(Map<String,dynamic>Jason)
//     {
//       Banners.forEach((element) {
//         Banners.add(bannersmodle.FromJason(element as Map<String, dynamic>));
//         Productes.forEach((element) {
//           Productes.add(productsmodle.FromJason(element as Map<String, dynamic>));
//     });
//     });
//     }
//
//  }
//  class bannersmodle
//  {
//    late int id;
//    late String image;
//    bannersmodle.FromJason(Map<String,dynamic> Jason)
//    {
//      if(Jason==null)
//        {
//          id=0;
//          image='';
//        }
//      else
//        {
//          id=Jason['id'];
//          image=Jason['image'];
//        }
//    }
//  }
//  class productsmodle
//  {
//    late int id;
//  late dynamic price;
//  late dynamic old_price;
//  late dynamic discount;
//  late String image;
//  late String name;
//  late bool  inFavorites;
//  late bool inCart;
//    productsmodle.FromJason(Map<String,dynamic> Jason)
//    {
//      if(Jason==null)
//        {
//          id=0;
//          price=0;
//          old_price=0;
//          discount=0;
//          image='';
//          name='';
//          inFavorites=false;
//          inCart=false;
//        }
//      else
//        {
//          id=Jason['id'];
//          price=Jason['price'];
//          old_price=Jason['old_price'];
//          discount=Jason['discount'];
//          image=Jason['image'];
//          name=Jason['name'];
//          inFavorites=Jason['in_favorites'];
//          inCart=Jason['in_cart'];
//        }
//    }
//  }