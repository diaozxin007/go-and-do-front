///公用列表item根元素model
class ItemRootModel {
  int id;
  String title;
  int childCount;
  int childDeadlineCount;
  String deadline;

  ItemRootModel({this.id,this.title, this.childCount, this.childDeadlineCount,
      this.deadline});

  ItemRootModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    childCount = json['childCount'];
    childDeadlineCount = json['childDeadlineCount'];
    deadline = json['deadline'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['childCount'] = this.childCount;
    data['childDeadlineCount'] = this.childDeadlineCount;
    data['deadline'] = this.deadline;
    return data;
  }
}