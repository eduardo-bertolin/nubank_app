import 'package:flutter/material.dart';

class Usuario {
  String? _nome;
  late int _idade;

  Usuario({String? nome, required int idade}) {
    _nome = nome;
    _idade = idade;
  }

  String? get nome => _nome;
  set nome(String? value) {
    _nome = value;
  }

  int get idade => _idade;
  set idade(int value) {
    _idade = value;
  }
}
