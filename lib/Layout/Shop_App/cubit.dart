// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutteryousef/models/Shop_App/modle_home.dart';
// import 'package:flutteryousef/sheared/Network/REMODE/dioHelper.dart';
// import 'package:flutteryousef/sheared/Network/en_points.dart';
// import '../../modules/shop_app/categories/categoriesSecreen.dart';
// import '../../modules/shop_app/favarite/faveriteScreen.dart';
// import '../../modules/shop_app/ptoducts/productsSecreen.dart';
// import '../../modules/shop_app/settings/settings Screen.dart';
// import '../../sheared/componante/conestans.dart';
// import 'State_ShopLayout.dart';
//
// class cubitShopLayout extends Cubit<stateShopLayout>
// {
//   cubitShopLayout():super(initailState());
//   static cubitShopLayout get(context)
//   {
//     return BlocProvider.of(context);
//   }
//   int counter=0;
//   List<Widget> ListOfScreens =
//   [
//     ProductsScreen(),
//     CategoriesScreen(),
//     faveritesScreen(),
//     SettingsScreen(),
//   ];
//
//
//   void changeNavBar(int val)
//   {
//     counter=val;
//     emit(stateChangeNavbar());
//   }
//
//    ModleHome? modlehome=null;
//   void getHomeData()
//   {
//     emit(StateLodingHomeScren());
//     dioHelper.getData(url: Home ,token: token).then((value) {
//       modlehome=ModleHome.formJson(value.data);
//      print(modlehome?.data.banners[0].image);
//       print(modlehome);
//       emit(StateSuccssHomeScreen());
//
//     }).catchError((error){
//       print(error.toString());
//       emit(StateErrorHomeScreen());
//
//     });
//   }
//
//
//
// }


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_ui/Layout/Shop_App/state.dart';
import 'package:shopapp_ui/sheard/network/remode/dio_helper.dart';

import '../../modles/favorites.dart';
import '../../modles/modle_category.dart';
import '../../modles/modle_changeFavorites.dart';
import '../../modles/modle_home.dart';
import '../../modles/modle_login.dart';
import '../../modules/shop_app/categories/categories.dart';
import '../../modules/shop_app/favorites/favorites.dart';
import '../../modules/shop_app/products/productes.dart';
import '../../modules/shop_app/setting/setting.dart';
import '../../sheard/component/conestant/conestent.dart';
import '../../sheard/network/remode/end_points.dart';

class CubitShopLayout extends Cubit<StateShopLayout>
{
  CubitShopLayout():super(initState());
  static CubitShopLayout get(context)
  {
    return BlocProvider.of(context);
  }

  int count =0;
  List<Widget>ListOfScreens=[
    shopProductes(),
    CategoriesScreen(),
    faveritesScreen(),
    SettingsScreen(),
  ];
  void chaingNav(int index)
  {
    count=index;
    emit(ChaingNavState());
  }
  ModleHome? modle;
  Map<int,bool>?favorites={};
  void getDataFromModle()
  {
    emit(LodingDataState());
    dioHelper.getData(url: Home,token: token).then((value) {
      modle=ModleHome.formJson(value.data);
      modle?.data.products.forEach((element) {
        favorites?.addAll({
          element.id : element.inFavorites,
        });

      });
      print(favorites.toString());
      print( modle?.data.banners[0].image);
      emit(SucssesDataState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorDataState(error.toString()));
    });
  }

  ModleCategory? modleCategory;
  void getDataFromCategory()
  {

    dioHelper.getData(
      url: Category,
      lang: 'en',
    ).then((value) {
      modleCategory=ModleCategory.FromJason(value.data);
      emit(SuccessCategoryState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorCategoryState(error.toString()));
    });
  }
  modlefavoritsdata? ModleFavorites;
  void getDataFromFavorites()
  {
    emit(LoadingGetFavoritesState());
    dioHelper.getData(
        url: Favorites,
        lang: 'en',
        token: token
    ).then((value) {
      ModleFavorites=modlefavoritsdata.fromJson(value.data);
      emit(SuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetFavoritesState(error.toString()));
    });
  }



  ModleLogin? UserMoldeData;
  void Usermodle()
  {
    emit(LoadingUsermodleState());
    dioHelper.getData(
        url: Profile,
        lang: 'en',
        token: token
    ).then((value) {
      UserMoldeData=ModleLogin.FromJason( value.data);
      print(UserMoldeData?.data.name);
      emit(SuccessUsermodleState(UserMoldeData!));
    }).
    catchError((error){
      print(error.toString());
      emit(ErrorUsermodleState("${error.toString()}=========="));
    });
  }
  String image='';
  void UpdateData(
      {
        required String name,
        required String phone,
        required String email,



      }
      )
  {
    emit(LoadingUpdateDatState());
    dioHelper.putData(
        url: Updata,
        lang: 'en',
        token: token, data: {
      'name':name,
      'phone':phone,
      'email':email,

      'image':image,
    }
    ).then((value) {
      UserMoldeData=ModleLogin.FromJason( value.data);
      print(UserMoldeData?.data.name);
      emit(SuccessUpdateDataState(UserMoldeData!));
    }).
    catchError((error){
      print(error.toString());
      emit(ErrorUpdateDataState("${error.toString()}=========="));
    });
  }

  IconData icon=Icons.favorite_border;
  bool isclickIcon =false;
  void ClickIconFavorite()
  {
    if(isclickIcon)
    {
      icon=Icons.favorite;
      isclickIcon=false;
    }
    else
    {
      icon=Icons.favorite_border;
      isclickIcon=true;
    }
    emit(FavoriteIconState());
  }


  void changeFavorites(int ProductesID)
  {
    favorites?[ProductesID]=!favorites![ProductesID]!;
    emit(SuccessFavoritesState());
    modlefaorites ModleFavorites;
    dioHelper.postData(
      path: Favorites,
      data: {'product_id':ProductesID},
      token: token,

    ).
    then((value) {
      ModleFavorites=modlefaorites.fromJason(value?.data);
      if(!ModleFavorites.status)
      {
        favorites?[ProductesID]=!favorites![ProductesID]!;
      }
      else
      {
        getDataFromFavorites();
      }
      print(value?.data);
      emit(SuccessFavoritesState());
    }).
    catchError((Error){
      print(Error.toString());
      emit(ErrorFavoritesState(Error));
    });
  }


}