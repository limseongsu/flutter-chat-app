import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/fake_repository.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:chat_app/ui/chat/my_chat_item.dart';
import 'package:chat_app/ui/chat/other_chat_item.dart';
import 'package:chat_app/viewmodel/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final myEmail = 'bbb@aaa.com';
  TextEditingController _controller = TextEditingController();
  final _scrollController = ScrollController();

  void initState() {
    super.initState();
    context.read<ChatViewModel>().fetch();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: viewModel.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: viewModel.chatList.length,
                      itemBuilder: (context, index) {
                        Chat chat = viewModel.chatList[index];
                        if (myEmail == chat.email) {
                          return MyChatItem(chat: chat);
                        } else {
                          return OtherChatItem(chat: chat);
                        }
                      },
                    ),
            ),
            Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: 'Message를 입력하세요'),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    Flexible(child: Container()),
                    TextButton(
                        onPressed: () {
                          viewModel.pushMessage(
                            myEmail,
                            _controller.text,
                          );
                          // 입력 창 초기화
                          _controller.clear();
                          // 메세지 입력 후 맨 밑으로 스크롤
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text('Send'),
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
