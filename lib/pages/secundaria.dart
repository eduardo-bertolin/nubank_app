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
  late final Carteira _carteira = Carteira(1000.0, 500.0, 2000.0, 300.0);
  late final Usuario _usuario = Usuario(nome: 'Laysa', idade: 30, carteira: _carteira);
  bool _mostrarSaldo = true;


  String _formatarMoeda(double valor) {
    if (!_mostrarSaldo) return '••••';
    
    String valorStr = valor.toStringAsFixed(2);
    List<String> partes = valorStr.split('.');
    String inteiro = partes[0];
    String decimal = partes[1];
    

    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    inteiro = inteiro.replaceAllMapped(reg, (Match match) => '${match[1]}.');
    
    return 'R\$ $inteiro,$decimal';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color(0xFF830AD1),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(38),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person_outline, color: Colors.white, size: 24);
                        },
                      ),
                    ),
                  ),
                  

                  Row(
                    children: [

                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          _mostrarSaldo ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            _mostrarSaldo = !_mostrarSaldo;
                          });
                        },
                      ),
                      const SizedBox(width: 18),
                      Image.asset(
                        'assets/images/iconeajuda.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                        errorBuilder: (c, e, s) => const Icon(Icons.help_outline, color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 18),
                      Image.asset(
                        'assets/images/iconeconvite.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                        errorBuilder: (c, e, s) => const Icon(Icons.person_add_alt_1_outlined, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Olá, ${_usuario.nome}',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Conta',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF191919),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color(0xFF7A7A7A),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _formatarMoeda(_usuario.carteira?.saldo ?? 0.0),
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF191919),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildActionItem('Área Pix', 'assets/images/iconepix.png'),
                    _buildActionItem('Pagar', 'assets/images/pagar.png'),
                    _buildActionItem('Transferir', 'assets/images/transfere.png'),
                    _buildActionItem('Depositar', 'assets/images/deposita.png'),
                    _buildActionItem('Pegar\nemprestado', 'assets/images/emprestado.png'),
                  ],
                ),
              ),
              const SizedBox(height: 8),


              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F1F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.credit_card_outlined,
                        color: Color(0xFF191919),
                        size: 22,
                      ),
                      const SizedBox(width: 14),
                      Text(
                        'Meus cartões',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF191919),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              



              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Empréstimo',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF191919),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color(0xFF7A7A7A),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Valor disponível de até',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF7A7A7A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _mostrarSaldo ? 'R\$ 25.000,00' : '••••',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF191919),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildActionItem(String titulo, String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F1F5),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                assetPath,
                width: 26,
                height: 26,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.star_border, color: Color(0xFF830AD1), size: 24);
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF191919),
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String prefixo, String destaque, String sufixo) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16.0, bottom: 4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F1F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.inter(
            fontSize: 13,
            color: const Color(0xFF191919),
            height: 1.4,
          ),
          children: [
            TextSpan(text: prefixo),
            TextSpan(
              text: destaque,
              style: const TextStyle(
                color: Color(0xFF830AD1),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(text: sufixo),
          ],
        ),
      ),
    );
  }
}
