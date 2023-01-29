// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavBarStore on _NavBarStoreBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_NavBarStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_NavBarStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_NavBarStoreBaseActionController =
      ActionController(name: '_NavBarStoreBase', context: context);

  @override
  void changePage(int index) {
    final _$actionInfo = _$_NavBarStoreBaseActionController.startAction(
        name: '_NavBarStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_NavBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
index: ${index}
    ''';
  }
}
