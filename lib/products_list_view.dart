import 'package:flutter/material.dart';

import 'package:flutter_page_view_browser/product.dart';
import 'package:flutter_page_view_browser/product_card_item.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> items;
  final ScrollController scrollController;

  ProductsListView({@required this.items, this.scrollController});

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.items.length,
        controller: widget.scrollController,
        itemBuilder: (context, index) =>
            ProductCardItem(produto: widget.items[index]),
      ),
    );
  }
}
