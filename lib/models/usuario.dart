import 'package:nubank/models/carteira.dart';

class Usuario {
  String? _nome;
  late int _idade;
  Carteira? _carteira;

  Usuario({String? nome, required int idade, Carteira? carteira}) {
    _nome = nome;
    _idade = idade;
    _carteira = carteira;
  }

  String? get nome => _nome;
  set nome(String? value) {
    _nome = value;
  }

  int get idade => _idade;
  set idade(int value) {
    _idade = value;
  }

  Carteira? get carteira => _carteira;
  set carteira(Carteira? value) {
    _carteira = value;
  }
}
