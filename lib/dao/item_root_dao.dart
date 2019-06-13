
import 'dart:convert';

import 'package:goanddo/model/item_root_model.dart';
import 'package:http/http.dart' as http;

const ITEM_ROOT_URL = 'https://todo.xilidou.com/api/rootList?type=';
class ItemRootDao {
  static Future<ItemRootModel> fetch(String type) async {
    final response = await http.get(ITEM_ROOT_URL + type);
    if (response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return ItemRootModel.fromJson(result);
    } else {
      throw Exception('Failed to load rootList');
    }
  }
}