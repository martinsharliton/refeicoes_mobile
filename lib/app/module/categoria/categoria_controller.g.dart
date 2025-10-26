// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriaController on CategoriaControllerBase, Store {
  late final _$_listCategoriasAtom = Atom(
    name: 'CategoriaControllerBase._listCategorias',
    context: context,
  );

  ObservableList<CategoriaResponseDTO> get listCategorias {
    _$_listCategoriasAtom.reportRead();
    return super._listCategorias;
  }

  @override
  ObservableList<CategoriaResponseDTO> get _listCategorias => listCategorias;

  @override
  set _listCategorias(ObservableList<CategoriaResponseDTO> value) {
    _$_listCategoriasAtom.reportWrite(value, super._listCategorias, () {
      super._listCategorias = value;
    });
  }

  late final _$_statusAtom = Atom(
    name: 'CategoriaControllerBase._status',
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
    name: 'CategoriaControllerBase._successMessage',
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
    name: 'CategoriaControllerBase._errorMessage',
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
    name: 'CategoriaControllerBase._imagemSelecionada',
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

  late final _$_imagemErrorAtom = Atom(
    name: 'CategoriaControllerBase._imagemError',
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

  late final _$loadingListCategoriasAsyncAction = AsyncAction(
    'CategoriaControllerBase.loadingListCategorias',
    context: context,
  );

  @override
  Future<void> loadingListCategorias() {
    return _$loadingListCategoriasAsyncAction.run(
      () => super.loadingListCategorias(),
    );
  }

  late final _$criarNovaCategoriaAsyncAction = AsyncAction(
    'CategoriaControllerBase.criarNovaCategoria',
    context: context,
  );

  @override
  Future<void> criarNovaCategoria({required CategoriaModel categoria}) {
    return _$criarNovaCategoriaAsyncAction.run(
      () => super.criarNovaCategoria(categoria: categoria),
    );
  }

  late final _$removerCategoriaPorIdAsyncAction = AsyncAction(
    'CategoriaControllerBase.removerCategoriaPorId',
    context: context,
  );

  @override
  Future<void> removerCategoriaPorId({
    required CategoriaResponseDTO categoria,
  }) {
    return _$removerCategoriaPorIdAsyncAction.run(
      () => super.removerCategoriaPorId(categoria: categoria),
    );
  }

  late final _$CategoriaControllerBaseActionController = ActionController(
    name: 'CategoriaControllerBase',
    context: context,
  );

  @override
  void setImage(String? image) {
    final _$actionInfo = _$CategoriaControllerBaseActionController.startAction(
      name: 'CategoriaControllerBase.setImage',
    );
    try {
      return super.setImage(image);
    } finally {
      _$CategoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageError(bool value) {
    final _$actionInfo = _$CategoriaControllerBaseActionController.startAction(
      name: 'CategoriaControllerBase.setImageError',
    );
    try {
      return super.setImageError(value);
    } finally {
      _$CategoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
