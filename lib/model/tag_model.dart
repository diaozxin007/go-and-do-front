
class TagModel {
  String title;
  int status;
  int userId;
  String createAt;
  String updateAt;

  TagModel(
      {this.title, this.status, this.userId, this.createAt, this.updateAt});

  TagModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
    userId = json['userId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
