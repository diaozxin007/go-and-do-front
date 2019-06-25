import 'package:meta/meta.dart';

class TreeNode {
  // 能否展开
  final String title;
  final bool expand;
  final bool root;
  final List<TreeNode> childData;

  TreeNode(
      {@required this.title,
      this.expand = false,
      this.root = false,
      this.childData = const <TreeNode>[]});
}
