import 'package:flutter_test/flutter_test.dart';
import 'package:up/app/modules/profile/photo_album/photoAlbum_store.dart';
 
void main() {
  late PhotoAlbumStore store;

  setUpAll(() {
    store = PhotoAlbumStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}