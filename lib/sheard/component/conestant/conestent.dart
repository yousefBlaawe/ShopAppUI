//POST
//UPDATE
//DELETE
//GET


// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=us&category=business&apiKey=API_KEY


// https://newsapi.org/
// v2/everything?
// q=tesla&from=2023-08-30&sortBy=publishedAt&apiKey=API_KEY

// https://newsdata.io/
// api/1/news?
// apikey=YOUR_API_KEY&q=cryptocurrency

// https://newsapi.org/
// v2/everything
// ?q=tesla&from=2023-09-01&sortBy=publishedAt&apiKey=API_KEY


//https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=1023309fc9274142b30cfa8af9a13e27


// https://newsapi.org/
// v2/everything?
// q=apple&from=2023-09-30&to=2023-09-30&sortBy=popularity&apiKey=1023309fc9274142b30cfa8af9a13e27

//https://newsapi.org/
// v2/everything?
// q=COVID&from=2020-03-16&sortBy=publishedAt&apiKey=&pageSize=100&page=1

//https://newsapi.org/
// v2/everything?
// q=bitcoin&apiKey=1023309fc9274142b30cfa8af9a13e27

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1023309fc9274142b30cfa8af9a13e27

//https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=1023309fc9274142b30cfa8af9a13e27
//search url



import 'package:shopapp_ui/sheard/network/local/cach_helper.dart';
import '../../../modules/shop_app/Login_screen/login.dart';
import '../component/component.dart';

signOut(context)
{
  // var cachHelper;
  cachHelper.removeData(key: "token").then((value) {
    NavegatorAndFinsh(context,
      ShopLoginSecreen(),
    );
  });
}

late var token;