// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receitas_refeicoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceitasRefeicoesController on ReceitasRefeicoesControllerBase, Store {
  late final _$_listIngredientesAtom = Atom(
    name: 'ReceitasRefeicoesControllerBase._listIngredientes',
    context: context,
  );

  ObservableList<String> get listIngredientes {
    _$_listIngredientesAtom.reportRead();
    return super._listIngredientes;
  }

  @override
  ObservableList<String> get _listIngredientes => listIngredientes;

  @override
  set _listIngredientes(ObservableList<String> value) {
    _$_listIngredientesAtom.reportWrite(value, super._listIngredientes, () {
      super._listIngredientes = value;
    });
  }

  late final _$_listPassosAtom = Atom(
    name: 'ReceitasRefeicoesControllerBase._listPassos',
    context: context,
  );

  ObservableList<String> get listPassos {
    _$_listPassosAtom.reportRead();
    return super._listPassos;
  }

  @override
  ObservableList<String> get _listPassos => listPassos;

  @override
  set _listPassos(ObservableList<String> value) {
    _$_listPassosAtom.reportWrite(value, super._listPassos, () {
      super._listPassos = value;
    });
  }

  late final _$_statusAtom = Atom(
    name: 'ReceitasRefeicoesControllerBase._status',
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
    name: 'ReceitasRefeicoesControllerBase._successMessage',
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
    name: 'ReceitasRefeicoesControllerBase._errorMessage',
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
