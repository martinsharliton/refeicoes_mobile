class CategoriaModel {
  String? titulo;
  String? descricao;
  String? imagemUrl;

  CategoriaModel({this.titulo, this.descricao, this.imagemUrl});

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagemUrl = json['imagemUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['imagemUrl'] = imagemUrl;
    return data;
  }
}
