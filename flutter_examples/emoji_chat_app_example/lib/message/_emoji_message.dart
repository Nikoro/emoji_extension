part of 'message.dart';

class _EmojiMessage extends StatelessWidget {
  const _EmojiMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: switch (text.emojis.count) {
            (int count) when count <= 3 => 60,
            (int count) when count <= 5 => 30,
            _ => 16,
          },
        ),
      ),
    );
  }
}
