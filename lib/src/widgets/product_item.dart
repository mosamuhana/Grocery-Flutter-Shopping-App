import 'package:flutter/material.dart';

import '../models.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final double width;
  final VoidCallback onLike;
  final VoidCallback onTap;
  final bool isProductPage;

  const ProductItem({
    Key key,
    this.product,
    this.width,
    this.onLike,
    this.onTap,
    this.isProductPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 180,
            child: RaisedButton(
              color: white,
              elevation: (isProductPage) ? 20 : 12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: onTap,
              child: Hero(
                transitionOnUserGestures: true,
                tag: product.name,
                child: Image.asset(product.image, width: (width != null) ? width : 100),
              ),
            ),
          ),
          Positioned(
            bottom: isProductPage ? 10 : 70,
            right: 0,
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: CircleBorder(),
              onPressed: onLike,
              child: Icon(
                (product.isLiked) ? Icons.favorite : Icons.favorite_border,
                color: (product.isLiked) ? primaryColor : darkText,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: (!isProductPage)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: foodNameText),
                      Text('\$${product.price.toStringAsFixed(2)}', style: priceText),
                    ],
                  )
                : Text(' '),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: (product.discount != null)
                ? Container(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      '-${product.discount.toStringAsFixed(1)}%',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  )
                : SizedBox(width: 0),
          )
        ],
      ),
    );
  }
}
