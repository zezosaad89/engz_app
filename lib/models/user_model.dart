class UserModel {
  late String? name;
  late String? email;
  late String? uId;

  UserModel({this.uId, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
