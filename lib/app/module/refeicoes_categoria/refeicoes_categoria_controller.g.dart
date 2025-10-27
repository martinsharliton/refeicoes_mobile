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

  late final _$_imagemSelecionadaAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._imagemSelecionada',
    context: context,
  );

  String? get imagemSelecionada {
    _$_imagemSelecionadaAtom.reportRead();
    return super._imagemSelecionada;
  }

  @override
  String? get _imagemSelecionada => imagemSelecionada;

  @override
  set _imagemSelecionada(String? value) {
    _$_imagemSelecionadaAtom.reportWrite(value, super._imagemSelecionada, () {
      super._imagemSelecionada = value;
    });
  }

  late final _$_difuculdadeAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._difuculdade',
    context: context,
  );

  String get difuculdade {
    _$_difuculdadeAtom.reportRead();
    return super._difuculdade;
  }

  @override
  String get _difuculdade => difuculdade;

  @override
  set _difuculdade(String value) {
    _$_difuculdadeAtom.reportWrite(value, super._difuculdade, () {
      super._difuculdade = value;
    });
  }

  late final _$_imagemErrorAtom = Atom(
    name: 'RefeicoesCategoriaControllerBase._imagemError',
    context: context,
  );

  bool get imagemError {
    _$_imagemErrorAtom.reportRead();
    return super._imagemError;
  }

  @override
  bool get _imagemError => imagemError;

  @override
  set _imagemError(bool value) {
    _$_imagemErrorAtom.reportWrite(value, super._imagemError, () {
      super._imagemError = value;
    });
  }

  late final _$criarNovaReceitaAsyncAction = AsyncAction(
    'RefeicoesCategoriaControllerBase.criarNovaReceita',
    context: context,
  );

  @override
  Future<void> criarNovaReceita({required ReceitaModel receita}) {
    return _$criarNovaReceitaAsyncAction.run(
      () => super.criarNovaReceita(receita: receita),
    );
  }

  late final _$carregarReceitasAsyncAction = AsyncAction(
    'RefeicoesCategoriaControllerBase.carregarReceitas',
    context: context,
  );

  @override
  Future<void> carregarReceitas() {
    return _$carregarReceitasAsyncAction.run(() => super.carregarReceitas());
  }

  late final _$RefeicoesCategoriaControllerBaseActionController =
      ActionController(
        name: 'RefeicoesCategoriaControllerBase',
        context: context,
      );

  @override
  void setImage(String? image) {
    final _$actionInfo = _$RefeicoesCategoriaControllerBaseActionController
        .startAction(name: 'RefeicoesCategoriaControllerBase.setImage');
    try {
      return super.setImage(image);
    } finally {
      _$RefeicoesCategoriaControllerBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setImageError(bool value) {
    final _$actionInfo = _$RefeicoesCategoriaControllerBaseActionController
        .startAction(name: 'RefeicoesCategoriaControllerBase.setImageError');
    try {
      return super.setImageError(value);
    } finally {
      _$RefeicoesCategoriaControllerBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
