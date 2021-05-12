import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/modules/produto/infra/models/product.dart';
import 'package:flutter_page_view_browser/modules/produto/ui/product_card_item.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> items;
  final ScrollController scrollController;

  ProductsListView({@required this.items, @required this.scrollController});

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.items.length,
        // controller: widget.scrollController,
        physics: PageScrollPhysics(),
        itemBuilder: (context, index) =>
            ProductCardItem(produto: widget.items[index]),
      ),
    );
  }
}
