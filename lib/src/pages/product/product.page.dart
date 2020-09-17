import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../models.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';
import '../../widgets/product_item.dart';

class ProductPage extends StatefulWidget {
  final String title;
  final Product product;

  ProductPage({Key key, this.title, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double rating = 4;
  int quantity = 1;

  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
        leading: BackButton(color: darkText),
        title: Text(product.name, style: h4),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: _details,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: _productItem,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _productItem {
    return SizedBox(
      width: 200,
      height: 160,
      child: ProductItem(
        product: product,
        isProductPage: true,
        width: 250,
        onTap: () {},
        onLike: () {},
      ),
    );
  }

  Widget get _details {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 20),
      padding: EdgeInsets.only(top: 100, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 15, spreadRadius: 5, color: Color.fromRGBO(0, 0, 0, .05)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(product.name, style: h5),
          Text('\$${product.price.toStringAsFixed(2)}', style: h3),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            child: SmoothStarRating(
              allowHalfRating: false,
              onRated: (v) => setState(() => rating = v),
              starCount: 5,
              rating: rating,
              size: 27.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text('Quantity', style: h6),
                  margin: EdgeInsets.only(bottom: 15),
                ),
                IntCounter(
                  value: quantity,
                  onChange: (value) => setState(() => quantity = value),
                ),
              ],
            ),
          ),
          Container(
            width: 180,
            child: CustomOutlineButton(
              child: Text('Buy Now'),
              onPressed: () {},
            ),
          ),
          Container(
            width: 180,
            child: CustomFlatButton(
              child: Text('Add to Cart'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
