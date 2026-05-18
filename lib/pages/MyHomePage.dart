import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void trocarTela() {
    Navigator.pushNamed(context, '/secundaria');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF830AD1), // Nubank Purple oficial
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Linha do topo com botão discreto de ajuda
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.help_outline, color: Colors.white, size: 26),
                  onPressed: () {
                    // Feedback de ajuda
                  },
                ),
              ),

              // Logo da Nubank Centralizado
              Center(
                child: Hero(
                  tag: 'nubank-logo',
                  child: Image.asset(
                    'assets/images/nubank.png',
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Seção inferior com o botão de ação e textos
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Botão de login principal (Pílula branca premium)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF830AD1),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: trocarTela,
                    child: Text(
                      'Usar senha do celular',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Link discreto para outra conta
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Entrar com outra conta',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        color: Colors.white.withAlpha(230),
                        ),
                      ),
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
