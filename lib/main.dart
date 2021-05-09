import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/product.dart';
import 'package:flutter_page_view_browser/products_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> _items = List.generate(
    10,
    (index) => Product(
      id: index,
      images: [
        'assets/images/botina.jpeg',
        'assets/images/botina-2.jpeg',
        'assets/images/botina-3.jpeg',
      ],
      description: 'Bota de segurança confeccionada em couro',
      cabedal: 'Couro',
      solado: 'PU/PU Bidensidade',
      price: Random().nextDouble(),
    ),
  );

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.of(context).size.height;

    void _moveUp() {
      _scrollController.animateTo(_scrollController.offset - itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    void _moveDown() {
      _scrollController.animateTo(_scrollController.offset + itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(Icons.arrow_back_outlined),
        title: Text('Produtos'),
      ),
      body: Column(
        children: [
          _buildOrderInfoContainer(),
          _buildSearchTextFieldContainer(),
          _buildProductsListViewContainer(),
          _buildActionsUpAndDownContainer(_moveUp, _moveDown)
        ],
      ),
    );
  }

  Widget _buildOrderInfoContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.black26),
      height: 24,
    );
  }

  Expanded _buildProductsListViewContainer() {
    return Expanded(
      child: ProductsListView(
        items: _items,
        scrollController: _scrollController,
      ),
    );
  }

  Container _buildSearchTextFieldContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          hintText: 'Pesquisar',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Container _buildActionsUpAndDownContainer(_moveUp(), _moveDown()) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.black54,
              ),
              onTap: () => _moveUp(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black54,
              ),
              onTap: () => _moveDown(),
            ),
          ),
        ],
      ),
    );
  }
}
