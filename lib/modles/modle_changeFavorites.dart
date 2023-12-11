class modlefaorites {
  late bool status;
  late String message;
  modlefaorites.fromJason(Map<String,dynamic>Jason)
  {
    status=Jason['status'];
    message=Jason['message'];
  }
}
