import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule())
  ];
}
