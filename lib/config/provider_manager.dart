import 'package:flutter_base/view_model/user_model.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider<UserModel>.value(value: UserModel()),
];
