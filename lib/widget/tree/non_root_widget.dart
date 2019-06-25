import 'package:flutter/material.dart';

class NonRootWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String tagLabel;
  final String overdueLabel;
  final DateTime overdueTime;
  final bool expand;
  final VoidCallback onPressNext;

  const NonRootWidget(
      {Key key,
      @required this.title,
      this.icon,
      this.overdueLabel,
      this.onPressNext,
      this.expand = false,
      this.tagLabel,
      this.overdueTime});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(title);
    IconButton expandButton =
        IconButton(icon: Icon(Icons.navigate_next), onPressed: onPressNext);
    Icon leafIcon = Icon(Icons.donut_large);
    return Card(
      child: ListTile(
        leading: icon,
        title: titleWidget,
        subtitle: Text(overdueLabel),
        trailing: expand ? expandButton : leafIcon
      ),
    );
  }
}
