import 'package:up/app/modules/profile/photo_album/photoAlbum_page.dart';
import 'package:up/app/modules/profile/photo_album/photoAlbum_store.dart';
import 'package:up/app/modules/profile/profile_page.dart';
import 'package:up/app/modules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up/app/modules/profile/video_album/videoAlbum_page.dart';
import 'package:up/app/modules/profile/video_album/videoAlbum_store.dart';

import 'edit/edit_page.dart';
import 'edit/edit_store.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
    Bind.lazySingleton((i) => EditStore()),
    Bind.lazySingleton((i) => PhotoAlbumStore()),
    Bind.lazySingleton((i) => VideoAlbumStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProfilePage()),
    ChildRoute('/edit', child: (_, args) => EditPage()),
    ChildRoute('/photo', child: (_, args) => PhotoAlbumPage()),
    ChildRoute('/video', child: (_, args) => VideoAlbumPage()),
  ];
}
