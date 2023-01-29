// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../initial/auth/auth_store.dart';
import '../../models/kid_model.dart';
import '../../models/mom_model.dart';
import '../../services/via_cep_service.dart';
import 'photo_store.dart';

part 'edit_store.g.dart';

class EditStore = _EditStoreBase with _$EditStore;

abstract class _EditStoreBase with Store {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _db = FirebaseFirestore.instance;

  final PhotoStore store = Modular.get();

  @observable
  String? idLogado;

  @observable
  String? gender;

  @observable
  TextEditingController controllerKidName = TextEditingController();

  @observable
  TextEditingController controllerKidBirth = TextEditingController();

  @observable
  TextEditingController controllerCorrectedAge = TextEditingController();

  @action
  Future<void> saveDataToFirebase() async {
    User usuarioLogado = _auth.currentUser!;
    idLogado = usuarioLogado.uid;

    KidModel model = KidModel();
    model.name = controllerKidName.text;
    model.birth = controllerKidBirth.text;
    model.gestationalAge = controllerCorrectedAge.text;
    model.gender = gender;

    Map<String, dynamic> data = {
      "name": model.name,
      "birth": model.birth,
      "ges": model.gestationalAge,
      "gender": model.gender,
      "photo": store.photoURL,
      "photomom": store.momURL
    };

    _db
        .collection("users")
        .doc(idLogado)
        .collection("Kid")
        .doc(idLogado)
        .set(data, SetOptions(merge: true))
        .then((value) {
      Modular.to.pushReplacementNamed('/nav/');
    });
  }

  Future<void> recoverDataFromFirebase() async {
    User usuarioLogado = _auth.currentUser!;
    idLogado = usuarioLogado.uid;
    final AuthStore aStore = Modular.get();
    DocumentSnapshot snapshot =
        await _db.collection("users").doc(idLogado).get();
    Map? data = snapshot.data() as Map?;

    aStore.controllerName.text = data!["nome mae"];

    DocumentSnapshot snap = await _db
        .collection("users")
        .doc(idLogado)
        .collection("Kid")
        .doc(idLogado)
        .get();
    Map? dados = snap.data() as Map?;

    controllerKidName.text = dados!["name"];
    controllerKidBirth.text = dados['birth'];
    controllerCorrectedAge.text = dados["ges"];
    gender = dados['gender'];
    if (dados["photo"] != null) {
      store.photoURL = dados["photo"];
    }
  }

  @observable
  TextEditingController controllerCEP = TextEditingController();

  @observable
  TextEditingController controllerPhone = TextEditingController();

  @observable
  String? result;

  void searching(bool enable) {
    result = enable ? '' : result;
  }

  Future searchCep() async {
    searching(true);

    final resultCep = await ViaCepService.fetchCep(cep: controllerCEP.text);
    MomModel mom = MomModel();
    mom.city = resultCep.localidade;
    mom.street = resultCep.logradouro;
    mom.state = resultCep.uf;
    mom.neighborhood = resultCep.bairro;
    mom.ibge = resultCep.ibge;

    Map<String, dynamic> data = {
      "geo": {
        "city": resultCep.localidade,
        "address": resultCep.logradouro,
        "neighborhood": resultCep.bairro,
        "state": resultCep.uf,
        "ibge": resultCep.ibge,
      }
    };

    _db.collection("users").doc(idLogado).set(data, SetOptions(merge: true));
    result = resultCep.toJson();
  }
}
