import 'package:flutter/material.dart';
import 'package:web/page/DeletarProdutoPage.dart';
import 'package:web/page/ListaProdutoPage.dart';
import 'package:web/page/EditarProdutoPage.dart';
import '../model/Produto.dart';
import 'CadastrarProdutoPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Produto produto = Produto();

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
              style: OutlinedButton.styleFrom(minimumSize: const Size(300, 50)),
              onPressed: cadastrarAction,
              child: const Text('Novo produto'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            OutlinedButton(
              style: OutlinedButton.styleFrom(minimumSize: const Size(300, 50)),
              onPressed: listarAction,
              child: const Text('Listar produtos'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            OutlinedButton(
              style: OutlinedButton.styleFrom(minimumSize: const Size(300, 50)),
              onPressed: editarAction,
              child: const Text('Editar produtos'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            OutlinedButton(
              style: OutlinedButton.styleFrom(minimumSize: const Size(300, 50)),
              onPressed: deletarAction,
              child: const Text('Deletar produtos'),
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
      MaterialPageRoute(builder: (context) => CadastrarProdutoPage(produto: produto,)),
    );
  }

  void deletarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DeletarProdutoPage(produto: produto,)),
    );
  }

  void editarAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditarProdutoPage()),
    );
  }
}
