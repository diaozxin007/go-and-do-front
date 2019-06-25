import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final int availableCount;
  final String availableLabel;
  final int overdueCount;
  final String overdueLabel;
  final bool expand;
  final VoidCallback onPressNext;

  const RootWidget(
      {Key key,
      @required this.title,
      this.icon,
      this.availableCount,
      this.availableLabel,
      this.overdueCount,
      this.overdueLabel,
      this.onPressNext,
      this.expand = true});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(title);
    IconButton expandButton =
        IconButton(icon: Icon(Icons.navigate_next), onPressed: onPressNext);
    return expand
        ? Card(
            child: ListTile(
              leading: icon,
              title: titleWidget,
              trailing: expandButton,
            ),
          )
        : Card(
            child: ListTile(
              leading: icon,
              title: titleWidget,
            ),
          );
  }
}
