import 'package:flutter/material.dart';
import 'package:food_application/component/searched_box.dart';
import 'package:food_application/food.dart';
import 'package:food_application/screens/home/listfood.dart';
import 'categorielist.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<food> listFood = [
    food(
        nameFood: 'Burger',
        profileImg: 'assets/images/burger.png',
        ingrediant: "Calories 187 , Energy 782kj \n Protein 16g, Total Fat 9g \n Total Carbohydrates 9g",
        index: 1),
    food(
        nameFood: 'Pizza',
        profileImg: 'assets/images/beyond-meat-mcdonalds.png',
        ingrediant: "UI Designer",
        index: 2),
    food(
        nameFood: 'hummas',
        profileImg: 'assets/images/burger.png',
        ingrediant: "Software Tester",
        index: 3),
    food(
        nameFood: 'hummas',
        profileImg: 'assets/images/burger.png',
        ingrediant: "Software Tester"),
        food(
        nameFood: 'Fruit Salad',
        profileImg: 'assets/images/Fruit-Salad.png',
        ingrediant: "Software Tester",
        index: 4),
        food(
        nameFood: 'Juice',
        profileImg: 'assets/images/juices.png',
        ingrediant: "Software Tester",
        index: 5),
        food(
        nameFood: 'Pasta',
        profileImg: 'assets/images/Pasta.png',
        ingrediant: "Software Tester",
        index: 6),
        food(
        nameFood: 'Pear Sauce',
        profileImg: 'assets/images/Pear-Sauce.png',
        ingrediant: "Software Tester",
        index: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChanged: (value) {}),
      //  Categorie(),
        Column(
            children: listFood.map((f) {
          return foodDetailCard(f, context);
        }).toList())
      ],
    );
  }
}
