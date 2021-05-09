import 'dart:math';

import 'package:flutter_page_view_browser/modules/produto/infra/models/product.dart';
import 'package:flutter_page_view_browser/modules/produto/repositories/i_products_repository.dart';

class ProductsMockRepository extends IProductsRepository {
  @override
  List<Product> find() {
    return List.generate(
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
  }
}
