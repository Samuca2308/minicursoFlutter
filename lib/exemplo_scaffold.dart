import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _Tela createState() => _Tela();
}

class _Tela extends State<Tela> {
    void _mostra(BuildContext _context) {
    showModalBottomSheet(
      elevation: 10,
      context: _context,
      builder: (ctx) => Container(
        width: 300,
        height: 250,
        color: Colors.white54,
        alignment: Alignment.center,
        child: const Text('Lorem Ipsum Dolor sit Amet'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('Barra de título'),
        actions: [Container(margin: const EdgeInsets.only(right: 16), child: const Icon(Icons.camera),)],
      ),
      drawer: const Drawer(
        child: Text('Lorem Ipsum Dolor sit Amet'),
      ),
      body: const Text('"Corpo" da aplicação'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.anchor, size: 36,),
        onPressed: () => _mostra(context),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.deepOrange,
          height: 62,
          child: const Text('Barra de navegação'),
        ),
      ),
    );
  }
}
