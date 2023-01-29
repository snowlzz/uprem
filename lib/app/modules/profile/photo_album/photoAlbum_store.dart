import 'package:mobx/mobx.dart';

part 'photoAlbum_store.g.dart';

class PhotoAlbumStore = _PhotoAlbumStoreBase with _$PhotoAlbumStore;
abstract class _PhotoAlbumStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}