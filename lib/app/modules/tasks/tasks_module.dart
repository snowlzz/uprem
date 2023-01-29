import 'package:up/app/modules/tasks/tasks_page.dart';
import 'package:up/app/modules/tasks/tasks_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TasksModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TasksStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TasksPage()),
  ];
}
