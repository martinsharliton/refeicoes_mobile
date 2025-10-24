class CategoriaResponseDTO {
  int? id;
  String? titulo;
  String? descricao;
  String? imagemUrl;

  CategoriaResponseDTO({this.id, this.titulo, this.descricao, this.imagemUrl});

  CategoriaResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagemUrl = json['imagemUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['imagemUrl'] = imagemUrl;
    return data;
  }
}
