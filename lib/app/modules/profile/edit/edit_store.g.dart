// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditStore on _EditStoreBase, Store {
  late final _$idLogadoAtom =
      Atom(name: '_EditStoreBase.idLogado', context: context);

  @override
  String? get idLogado {
    _$idLogadoAtom.reportRead();
    return super.idLogado;
  }

  @override
  set idLogado(String? value) {
    _$idLogadoAtom.reportWrite(value, super.idLogado, () {
      super.idLogado = value;
    });
  }

  late final _$genderAtom =
      Atom(name: '_EditStoreBase.gender', context: context);

  @override
  String? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$controllerKidNameAtom =
      Atom(name: '_EditStoreBase.controllerKidName', context: context);

  @override
  TextEditingController get controllerKidName {
    _$controllerKidNameAtom.reportRead();
    return super.controllerKidName;
  }

  @override
  set controllerKidName(TextEditingController value) {
    _$controllerKidNameAtom.reportWrite(value, super.controllerKidName, () {
      super.controllerKidName = value;
    });
  }

  late final _$controllerKidBirthAtom =
      Atom(name: '_EditStoreBase.controllerKidBirth', context: context);

  @override
  TextEditingController get controllerKidBirth {
    _$controllerKidBirthAtom.reportRead();
    return super.controllerKidBirth;
  }

  @override
  set controllerKidBirth(TextEditingController value) {
    _$controllerKidBirthAtom.reportWrite(value, super.controllerKidBirth, () {
      super.controllerKidBirth = value;
    });
  }

  late final _$controllerCorrectedAgeAtom =
      Atom(name: '_EditStoreBase.controllerCorrectedAge', context: context);

  @override
  TextEditingController get controllerCorrectedAge {
    _$controllerCorrectedAgeAtom.reportRead();
    return super.controllerCorrectedAge;
  }

  @override
  set controllerCorrectedAge(TextEditingController value) {
    _$controllerCorrectedAgeAtom
        .reportWrite(value, super.controllerCorrectedAge, () {
      super.controllerCorrectedAge = value;
    });
  }

  late final _$saveDataToFirebaseAsyncAction =
      AsyncAction('_EditStoreBase.saveDataToFirebase', context: context);

  @override
  Future<void> saveDataToFirebase() {
    return _$saveDataToFirebaseAsyncAction
        .run(() => super.saveDataToFirebase());
  }

  @override
  String toString() {
    return '''
idLogado: ${idLogado},
gender: ${gender},
controllerKidName: ${controllerKidName},
controllerKidBirth: ${controllerKidBirth},
controllerCorrectedAge: ${controllerCorrectedAge}
    ''';
  }
}
