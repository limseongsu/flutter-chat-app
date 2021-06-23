import 'package:chat_app/model/user.dart';
import 'package:chat_app/repository/user_repository.dart';

class FakeUserRepository extends UserRepository{
  User? _user;
  User? get user => _user;

  @override
  User? getUserInfo() {
    return _user;
  }

  @override
  Future login()  async{
    await Future.delayed(Duration(seconds: 1));
    _user = User('aaa@aaa.com','','임성수');

  }

  @override
  void logout() {

    _user = null;
  }

}