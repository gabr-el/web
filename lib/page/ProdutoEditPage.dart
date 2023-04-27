import 'package:web/model/Produto.dart';
import 'package:web/wsClient/ProdutoWSClient.dart';
import 'package:flutter/material.dart';

class ProdutoEditPage extends StatefulWidget {
  ProdutoEditPage({required this.produto});
  Produto produto;
  @override
  State<ProdutoEditPage> createState() => _ProdutoEditPageState();
}

class _ProdutoEditPageState extends State<ProdutoEditPage> {
  TextEditingController tecNome = TextEditingController();
  TextEditingController tecDescricao = TextEditingController();
  TextEditingController tecPreco = TextEditingController();
  TextEditingController tecCategoria = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tecNome.text = widget.produto.nome!;
    tecDescricao.text = widget.produto.descricao!;
    tecPreco.text = widget.produto.preco.toString();
    tecCategoria.text = widget.produto.categoriaId.toString();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Editar produto")),
      body: Column(
        children: [
          TextField(controller: tecNome,),
          TextField(controller: tecPreco,),
          TextField(controller: tecDescricao,),
          TextField(controller: tecCategoria,),
          ElevatedButton(onPressed: salvarAction, child: Text("Salvar"))
        ],
      ) ,
    );
  }

  void salvarAction() async{
    widget.produto.nome = tecNome.text;
    widget.produto.descricao = tecDescricao.text;
    widget.produto.preco = double.parse(tecPreco.text);
    widget.produto.categoriaId = int.parse(tecCategoria.text);
    bool result = await ProdutoWSClient().alterar(widget.produto);
    if (result) {
      Navigator.of(context).pop(widget.produto);
    }
    print("Falha ao Alterar Produto");
  }
}
