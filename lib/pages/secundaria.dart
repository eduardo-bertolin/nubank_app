import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank/models/carteira.dart';
import 'package:nubank/models/usuario.dart';

class Secundaria extends StatefulWidget {
  const Secundaria({super.key});

  @override
  State<Secundaria> createState() => _SecundariaState();
}

class _SecundariaState extends State<Secundaria> {
  Carteira _carteira = Carteira(1000.0, 500.0, 2000.0, 300.0);
  late Usuario _usuario = Usuario(nome: 'Laysa', idade: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: const Color(0xFF8A19D6),
        automaticallyImplyLeading: false,
        title: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.person_outline, color: Colors.white),
                    height: 42,
                    width: 42,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/iconevisualizacao.png'),
                        Image.asset('images/iconeajuda.png'),
                        Image.asset('images/iconeconvite.png'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Olá, ${_usuario.nome}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conta',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF060606),
                          fontSize: 16,
                          fontWeight: .w500,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'R\${_usuario.carteira.saldo}',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF060606),
                          fontSize: 16,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SingleChildScrollView(
                    scrollDirection: .vertical,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              Stack(
                                alignment: .center,
                                children: [
                                  Image.asset('assets/images/Ellipse.png'),
                                  Image.asset('assets/images/iconepix.png'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
