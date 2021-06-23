import 'package:chat_app/model/chat_user.dart';
import 'package:chat_app/repository/user_repository.dart';

class FakeUserRepository extends UserRepository {
  ChatUser? _user;

  ChatUser? get user => _user;


  @override
  Future<ChatUser?> login() async {
    await Future.delayed(Duration(seconds: 1));
    _user = ChatUser('aaa@aaa.com', '', '임성수');
    return _user;
  }

  @override
  void logout() {
    _user = null;
  }
}
