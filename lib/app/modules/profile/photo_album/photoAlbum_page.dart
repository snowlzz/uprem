import 'package:flutter_modular/flutter_modular.dart';
import 'package:up/app/modules/profile/photo_album/photoAlbum_store.dart';
import 'package:flutter/material.dart';

class PhotoAlbumPage extends StatefulWidget {
  final String title;
  const PhotoAlbumPage({Key? key, this.title = 'PhotoAlbumPage'}) : super(key: key);
  @override
  PhotoAlbumPageState createState() => PhotoAlbumPageState();
}
class PhotoAlbumPageState extends State<PhotoAlbumPage> {
  final PhotoAlbumStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}