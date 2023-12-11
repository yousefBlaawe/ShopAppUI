class ModleCategory
{
  late bool status;
  DataModle ? data=null ;
  ModleCategory.FromJason(Map<String,dynamic>Jason)
  {
    status=Jason['status'];
    data=DataModle.FromJason(Jason['data']);
  }
}
class DataModle
{
  late int current_page;
  List<DatamodleUser> data=[];
  DataModle.FromJason(Map<String,dynamic>Jason)
  {
    current_page=Jason['current_page'];
    Jason['data'].forEach((elemant){
      data.add(DatamodleUser(elemant));
    });

  }
}

class DatamodleUser
{
  late int id;
  late String name;
  late String image;
  DatamodleUser(Map<String,dynamic>Jason)
  {
    id=Jason['id'];
    name=Jason['name'];
    image=Jason['image'];
  }
}