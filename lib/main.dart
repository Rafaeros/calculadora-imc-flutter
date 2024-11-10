import 'dart:convert';
import "classes/pessoa.dart";
import 'dart:io';

void main() {
  double imc;
  String classificacaoIMC;
  print("Calculadora de IMC");
  print("Digite seu nome:");
  String? nome = stdin.readLineSync(encoding: utf8);

  print("Digite seu peso:");
  String? peso = stdin.readLineSync(encoding: utf8);

  print("Digite sua altura:");
  String? altura = stdin.readLineSync(encoding: utf8);

  if (nome == null || peso == null || altura == null || nome.isEmpty || peso.isEmpty || altura.isEmpty) {
    throw Exception("Dados inválidos");
  }

  Pessoa pessoa = Pessoa(nome.toUpperCase(), double.parse(peso), double.parse(altura));
  imc = calcularIMC(double.parse(peso), double.parse(altura));

  if (imc == 0) {
    throw Exception("Peso e altura devem ser maiores que 0");
  }

  classificacaoIMC = calcularCategoriaIMC(imc);
  pessoa.setImc(imc, classificacaoIMC);
  print(pessoa.toString());
}

double calcularIMC(double peso, double altura) {
  if (altura <= 0) throw ArgumentError("Altura não pode ser zero ou negativa");
  return peso / (altura * altura);
}

String calcularCategoriaIMC(double imc) {
  if (imc < 16) {
    return "Magreza Grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magreza Moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magreza Leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade Grau I";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade Grau II (Severa)";
  } else {
    return "Obesidade Grau III (Mórbida)";
  }
}
