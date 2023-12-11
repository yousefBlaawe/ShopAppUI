import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defultButton(
    {
      double Height=50.0,
      double Width=double.infinity,
      required void Function() onpressd,
      required String text,
      double radus=10.0,
      Color backgrundColor=Colors.blue,
      Color Textcolor=Colors.white

    }
    )
{
  return  Container(
    height: Height,
    width:Width ,
    child: TextButton(
        onPressed:onpressd,
        child: Text(
          '${text.toUpperCase()}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Textcolor,
          ),
        )),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radus),
      color: backgrundColor,
    ),
  );
}



Widget defultTextButton({required void Function() onpress,required String  text ,Color? colorofText,double? size})
{
  return TextButton(onPressed: onpress, child: Text('${text}',style: TextStyle(color: colorofText,fontSize: size),)  ) ;
}

Widget defultTextFromFild({
  required TextEditingController Controller,
  required TextInputType KeypordType,
  bool obscore =false,
  Function(String val)? onFiled,
  required String? Function (String? val) valid,
  double radus=10.0,
  void  Function ()? ontap,
  required IconData ICON,
  IconButton? IconB,
  required String lable,
  bool isCleck=true,
  void Function (String val)?onchange,
  Color outlineColor=Colors.blue,
  Color IconColorpreAndsuf=Colors.blue,

})
{
  return  TextFormField(
    onChanged:onchange ,
    enabled:isCleck ,
    controller:Controller ,
    keyboardType: KeypordType,
    obscureText: obscore,
    onFieldSubmitted:onFiled,
    validator:valid,
    onTap: ontap,
    decoration: InputDecoration(
      labelStyle: TextStyle(
        fontSize: 25.0,
        color: outlineColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radus),

      ),
      labelText: '${lable.toUpperCase()}',
      prefixIcon: Icon(ICON,color: IconColorpreAndsuf,),
      suffixIcon: IconB,



    ),
  );
}






Widget BulderArticalItem(artical) {
  var net=artical['urlToImage'];
  if(net == null )
  {
    net ='https://static8.depositphotos.com/1187563/964/i/450/depositphotos_9647592-stock-photo-error-sign-with-hand.jpg';
  }

  return Padding(
    padding: EdgeInsetsDirectional.all(10),
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(

              image: NetworkImage(net),
              fit: BoxFit.cover,

            ),

          ),

        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${artical['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10,),
                Text('${artical['publishedAt']}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                    fontSize: 15.0,
                  ),
                )

              ],
            ),
          ),
        )
      ],
    ),
  );
}


Widget BuderItmen2 (artical)
{
  return Padding(
    padding: EdgeInsetsDirectional.all(10),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${artical['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            width: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${artical['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrange
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('${artical['publishedAt']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}



Future  navegatorTo(context,widget)
{
  return Navigator.push(context,
      MaterialPageRoute(
          builder:(context)
          {
            return widget;
          }
      ));
}

NavegatorAndFinsh (context,widget)
{
  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context){return widget;}),
          (Route<dynamic> route) => false);
}




//    defultToast({required String  message,required ToastState state})
// {
//  return Fluttertoast.showToast(
//    msg: '${message}',
//    textColor: choosToastColor(state),
//    timeInSecForIosWeb: 3,
//    backgroundColor: Colors.black,
//    toastLength: Toast.LENGTH_LONG,
//    fontSize: 15.0,
//    gravity: ToastGravity.BOTTOM,
//
//  );
// }

enum ToastState{SUCCESS,ERROR,WORING}
Color choosToastColor(ToastState colorstate)
{
  Color color;
  switch(colorstate)
  {
    case ToastState.SUCCESS:
      color=Colors.white70;
      break;
    case ToastState.ERROR:
      color=Colors.white;
      break;
    case ToastState.WORING:
      color=Colors.amber;
      break;
  }
  return color;
}

