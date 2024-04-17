import 'package:emoji_chat_app_example/message/message.dart';
import 'package:emoji_chat_app_example/message_composer.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messages = [];
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => setState(() => _messages.clear())),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, index) => Align(
                      alignment: Alignment.centerRight,
                      child: Message(text: _messages[index])),
                ),
              ),
              const Divider(height: 1.0),
              MessageComposer(
                controller: _controller,
                onMessageSubmitted: (message) {
                  _controller.clear();
                  setState(() => _messages.insert(0, message));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
