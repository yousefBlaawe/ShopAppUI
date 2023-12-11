// abstract class stateShopLayout {}
// class initailState extends stateShopLayout{}
//
// class stateChangeNavbar extends stateShopLayout{}
//
// class StateLodingHomeScren extends stateShopLayout{}
//
// class StateSuccssHomeScreen extends stateShopLayout{}
//
// class StateErrorHomeScreen extends stateShopLayout{}


import '../../modles/modle_login.dart';

abstract class StateShopLayout {}
class initState extends StateShopLayout{}
class ChaingNavState extends StateShopLayout{}
class LodingDataState extends StateShopLayout{}
class SucssesDataState extends StateShopLayout{}
class ErrorDataState extends StateShopLayout{
  final String error;

  ErrorDataState(this.error);

}
class SuccessCategoryState extends StateShopLayout{}
class ErrorCategoryState extends StateShopLayout{
  final String Error;

  ErrorCategoryState(this.Error);

}
class FavoriteIconState extends StateShopLayout{}
class SuccessFavoritesState extends StateShopLayout{}
class ErrorFavoritesState extends StateShopLayout{
  final String Error;

  ErrorFavoritesState(this.Error);

}
class SuccessGetFavoritesState extends StateShopLayout{}
class LoadingGetFavoritesState extends StateShopLayout{}
class ErrorGetFavoritesState extends StateShopLayout{
  final String Error;

  ErrorGetFavoritesState(this.Error);

}
class ErrorUsermodleState extends StateShopLayout{
  final String Error;

  ErrorUsermodleState(this.Error);

}
class SuccessUsermodleState extends StateShopLayout{
  ModleLogin modle;
  SuccessUsermodleState(this.modle);
}
class LoadingUsermodleState extends StateShopLayout{}
class SuccessUpdateDataState extends StateShopLayout{
  ModleLogin modle;
  SuccessUpdateDataState(this.modle);
}
class LoadingUpdateDatState extends StateShopLayout{}
class ErrorUpdateDataState extends StateShopLayout{
  final String Error;

  ErrorUpdateDataState(this.Error);

}