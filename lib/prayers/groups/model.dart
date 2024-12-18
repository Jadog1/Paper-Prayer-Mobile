
class Group {
  int id;
  String name;
  String description;
  List<User> members = []; 

  Group({
    this.id = 0,
    required this.name,
    required this.description,
    required this.members,
  });
}

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });
}

class PrayerRequest {
  int id;
  String request;
  User user;

  PrayerRequest({
    required this.id,
    required this.request,
    required this.user,
  });
}