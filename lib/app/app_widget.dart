import 'package:flutter/material.dart';

import 'modules/youtube_search.dart/presenter/ui/pages/youtube_search_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POC',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      home: YoutubeSearchPage()
    );
  }
}
