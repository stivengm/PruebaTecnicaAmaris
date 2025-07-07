class CategoriaModel {
  String id;
  String nome;
  String descripcion;

  CategoriaModel({
    required this.id,
    required this.nome,
    required this.descripcion,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      descripcion: json['descripcion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descripcion': descripcion,
    };
  }
}