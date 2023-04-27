import 'package:flutter/foundation.dart';
import 'package:web/model/Produto.dart';
import 'package:web/wsClient/ProdutoWSClient.dart';
import 'package:flutter/material.dart';

@immutable
class DeletarProdutoPage extends StatefulWidget {
  final Produto produto;
  DeletarProdutoPage({super.key, required this.produto});


  @override
  State<DeletarProdutoPage> createState() => _DeletarProdutoPage();
}

class _DeletarProdutoPage extends State<DeletarProdutoPage> {
  final TextEditingController tecId = TextEditingController();
  List<Produto> lsProduto = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadProdutos());
    tecId.text = widget.produto.id.toString();
  }

  void loadProdutos() async {
    lsProduto = await ProdutoWSClient().getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Escolha produtos a serem excluídos")),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: lsProduto.length,
                    itemBuilder: (context, index) {
                      return templateRowListView(index);
                    }))
          ],
        ));
  }

  Widget templateRowListView(int index) {
    Produto produto = lsProduto[index];
    return Card(
        elevation: 10,
        child: InkWell(onTap: null, child: templateCellListView(produto)));
  }

  Widget templateCellListView(Produto produto) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Text("${produto.id!}"),
          const SizedBox(
            width: 50,
          ),
          Text(produto.nome!),
          const SizedBox(
            width: 50,
          ),
          Text("${produto.preco!}"),
          const SizedBox(
            width: 50,
          ),
          Text(produto.descricao!),
          const SizedBox(
            width: 50,
          ),
          const Expanded(child: Text("")),
          Text("${produto.categoriaId!}"),
          const SizedBox(
            width: 50,
          ),
          ElevatedButton(
              onPressed: excluirAction,
              child: const Icon(
                Icons.close,
              )),
          //Icon(Icons.navigate_next, color: Colors.orange,)
        ],
      ),
    );
  }

  void excluirAction() async{
    bool result = await ProdutoWSClient().excluir(id: widget.produto.id!);
    if (result) {
      loadProdutos();
    }
    print("Falha ao excluir Produto");
  }
}
