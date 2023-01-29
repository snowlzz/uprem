import 'package:up/app/modules/tasks/tasks_page.dart';
import 'package:up/app/modules/tasks/tasks_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'conteudo/conteudo_page.dart';
import 'conteudo/conteudo_store.dart';

class TasksModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TasksStore()),
    Bind.lazySingleton((i) => ConteudoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TasksPage()),
    ChildRoute('/conteudo', child: (_, args) => ConteudoPage()),
  ];
}
