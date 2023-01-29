import 'package:flutter_modular/flutter_modular.dart';

import '../../profile/profile_page.dart';
import '../../profile/profile_store.dart';
import 'nav_page.dart';
import 'nav_store.dart';

class NavModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NavBarStore()),
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NavBarPage()),
    ChildRoute('/profile', child: (_, args) => const ProfilePage()),
  ];

}