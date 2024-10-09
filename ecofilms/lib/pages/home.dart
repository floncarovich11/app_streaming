import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo com o degradê
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Imagem de fundo
                      Positioned.fill(
                        child: Image.asset(
                          'assets/img/prisionbreak.png', // Exemplo de imagem
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Degradê sobre a imagem
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                              stops: [0.5, 1],
                            ),
                          ),
                        ),
                      ),
                      // Logo e textos no topo
                      Positioned(
                        top: 40, // Ajusta a posição do texto
                        left: 10,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Logo à esquerda
                            Row(
                              children: [
                                Image.asset(
                                  'assets/img/logo.png', // Caminho da sua logo
                                  width: 40, // Tamanho da logo
                                  height: 40,
                                ),
                                SizedBox(width: 20), // Espaço entre a logo e o texto
                                Text(
                                  'Séries',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Filmes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Minha lista',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 13,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end, // Alinha os itens na parte inferior
                          children: [
                            // Adiciona a logo antes da palavra "SÉRIE"
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/logo.png', // Caminho da sua logo
                                  width: 40, // Tamanho da logo
                                  height: 40,
                                ),
                                SizedBox(width: 5), // Espaço entre a logo e o texto
                                Text(
                                  'S É R I E',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 165), // Espaçamento entre o texto e o título
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Centraliza a linha
                              children: [
                                // Botão "Minha Lista" com ícone em cima
                                TextButton(
                                  onPressed: () {
                                    // Ação ao clicar no botão "Minha Lista"
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, color: Colors.white),
                                      SizedBox(height: 5), // Espaço entre o ícone e o texto
                                      Text(
                                        'Minha Lista',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                // Botão "Assistir" como estava antes
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Ação ao clicar no botão "Assistir"
                                  },
                                  icon: Icon(Icons.play_arrow),
                                  label: Text(
                                    'Assistir',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white, // Cor do botão
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5), // Borda levemente arredondada
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Botão "Detalhes" com ícone em cima
                                TextButton(
                                  onPressed: () {
                                    // Ação ao clicar no botão "Detalhes"
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.info_outline, color: Colors.white),
                                      SizedBox(height: 5), // Espaço entre o ícone e o texto
                                      Text(
                                        'Detalhes',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Parte inferior preta (diminuída)
                Container(
                  height: 150, // Diminui a altura da parte preta
                  color: Colors.black,
                  child: Column(
                    children: [
                      // Lista de prévias
                      Container(
                        height: 150,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PreviewCard('assets/img/gentegrande2.png'),
                            PreviewCard('assets/img/gigantesdeaço.png'),
                            PreviewCard('assets/img/jumanji.png'),
                            PreviewCard('assets/img/joker.jpg'),
                            PreviewCard('assets/img/rocky.jpg'),
                            PreviewCard('assets/img/titanic.jpg'),
                            PreviewCard('assets/img/jurassicpark.jpg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tipo fixo
        backgroundColor: Color(0XFF65DC65), // Cor de fundo da barra de navegação
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Cor do item selecionado
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Cor dos itens não selecionados
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Em Breve',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Baixados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Mais',
          ),
        ],
      ),
    );
  }
}

class PreviewCard extends StatelessWidget {
  final String imageUrl;

  PreviewCard(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
