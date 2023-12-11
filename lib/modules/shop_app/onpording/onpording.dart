import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_ui/sheard/network/local/cach_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../sheard/component/component/component.dart';
import '../Login_screen/login.dart';


class bordaringModle {
  final String image;
  final String title;
  final String body ;
  bordaringModle({required this.image, required this.title, required this.body}){}

}
class ONpordingSecreen extends StatefulWidget
{
  @override
  State<ONpordingSecreen> createState() => _ONpordingSecreenState();
}

class _ONpordingSecreenState extends State<ONpordingSecreen> {
  void submit()
  {
    cachHelper.SaveData(
      key: 'onsubmit',
      val: true,).then((value) {
      if(value != null)
        if(value)
        {
          setState(() {
            NavegatorAndFinsh(context, ShopLoginSecreen());

          });
        }
    });
  }
  var bordcontrollaor =PageController();
  bool isLast=false;
  List<bordaringModle> ListofBordaring=[
    bordaringModle(image: 'assets/image/bordaring6.png', title: 'On Borde 1 title', body: 'On Borde 1 body'),
    bordaringModle(image: 'assets/image/bordaring3.png', title: 'On Borde 2 title', body: 'On Borde 2 body'),
    bordaringModle(image: 'assets/image/bordaring4.png', title: 'On Borde 3 title', body: 'On Borde 3 body'),
  ];
  IconData iconBordaring=Icons.arrow_forward_ios_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed:submit,
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30
                  ),))
          ],
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index){
                    if(index ==ListofBordaring.length-1)
                    {
                      setState(() {
                        iconBordaring=Icons.account_circle;
                        isLast=true;
                      });
                      print('Last');

                    }
                    else
                    {
                      setState(() {
                        iconBordaring=Icons.arrow_forward_ios_outlined;
                        isLast=false;
                      });
                      print('no Last');
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){

                    return bordaringIteem(ListofBordaring[index]);
                  },
                  itemCount: ListofBordaring.length,
                  controller: bordcontrollaor,
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        spacing: 5.0,
                        expansionFactor: 4.0,
                        activeDotColor: Colors.deepOrange,
                      ),
                      controller: bordcontrollaor,
                      count: ListofBordaring.length),
                  Spacer(),
                  FloatingActionButton(

                    onPressed: (){
                      if(isLast)
                      {
                        submit();
                      }
                      else
                      {

                        bordcontrollaor.nextPage(duration: Duration(
                            milliseconds: 750
                        ), curve: Curves.easeInOutQuad);
                      }
                    },

                    backgroundColor: Colors.deepOrange,
                    child: Icon(iconBordaring),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }

  Widget bordaringIteem (bordaringModle modle){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset('${modle.image}',
              height: 250,),
          ),
        ),
        SizedBox(height: 30.0,),
        Text('${modle.title}',
          style: TextStyle(

              fontSize: 30.0,
              color: Colors.black
          ),
        ),
        SizedBox(height: 15.0,),
        Text('${modle.body}',
          style: TextStyle(
            fontSize: 20.0,

            color: Colors.black,
          ),
        )
      ],
    );
  }
}