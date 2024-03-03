class ExercicioModel{
  String id;
  String nome;
  String treino;
  String comoFazer;

  String? urlImagem;

  //construtor padrao para inicializar as variaveis
  ExercicioModel({
    required this.id,
    required this.nome,
    required this.treino,
    required this.comoFazer,
    this.urlImagem
  });

  //construtor nomeado Creates an instance of [ExercicioModel] from a map.
  /// This constructor takes a [Map] as input and initializes the [id], [nome], [treino], [comoFazer], and [urlImagem] properties
  /// based on the corresponding values in the map.
//pega informação do bd
  ExercicioModel.fromMap(Map<String, dynamic> map):
    id = map["id"],
    nome = map['nome'],
    treino = map['treino'],
    comoFazer = map['comoFazer'],
    urlImagem = map['urlImagem'];

//enviar informação pro banco de dados
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "nome": nome,
      "treino": treino,
      "comoFazer": comoFazer,
      "urlImagem": urlImagem
    };
  }

}