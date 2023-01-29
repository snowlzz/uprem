import 'package:up/app/modules/home/home_page.dart';
import 'package:up/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'nav/nav_page.dart';
import 'nav/nav_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => NavBarStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
    ChildRoute('/nav', child: (_, args) => const NavBarPage()),
  ];
}
