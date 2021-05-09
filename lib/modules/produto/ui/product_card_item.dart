import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/modules/produto/infra/models/product.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductCardItem extends StatefulWidget {
  final Product produto;

  const ProductCardItem({Key key, @required this.produto}) : super(key: key);

  @override
  _ProductCardItemState createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  int _quantity = 0;

  int _currentIndex = 0;

  void _incrementQuantity() {
    setState(() {
      _quantity += 1;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity >= 1) {
        _quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _buildProductImageContainer(widget.produto),
          _buildExpressoesContainer(widget.produto),
          _buildPriceContainer(widget.produto),
          _buildButtonsContainer(widget.produto),
        ],
      ),
    );
  }

  Widget _buildProductImageContainer(Product produto) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: produto.images.length,
              itemBuilder: (context, index) {
                return VisibilityDetector(
                  key: Key(index.toString()),
                  onVisibilityChanged: (VisibilityInfo info) {
                    if (info.visibleFraction == 1)
                      setState(() {
                        _currentIndex = index;
                      });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black54,
                    ),
                    child: Image.asset(
                      produto.images[index],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: produto.images.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                children: [
                  index == _currentIndex
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.all(6),
                          height: 10,
                          width: 10,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12,
                          ),
                          margin: EdgeInsets.all(6),
                          height: 10,
                          width: 10,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpressoesContainer(Product produto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            produto.description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Cabedal: ${produto.cabedal}'),
          Text('Solado: ${produto.solado}'),
        ],
      ),
    );
  }

  Widget _buildPriceContainer(Product produto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'R\$ ${produto.price.toStringAsPrecision(2)}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsContainer(Product produto) {
    return _quantity == 0
        ? _buildIconButtonContainer(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
            ),
            color: Colors.blue,
            onPressed: () => _incrementQuantity(),
          )
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButtonContainer(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  color: Colors.grey[400],
                  onPressed: () => _decrementQuantity(),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    '$_quantity',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                _buildIconButtonContainer(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                  onPressed: () => _incrementQuantity(),
                ),
              ],
            ),
          );
  }

  Widget _buildIconButtonContainer(
      {@required Icon icon,
      @required Function onPressed,
      Color color = Colors.black12}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
