class ReceitaModel {
  String? titulo;
  String? descricao;
  String? imagemUrl;
  int? tempoPreparo;
  String? dificuldade;

  ReceitaModel({this.titulo, this.descricao, this.imagemUrl, this.tempoPreparo, this.dificuldade});

  ReceitaModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagemUrl = json['imagemUrl'];
    tempoPreparo = json['tempoPreparo'];
    dificuldade = json['dificuldade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['imagemUrl'] = imagemUrl;
    data['tempoPreparo'] = tempoPreparo;
    data['dificuldade'] = dificuldade;
    return data;
  }
}
