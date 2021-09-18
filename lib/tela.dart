import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minicurso_flutter/pokemon.dart';

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _Tela createState() => _Tela();
}

List<Pokemon> estoque = [];

class _Tela extends State<Tela> {
  final GlobalKey<FormState> _pokeKey = GlobalKey();
  final registro = TextEditingController(), nome = TextEditingController(), nivel = TextEditingController(), tipo = TextEditingController();


  void _mostraModal(BuildContext _context) {
    showModalBottomSheet(
      elevation: 10,
      context: _context,
      builder: (ctx) => Container(
        width: 300,
        height: 600,
        color: Colors.white54,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14),
                child: const Text('Adicionar pokémon'),
              ),
              Form(
                key: _pokeKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nome,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor inserir um nome';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                      TextFormField(
                        controller: tipo,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor inserir um tipo';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Tipo',
                        ),
                      ),
                      TextFormField(
                        controller: nivel,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor inserir um nível';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nível'
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 21),
                        child: ElevatedButton(
                          onPressed: () {
                            if(_pokeKey.currentState!.validate()) {
                              setState(() {
                                estoque.add(Pokemon(int.parse(nivel.text), nome.text, tipo.text));
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: Container(width: 148, margin: const EdgeInsets.symmetric(vertical:14), child: const Text('Salvar', style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),),
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
      )
    );
  }
  
  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  getPokemons() async {
    String data = await rootBundle.loadString('assets/pokemon.json');
    final pokemonsJson = jsonDecode(data);
    List _tempLista = List.castFrom(pokemonsJson);
    for (Map<dynamic, dynamic> y in _tempLista) {
      setState(() {
        estoque.add(Pokemon.fromJson(y));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        title: const Align(
          alignment: Alignment.center,
          child: Text("Coleção de Pokémons"),
        )
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: lista(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: const <Widget>[
            Icon(Icons.add),
            Text(" Cadastrar")
          ],
        ),
        onPressed: () => _mostraModal(context),
      ),
    );
  }
}

Widget lista() {
  /*
  return ListView(
    children: const <ListTile>[
      ListTile(
        leading: Icon(Icons.catching_pokemon, size: 36,),
        title: Text("612 - Haxorus"),
        subtitle: Text("HP: 140 ATK: 143 DEF: 98 SP.ATK: 62 SP.DEF: 70 SPD: 106", style: TextStyle(fontSize: 12),),
      ),
    ],
  ); */

  return ListView.separated(
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.catching_pokemon, size: 36,),
        title: Text("${estoque[index].nome} - LV.${estoque[index].nivel}"),
        subtitle: Text(estoque[index].tipo),
      );
    },
    itemCount: estoque.length,
    separatorBuilder: (contaxt, index) {
      return const Divider();
    },
  );
}