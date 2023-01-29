// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

// import '../models/task_model.dart';

part 'tasks_store.g.dart';

enum SingingCharacter{sim, nao, parcial}

class TasksStore = _TasksStoreBase with _$TasksStore;
abstract class _TasksStoreBase with Store {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @observable
  String? escolhaUser;

  @observable
  String? uid;

  @observable
  String group = "";

  @observable
  String? task;

  @observable
  String? status;

  @observable
  String? answer;

  @observable
  SingingCharacter? character;

  @observable
  String? escolhaU;

  // @observable
  // StreamController<List<Task>> taskController = StreamController<List<Task>>.broadcast();
  
  // // @action
  // Stream<List<Task>> get outTask => taskController.stream.asBroadcastStream();

  @action
  Future<void> uploadTaskToFirebase(String? uid, String? task, String? answer) async {
    uid = auth.currentUser!.uid;
    await db.collection("users").doc(uid).collection("Tasks").doc(task).set({
      "Date" : Timestamp.now(),
      "Answer" : answer
    });

  }

  @action
  getTasksFromFirebase(String uid, String group) async {
    User? usuarioLogado = auth.currentUser!;
    uid = usuarioLogado.uid;

    DocumentSnapshot snap = await db.collection("users").doc(uid).collection("Tasks").doc(task).get();
    // List<Task> listTask = [];
    Map? dados = snap.data() as Map?;
    // uid = dados!["uid"];
    
      answer = dados!["Answer"];
      // group = dados["group"];
    
    
    // return getTasksFromFirebase(uid, group);
  }
  



}