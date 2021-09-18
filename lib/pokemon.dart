class Pokemon {
  int nivel = 0;
  String nome = "", tipo = "";

  Pokemon(this.nivel, this.nome, this.tipo);

  Pokemon.fromJson(Map json) {
    nivel = json['nivel'];
    nome = json['nome'];
    tipo = json['tipo'];
  }
}
