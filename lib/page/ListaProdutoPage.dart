import 'package:web/model/Produto.dart';
import 'package:web/page/ProdutoEditPage.dart';
import 'package:web/wsClient/ProdutoWSClient.dart';
import 'package:flutter/material.dart';

class ListaProdutoPage extends StatefulWidget {
  const ListaProdutoPage({Key? key}) : super(key: key);

  @override
  State<ListaProdutoPage> createState() => _ListaProdutoPage();
}

class _ListaProdutoPage extends State<ListaProdutoPage> {
  List<Produto> lsProduto = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadProdutos());
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
            title: Text("Lista de Produtos")),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(5.0),
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
        padding: EdgeInsets.all(25.0),
        child: Row(
          children: [
            Text("${produto.id}"),
            SizedBox(
              width: 50,
            ),
            Text(produto.nome!),
            SizedBox(
              width: 50,
            ),
            Text("${produto.preco}"),
            SizedBox(
              width: 50,
            ),
            Text(produto.descricao!),
            Expanded(child: Text("")),
            Text("${produto.categoriaId}"),
            SizedBox(
              width: 50,
            ),
            //Icon(Icons.navigate_next, color: Colors.orange,)
          ],
        ));
  }
}
