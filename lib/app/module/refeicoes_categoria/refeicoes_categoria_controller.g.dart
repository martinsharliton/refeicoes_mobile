// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refeicoes_categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RefeicoesCategoriaController
    on RefeicoesCategoriaControllerBase, Store {
  late final _$_listReceitasAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._listReceitas',
    context: context,
  );

  ObservableList<ReceitaResponseDTO> get listReceitas {
    _$_listReceitasAtom.reportRead();
    return super._listReceitas;
  }

  @override
  ObservableList<ReceitaResponseDTO> get _listReceitas => listReceitas;

  @override
  set _listReceitas(ObservableList<ReceitaResponseDTO> value) {
    _$_listReceitasAtom.reportWrite(value, super._listReceitas, () {
      super._listReceitas = value;
    });
  }

  late final _$_statusAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._status',
    context: context,
  );

  PageStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PageStatus get _status => status;

  @override
  set _status(PageStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_successMessageAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._successMessage',
    context: context,
  );

  String? get successMessage {
    _$_successMessageAtom.reportRead();
    return super._successMessage;
  }

  @override
  String? get _successMessage => successMessage;

  @override
  set _successMessage(String? value) {
    _$_successMessageAtom.reportWrite(value, super._successMessage, () {
      super._successMessage = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._errorMessage',
    context: context,
  );

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
