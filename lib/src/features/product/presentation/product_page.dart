import 'package:flutter/material.dart';
import 'package:shop_it_all/src/common_widgets/horizontal_bar.dart';
import 'package:shop_it_all/src/constants/content_gaps_constants.dart';
import 'package:shop_it_all/src/features/home/domain/product_model.dart';
import 'package:shop_it_all/src/features/product/presentation/review_content.dart';
import 'package:shop_it_all/src/features/product/presentation/product_page_top.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.topProduct,
    required this.addToCart,
    required this.onQuantityChanged,
    this.backColor = Colors.grey
  });

  final ProductModel topProduct;
  final VoidCallback addToCart;
  final ValueChanged<int> onQuantityChanged;
  final Color backColor;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductPageBody(
        topProduct: widget.topProduct,
        addToCart: widget.addToCart,
        onQuantityChanged: widget.onQuantityChanged,
        backColor: widget.backColor,
      ),
    );
  }
}

class ProductPageBody extends StatefulWidget {
  const ProductPageBody(
      {super.key,
      required this.topProduct,
      required this.addToCart,
      required this.onQuantityChanged,
      this.backColor = Colors.grey});

  final ProductModel topProduct;
  final VoidCallback addToCart;
  final ValueChanged<int> onQuantityChanged;
  final Color backColor;

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductPageTop(
          topProduct: widget.topProduct,
          addToCart: widget.addToCart,
          onQuantityChanged: widget.onQuantityChanged,
          backColor: widget.backColor,
        ),
        const HorizontalBar(
          barMargin: EdgeInsets.all(0),
        ),
        const ReviewContent(),
        gbHt30
      ],
    );
  }
}
