import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/repository.dart';

class FakeRepository extends Repository {
  final List<Chat> items = [
    Chat('홍길동', null, 'hello world', 100234234234, 'aaa@aaa.com'),
    Chat(
        '홍길동',
        null,
        'hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2',
        100234234234,
        'aaa@aaa.com'),
    Chat('한석봉', null, 'hello world 3', 100234234234, 'bbb@aaa.com'),
  ];

  @override
  Future<List<Chat>> getChatList() async {
    await Future.delayed(Duration(seconds: 1));

    return items;
  }

  @override
  Future pushMessage(String email, String message, int time) async {
    await Future.delayed(Duration(microseconds: 10));
    // 서버랑 왔다리 갔다리 해서 name, profileurl을 얻음
    items.add(Chat(
        '임성수',
        'https://yt3.ggpht.com/ytc/AAUvwniqTHfAb4NIjTwa5_G1BQmABidGaQ5SZc3AzOQF=s900-c-k-c0x00ffffff-no-rj',
        message,
        time,
        email));
  }
}
