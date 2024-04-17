import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_overview_app_example/emoji_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final groups = Emojis.groups;

    return DefaultTabController(
      length: groups.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
              isScrollable: true,
              tabs: groups.map((g) => Tab(text: g.value)).toList()),
        ),
        body: Expanded(
            child: TabBarView(
          children: groups.map((g) => EmojiList(emojis: Emojis.byGroup(g))).toList(),
        )),
      ),
    );
  }
}
