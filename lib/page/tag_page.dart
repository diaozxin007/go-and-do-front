import 'package:flutter/material.dart';
import 'package:goanddo/model/tag_model.dart';
import 'package:goanddo/page/tag_add_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TagPage extends StatefulWidget {
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final items = new List<String>.generate(1000, (i) => 'Item $i');
  List<TagModel> tags;

  _loadTags(){
    final tags = new List<TagModel>();
    for(var i = 0; i < 100; i++){
      tags.add(TagModel(title: '标签$i',status: i % 3 == 0 ? 0 : i % 3 == 1 ? 1 : 2));
    }
    return tags;
  }


  @override
  void initState() {
    super.initState();
    tags = _loadTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标签'),
      ),
      body: _buildTagList(),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              FontAwesomeIcons.plusCircle,
              color: Colors.blue,
            ),
          ),
          onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TagAddPage()))
              },
        ),
        color: Colors.white70,
        elevation: 18.0,
      ),
    );
  }

  Widget _buildTagList() {
    return ListView.builder(
      itemCount: tags.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${tags[index].title}'),
          subtitle: Container(
            alignment: Alignment.bottomLeft,
            child:  tags[index].status == 0 ? Icon(
              FontAwesomeIcons.playCircle,
              size: 15,
              color: Colors.green[300],
            ) : tags[index].status == 1 ? Icon(
              FontAwesomeIcons.pauseCircle,
              size: 15,
              color: Colors.blue[300],
            ) : Icon(
              FontAwesomeIcons.ban,
              size: 15,
              color: Colors.red[300],
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return TagAddPage(tagModel: tags[index],);
            }));
          },
        );
      },
    );
  }
}


