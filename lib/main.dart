import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_clean_arch_mobx/app/app_module.dart';
import 'package:poc_clean_arch_mobx/app/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(),
  child: AppWidget(),));
}



