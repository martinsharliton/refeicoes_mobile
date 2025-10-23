enum Dificuldade { facil, medio, dificil }

class Receita {
  final String id;
  final String titulo;
  final String descricao;
  final String imagemUrl;
  final int tempoPreparo;
  final Dificuldade dificuldade;
  final List<String> ingredientes;
  final List<String> passos;

  const Receita({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagemUrl,
    required this.tempoPreparo,
    required this.dificuldade,
    required this.ingredientes,
    required this.passos,
  });
}
