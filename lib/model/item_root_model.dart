///公用列表item根元素model
class ItemRootModel {
  String title;
  int childCount;
  int childDeadlineCount;
  String deadline;

  ItemRootModel({this.title, this.childCount, this.childDeadlineCount,
      this.deadline});

  ItemRootModel.fromJson(Map<String,dynamic> json){
    title = json['title'];
    childCount = json['childCount'];
    childDeadlineCount = json['childDeadlineCount'];
    deadline = json['deadline'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['title'] = this.title;
    data['childCount'] = this.childCount;
    data['childDeadlineCount'] = this.childDeadlineCount;
    data['deadline'] = this.deadline;
    return data;
  }
}