import 'package:flutter/material.dart';
import 'package:web/model/Produto.dart';
import '../wsClient/ProdutoWSClient.dart';

class CadastrarProdutoPage extends StatefulWidget {
  CadastrarProdutoPage({super.key, required this.produto});
  Produto produto = Produto();
  @override
  State<CadastrarProdutoPage> createState() => _CadastrarProdutoPageState();
}

class _CadastrarProdutoPageState extends State<CadastrarProdutoPage> {
  TextEditingController tecNome = TextEditingController();
  TextEditingController tecDescricao = TextEditingController();
  TextEditingController tecPreco = TextEditingController();
  TextEditingController tecCategoria = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Formulário para cadastro de produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                controller: tecNome,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descriçao'),
                textInputAction: TextInputAction.next,
                controller: tecDescricao,
                maxLines: 1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                controller: tecPreco,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Categoria'),
                textInputAction: TextInputAction.next,
                controller: tecCategoria,
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(onPressed: salvarAction, child: Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }

  void salvarAction() async {
    widget.produto.nome = tecNome.text;
    widget.produto.preco = double.parse(tecPreco.text);
    widget.produto.descricao = tecDescricao.text;
    widget.produto.categoriaId = int.parse(tecCategoria.text);
    bool result = await ProdutoWSClient().cadastrar(widget.produto);
    if (result) {
      Navigator.of(context).pop(widget.produto);
    }
    print("Falha ao salvar o produto.");
  }
}
