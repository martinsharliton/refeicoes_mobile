class ReceitaResponseDTO {
  int? id;
  String? titulo;
  String? descricao;
  String? imagemUrl;
  int? tempoPreparo;
  String? dificuldade;
  List<String>? ingredientes;
  List<String>? passos;
  String? categoria;

  ReceitaResponseDTO({
    this.id,
    this.titulo,
    this.descricao,
    this.imagemUrl,
    this.tempoPreparo,
    this.dificuldade,
    this.ingredientes,
    this.passos,
    this.categoria,
  });

  ReceitaResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagemUrl = json['imagemUrl'];
    tempoPreparo = json['tempoPreparo'];
    dificuldade = json['dificuldade'];
    ingredientes = json['ingredientes'].cast<String>();
    passos = json['passos'].cast<String>();
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['imagemUrl'] = imagemUrl;
    data['tempoPreparo'] = tempoPreparo;
    data['dificuldade'] = dificuldade;
    data['ingredientes'] = ingredientes;
    data['passos'] = passos;
    data['categoria'] = categoria;
    return data;
  }
}
