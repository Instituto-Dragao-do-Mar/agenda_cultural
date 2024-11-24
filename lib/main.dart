import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
