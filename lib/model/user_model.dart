
class UserModel {
  int id;
  String nickname;
  String email;
  String password;
  String createAt;
  String updateAt;

  UserModel(
      {this.id,
        this.nickname,
        this.email,
        this.password,
        this.createAt,
        this.updateAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    email = json['email'];
    password = json['password'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
