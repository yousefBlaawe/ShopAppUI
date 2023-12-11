class ModleLogin
{
  late bool status;
  late dynamic message;
  late UserData data;
  ModleLogin.FromJason( Map<String,dynamic>Jason)
  {
    status=Jason['status'];
    message=Jason['message'];
    data= UserData.FromJason(Jason: Jason['data']) ;
  }

}

class UserData
{
  int id=0;
  String name="";
  String email="";
  String phone="";
  String image="";
  int points=0;
  int credit=0;
  String token="";

//   UserData(
//       this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.points,
//       this.credit,
//       this.token,
// )
//   {}

  //named constructor
  UserData.FromJason( {required Map<String,dynamic>?Jason})
  {
    if(Jason !=null){
      id=Jason?['id'];
      name=Jason?['name'];
      email=Jason?['email'];
      phone=Jason?['phone'];
      image=Jason?['image'];
      points=Jason?['points'];
      credit=Jason?['credit'];
      token=Jason?['token'];
    }
    else
    {
      id=0;
      name="";
      email="";
      phone="";
      image="";
      points=0;
      credit=0;

    }
  }




}

