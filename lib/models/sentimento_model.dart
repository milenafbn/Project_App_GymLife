//atributos
class SentimentoModel {
  String id;
  String sentindo;
  String data;

//construtor básico
  SentimentoModel({
    required this.id,
    required this.sentindo,
    required this.data,
  });

//construtor nomeado para converter o map em um objeto
  SentimentoModel.fromMap(Map<String, dynamic> map):
    id = map["id"],
    sentindo = map["sentindo"],
    data = map["data"];

//construtor nomeado para converter o objeto em um map
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "sentindo": sentindo,
      "data": data,
    };
  }

}