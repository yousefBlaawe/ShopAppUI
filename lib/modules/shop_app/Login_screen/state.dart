

import '../../../modles/modle_login.dart';

abstract class ShopStateLogin {}

class initStateLogin extends ShopStateLogin{}

class LoadingStateLogin extends ShopStateLogin{}

class successStateLogin extends ShopStateLogin{
  final ModleLogin modle;

  successStateLogin(this.modle);
}

class ErrorStateLogin extends ShopStateLogin {}

class obscurState extends ShopStateLogin{}
