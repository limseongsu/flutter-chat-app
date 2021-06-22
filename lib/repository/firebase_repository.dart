import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/repository.dart';

class FirebaseRepository extends Repository {
  @override
  Future<List<Chat>> getChatList() {
    throw UnimplementedError();
  }

  @override
  Future pushMessage(String email, String message, int time) {
    throw UnimplementedError();
  }

}
