import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/controllers/youtube_search_controller.dart';

class YoutubeSearchPage extends StatefulWidget {
  @override
  YoutubeSearchPageState createState() => YoutubeSearchPageState();
}

class YoutubeSearchPageState
    extends ModularState<YoutubeSearchPage, YoutubeSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de Vídeos Youtube'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.busca.value,
          ),
          ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext, int) => ListTile(
              title: Text(controller.busca.value),
            ),
          ),
        ],
      ),
    );
  }
}
