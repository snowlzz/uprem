import 'package:flutter_test/flutter_test.dart';
import 'package:up/app/modules/profile/video_album/videoAlbum_store.dart';
 
void main() {
  late VideoAlbumStore store;

  setUpAll(() {
    store = VideoAlbumStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}