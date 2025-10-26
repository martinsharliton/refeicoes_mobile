class ReceitaModel {
  String? titulo;
  String? descricao;
  String? imagemUrl;
  int? tempoPreparo;
  String? dificuldade;
  List<String>? ingredientes;
  List<String>? passos;

  ReceitaModel({
    this.titulo,
    this.descricao,
    this.imagemUrl,
    this.tempoPreparo,
    this.dificuldade,
    this.ingredientes,
    this.passos,
  });

  ReceitaModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagemUrl = json['imagemUrl'];
    tempoPreparo = json['tempoPreparo'];
    dificuldade = json['dificuldade'];
    ingredientes = json['ingredientes'].cast<String>();
    passos = json['passos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['imagemUrl'] = imagemUrl;
    data['tempoPreparo'] = tempoPreparo;
    data['dificuldade'] = dificuldade;
    data['ingredientes'] = ingredientes;
    data['passos'] = passos;
    return data;
  }
}
