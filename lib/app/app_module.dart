import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/home/nav/nav_module.dart';
import 'modules/home/nav/nav_store.dart';
import 'modules/initial/auth/auth_module.dart';
import 'modules/initial/auth/auth_store.dart';
import 'modules/initial/initial_module.dart';
import 'modules/initial/initial_store.dart';
import 'modules/profile/edit/edit_module.dart';
import 'modules/profile/edit/edit_store.dart';
import 'modules/profile/edit/photo_store.dart';
import 'modules/profile/photo_album/photoAlbum_module.dart';
import 'modules/profile/photo_album/photoAlbum_store.dart';
import 'modules/profile/profile_module.dart';
import 'modules/profile/profile_store.dart';
import 'modules/profile/video_album/videoAlbum_module.dart';
import 'modules/profile/video_album/videoAlbum_store.dart';
import 'modules/tasks/conteudo/conteudo_module.dart';
import 'modules/tasks/conteudo/conteudo_store.dart';
import 'modules/tasks/tasks_module.dart';
import 'modules/tasks/tasks_store.dart';



class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InitialStore()),
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => NavBarStore()),
    Bind.lazySingleton((i) => ProfileStore()),
    Bind.lazySingleton((i) => EditStore()),
    Bind.lazySingleton((i) => PhotoAlbumStore()),
    Bind.lazySingleton((i) => VideoAlbumStore()),
    Bind.lazySingleton((i) => TasksStore()),
    Bind.lazySingleton((i) => ConteudoStore()),
    Bind.lazySingleton((i) => PhotoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: InitialModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/nav', module: NavModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/edit', module: EditModule()),
    ModuleRoute('/photo', module: PhotoAlbumModule()),
    ModuleRoute('/video', module: VideoAlbumModule()),
    ModuleRoute('/tasks', module: TasksModule()),
    ModuleRoute('/conteudo', module: ConteudoModule()),
  ];

}