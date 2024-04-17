import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextRow extends StatelessWidget {
  const TextRow(this.value, {super.key, required this.title});

  final String title;
  final Object? value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth / 2,
              child: Text(
                '$title:',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(child: Text('$value'))
          ],
        );
      }
    );
  }
}
