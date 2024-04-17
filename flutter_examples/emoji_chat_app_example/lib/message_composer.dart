import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  const MessageComposer({
    super.key,
    required this.controller,
    required this.onMessageSubmitted,
  });

  final TextEditingController controller;
  final ValueChanged<String> onMessageSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Flexible(
          child: TextField(
            controller: controller,
            decoration:
                const InputDecoration.collapsed(hintText: 'Send a message'),
            onSubmitted: onMessageSubmitted,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => onMessageSubmitted(controller.text),
        )
      ],
    );
  }
}
