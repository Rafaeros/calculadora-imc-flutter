import 'package:test/test.dart'; // Importando a biblioteca de testes
import 'package:calculadora_imc/main.dart';

void main() {
  group('Testes de cálculo de IMC e classificação', () {
    test('Calculando IMC corretamente', () {
      // IMC para peso = 70kg, altura = 1.75m
      double imc = calcularIMC(70, 1.75);
      expect(
          imc,
          closeTo(22.86,
              0.01)); // Espera-se que o IMC seja 22.86 (com tolerância de 0.01)
    });

    test('Classificação IMC para Magreza Grave', () {
      double imc = calcularIMC(40, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Magreza Grave'));
    });

    test('Classificação IMC para Magreza Moderada', () {
      double imc = calcularIMC(50, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Magreza Moderada'));
    });

    test('Classificação IMC para Magreza Leve', () {
      double imc = calcularIMC(55, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Magreza Leve'));
    });

    test('Classificação IMC para Saudável', () {
      double imc = calcularIMC(70, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Saudável'));
    });

    test('Classificação IMC para Sobrepeso', () {
      double imc = calcularIMC(85, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Sobrepeso'));
    });

    test('Classificação IMC para Obesidade Grau I', () {
      double imc = calcularIMC(100, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Obesidade Grau I'));
    });

    test('Classificação IMC para Obesidade Grau II (Severa)', () {
      double imc = calcularIMC(120, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Obesidade Grau II (Severa)'));
    });

    test('Classificação IMC para Obesidade Grau III (Mórbida)', () {
      double imc = calcularIMC(150, 1.75);
      String classificacao = calcularCategoriaIMC(imc);
      expect(classificacao, equals('Obesidade Grau III (Mórbida)'));
    });

    test('Lançando erro para altura inválida', () {
      expect(() => calcularIMC(70, 0),
          throwsArgumentError);
    });
  });
}
