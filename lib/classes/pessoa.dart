class Pessoa {
  final String _nome;
  final double _peso;
  final double _altura;
  double? _imc;
  String? _classificacaoIMC;

  Pessoa(this._nome, this._peso, this._altura);

  void setImc(double imc, String classificacaoIMC) {
    _imc = imc;
    _classificacaoIMC = classificacaoIMC;
  }

  @override
  String toString() {
    return {'Nome: $_nome, Peso: $_peso, Altura: $_altura, IMC: $_imc, Categoria: $_classificacaoIMC'}
        .toString();
  }
}
