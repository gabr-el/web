import 'package:flutter/material.dart';
import 'package:web/page/ListaProdutoPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: cadastrarAction,
              child: const Text('Cadastrar'),
            ),
            OutlinedButton(
              onPressed: listarAction,
              child: const Text('Listar'),
            ),
            OutlinedButton(
              onPressed: atualizarAction,
              child: const Text('Atualizar'),
            ),
            OutlinedButton(
              onPressed: deletarAction,
              child: const Text('Deletar'),
            ),
          ],
        ),
      ),
    );
  }

  void listarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaProdutoPage()),
    );
  }

  void cadastrarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaProdutoPage()),
    );
  }

  void deletarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaProdutoPage()),
    );
  }

  void atualizarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaProdutoPage()),
    );
  }
}
