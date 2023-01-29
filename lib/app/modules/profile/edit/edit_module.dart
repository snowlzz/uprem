import 'package:up/app/modules/profile/edit/edit_page.dart';
import 'package:up/app/modules/profile/edit/edit_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EditStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EditPage()),
  ];
}
