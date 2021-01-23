import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //query -> ao fechar a tela, passa a string digitada pelo usuaário para a proxima tela da pilha
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Implementação apenas para teste, o normal seriaa recupear as sugestões de uma API
    List<String> lista = List();
    if (query.isNotEmpty) {
      lista = [
        'Android',
        'Android navegação',
        'IOS',
        'Jogos',
        'vue',
        'laravel',
        'loops',
        'vue 3',
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text('Nenhum resultado para a pesquisa!'),
      );
    }
  }
}
