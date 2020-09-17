import '../assets.dart';
import '../models.dart';
import '../shared/custom_icons.dart';

List<Product> getFoods() {
  return [
    Product(
      name: "Hamburger",
      image: Assets.image('3.png'),
      price: 25,
      isLiked: true,
      discount: 10,
    ),
    Product(
      name: "Pasta",
      image: Assets.image('5.png'),
      price: 150,
      isLiked: false,
      discount: 7.8,
    ),
    Product(
      name: "Akara",
      image: Assets.image('2.png'),
      price: 10.99,
      isLiked: false,
    ),
    Product(
      name: "Strawberry",
      image: Assets.image('1.png'),
      price: 50,
      isLiked: true,
      discount: 14,
    )
  ];
}

List<Product> getDrinks() {
  return [
    Product(
      name: "Coca-Cola",
      image: Assets.image('6.png'),
      price: 45.12,
      isLiked: true,
      discount: 2,
    ),
    Product(
      name: "Lemonade",
      image: Assets.image('7.png'),
      price: 28,
      isLiked: false,
      discount: 5.2,
    ),
    Product(
      name: "Vodka",
      image: Assets.image('8.png'),
      price: 78.99,
      isLiked: false,
    ),
    Product(
      name: "Tequila",
      image: Assets.image('9.png'),
      price: 168.99,
      isLiked: true,
      discount: 3.4,
    )
  ];
}

List<Category> getCategories() {
  return [
    Category(id: 1, name: 'Frieds', icon: CustomIcons.dinner),
    Category(id: 1, name: 'Fast Food', icon: CustomIcons.food),
    Category(id: 1, name: 'Creamery', icon: CustomIcons.poop),
    Category(id: 1, name: 'Hot Drinks', icon: CustomIcons.coffee_cup),
    Category(id: 1, name: 'Vegetables', icon: CustomIcons.leaf),
  ];
}
