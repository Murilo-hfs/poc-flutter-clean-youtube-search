import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/ui/pages/youtube_search_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => YoutubeSearchPage())
  ];
}
