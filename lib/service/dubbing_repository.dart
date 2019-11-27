
import 'package:flutter_base/config/net/http.dart';
import 'package:flutter_base/model/banner.dart';

class DubbingRepository{
// 轮播
  static Future fetchBanners() async {
    var response = await http.get('banner/json');
    return response.data
        .map<DBanner>((item) => DBanner.fromJsonMap(item))
        .toList();
  }
}