// ignore_for_file: file_names, library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
// import 'package:file_picker/file_picker.dart';

part 'photoAlbum_store.g.dart';

class PhotoAlbumStore = _PhotoAlbumStoreBase with _$PhotoAlbumStore;
abstract class _PhotoAlbumStoreBase with Store {

  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;


  @observable
  List<UploadTask> uploadedTasks = [];

  @observable
  List<File> selectedFiles = [];

  @observable
  String? idLogado;

  @action
  uploadFiles(File file) { 
    UploadTask task = storage
      .ref()
      .child("images/${DateTime.now().toString()}")
      .putFile(file);
    return task;
  }

  @action
  Future recoverPhotos() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = auth.currentUser;
    idLogado = usuarioLogado!.uid;

    QuerySnapshot<Map<String, dynamic>> snap = await db.collection("users").doc(idLogado).collection("images").get();
    Map dados = snap.docs as Map;
    selectedFiles = dados["images"];
  }

  @action
  Future selectFile() async {
    // ImagePicker picker = ImagePicker();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.any);

      if(result != null) {
        selectedFiles.clear();
        for (var selectedFile in result.files) {
          File file = File(selectedFile.path!);
          selectedFiles.add(file);
        }

        for (var file in selectedFiles) { 
          final UploadTask task = uploadFiles(file);
          saveImageUrlDB(task);
          uploadedTasks.add(task);
        }
      } else {
        if (kDebugMode) {
          print("Usuario cancelou");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
   

  @action
  saveImageUrlDB(UploadTask task) {
    task.snapshotEvents.listen((snapShot) {
      if(snapShot.state == TaskState.success) {
        snapShot
        .ref
        .getDownloadURL()
        .then((imageUrl) => writeImageToFireStore(imageUrl));
      }
    });
  }

  @action
  writeImageToFireStore(imageUrl) {
    FirebaseAuth auth = FirebaseAuth.instance;
    idLogado = auth.currentUser!.uid;
    db
    .collection("users")
    .doc(idLogado)
    .collection("images")
    .add({"url": imageUrl})
    .whenComplete(() => print("$imageUrl is save"));
  }

  


}