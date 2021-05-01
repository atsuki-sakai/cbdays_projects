import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/service/api_path.dart';
import 'package:cbdyas_project/service/firestore_service.dart';

class Database {

  final FireStoreService _service = FireStoreService.instance;

  Future<void> setUser({required CbdaysUser user}) async {
    final _path = APIPath.user(uid: user.uid);
    await _service.setData(path: _path, data: user.toMap());
  }

  Future<CbdaysUser?> fetchUser({required userId}) async {
    final _path = APIPath.user(uid: userId);
    final _data = await _service.getData(path: _path);
    print('_data -> $_data');
    if(_data == null) return null;
    final CbdaysUser user = CbdaysUser.fromMap(_data);
    return user;
  }
}
