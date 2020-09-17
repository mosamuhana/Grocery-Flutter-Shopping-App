import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../models.dart';
import '../../routes.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';
import 'horizontal_headered_list.dart';

class StorePageContent extends StatelessWidget {
  final categories = getCategories();
  final foods = getFoods();
  final drinks = getDrinks();

  StorePageContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HorizontalHeaderedList(
          title: 'All Categories',
          height: 130,
          onViewMore: () {},
          shrinkWrap: true,
          children: [
            for (var category in categories)
              CategoryItem(
                category: category,
                color: white,
                onPressed: () {},
              ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: HorizontalHeaderedList(
            title: 'Hot Deals',
            shrinkWrap: false,
            height: 250,
            onViewMore: () {},
            children: _buildList(context, hotDealItems),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: HorizontalHeaderedList(
            title: 'Drinks Parol',
            shrinkWrap: false,
            height: 250,
            onViewMore: () {},
            children: _buildList(context, drinkDealItems),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  List<Widget> _buildList(BuildContext context, List<_DealItem> items) {
    if (items == null || items.isEmpty) return [_noContent];
    return [
      for (var e in items)
        ProductItem(
          product: e.product,
          width: e.width,
          onTap: () {
            Routes.toProduct(context, e.product);
          },
          onLike: () {
            print('Product ${e.product.name} Liked');
          },
        ),
    ];
  }

  List<_DealItem> get hotDealItems => [
        _DealItem(product: foods[0], width: null),
        _DealItem(product: foods[1], width: 250),
        _DealItem(product: foods[2], width: 200),
        _DealItem(product: foods[3], width: null),
      ];

  List<_DealItem> get drinkDealItems => [
        _DealItem(product: drinks[0], width: 60),
        _DealItem(product: drinks[1], width: 75),
        _DealItem(product: drinks[2], width: 110),
        _DealItem(product: drinks[3], width: null),
      ];

  final _noContent = Container(
    margin: EdgeInsets.only(left: 15),
    child: Text('No items available at this moment.', style: taglineText),
  );
}

// wrap the horizontal listview inside a sizedBox..

class _DealItem {
  final Product product;
  final double width;
  _DealItem({this.product, this.width});
}
