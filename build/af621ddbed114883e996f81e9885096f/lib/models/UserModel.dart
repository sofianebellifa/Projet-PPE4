class UserModel {
  String uid;
  final String email;
  final String password;
  

  UserModel({this.uid, this.email, this.password});

  set setUid(value) => uid = value;
  

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
      };
}
