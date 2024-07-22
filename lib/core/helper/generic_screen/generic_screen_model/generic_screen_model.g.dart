// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenericScreenModel on _GenericScreenModelBase, Store {
  late final _$dataAtom =
      Atom(name: '_GenericScreenModelBase.data', context: context);

  @override
  List<GenericModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<GenericModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GenericScreenModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isPrintingAtom =
      Atom(name: '_GenericScreenModelBase.isPrinting', context: context);

  @override
  bool get isPrinting {
    _$isPrintingAtom.reportRead();
    return super.isPrinting;
  }

  @override
  set isPrinting(bool value) {
    _$isPrintingAtom.reportWrite(value, super.isPrinting, () {
      super.isPrinting = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_GenericScreenModelBase.initialize', context: context);

  @override
  Future<void> initialize(String tableName) {
    return _$initializeAsyncAction.run(() => super.initialize(tableName));
  }

  late final _$getDataAsyncAction =
      AsyncAction('_GenericScreenModelBase.getData', context: context);

  @override
  Future<void> getData(String tableName) {
    return _$getDataAsyncAction.run(() => super.getData(tableName));
  }

  @override
  String toString() {
    return '''
data: ${data},
isLoading: ${isLoading},
isPrinting: ${isPrinting}
    ''';
  }
}
