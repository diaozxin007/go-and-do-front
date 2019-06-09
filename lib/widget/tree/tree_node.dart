
class Node<T>{
  // 能否展开
  bool expand;

  int id;
  int parentId;
  String path;

  Node(
      this.expand,
      this.id,
      this.parentId,
      this.path
      );
}