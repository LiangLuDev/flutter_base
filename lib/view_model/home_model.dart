import 'package:flutter_base/provider/view_state_list_model.dart';
import 'package:flutter_base/service/dubbing_repository.dart';

class HomeModel extends ViewStateListModel{

  @override
  Future<List> loadData() async {
    return await DubbingRepository.fetchBanners();
  }

}