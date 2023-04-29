class Produto {
  int? _id;
  String? _nome;
  String? _descricao;
  double? _preco;
  int? _categoriaId;

  Produto(
      {int? id,
        String? nome,
        String? descricao,
        double? preco,
        int? categoriaId}) {
    if (id != null) {
      this._id = id;
    }
    if (nome != null) {
      this._nome = nome;
    }
    if (descricao != null) {
      this._descricao = descricao;
    }
    if (preco != null) {
      this._preco = preco;
    }
    if (categoriaId != null) {
      this._categoriaId = categoriaId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nome => _nome;
  set nome(String? nome) => _nome = nome;
  String? get descricao => _descricao;
  set descricao(String? descricao) => _descricao = descricao;
  double? get preco => _preco;
  set preco(double? preco) => _preco = preco;
  int? get categoriaId => _categoriaId;
  set categoriaId(int? categoriaId) => _categoriaId = categoriaId;

  Produto.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _descricao = json['descricao'];
    _preco = json['valor'];
    _categoriaId = json['categoria_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nome'] = this._nome;
    data['descricao'] = this._descricao;
    data['preco'] = this._preco;
    data['categoria_id'] = this._categoriaId;
    return data;
  }
}
