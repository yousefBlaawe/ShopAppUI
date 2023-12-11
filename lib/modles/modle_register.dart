class RegisterModle
{
  late bool status;
  late String message;
  late DataModle data;
  RegisterModle.FromJason({required Map<String,dynamic>Jason})
  {
    status=Jason['status'];
    message=Jason['message'];
    data=DataModle.FromJason(Jason: Jason['data']);
  }
}
class DataModle
{
  late String name;
  late String phone;
  late String email;
  late int id;
  late String image;
  late String token;
  DataModle.FromJason({required var Jason})
  {
    if(Jason==null)
    {
      name="";
      phone='';
      email='';
      id=0;
      image='';
      token='';
    }
    else
    {
      name=Jason['name'];
      phone=Jason['phone'];
      email=Jason['email'];
      id=Jason['id'];
      image=Jason['image'];
      token=Jason['token'];
    }
  }
}

