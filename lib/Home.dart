import 'package:app_youtube/CustomSearchDelegate.dart';
import 'package:app_youtube/telas/Biblioteca.dart';
import 'package:app_youtube/telas/EmAlta.dart';
import 'package:app_youtube/telas/Inicio.dart';
import 'package:app_youtube/telas/Inscricoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(this._resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String queryConsula = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = queryConsula;
                });
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            this._indiceAtual = indice;
          });
        },
        //type: BottomNavigationBarType.shifting, -> toda bottom barra fica na cor do elemeno selecionado
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Colors.orange, >> usado para shifting
              title: Text('Início'),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.red, >> usado para shifting
              title: Text('Em alta'),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.blue, >> usado para shifting
              title: Text('Inscrições'),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //  backgroundColor: Colors.green, >> usado para shifting
              title: Text('Biblioteca'),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
