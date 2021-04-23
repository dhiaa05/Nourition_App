import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/screens/home/details/components/appBar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'components/totalPrice.dart';

class Detailscreen extends StatelessWidget {
  final price;
  final name;
  final numOfViewers;
  final rating;
  final decription;

  const Detailscreen(
      {Key key,
      this.price,
      this.name,
      this.numOfViewers,
      this.rating,
      this.decription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(
        name: name,
        price: price,
        numOfViewers: numOfViewers,
        rating: rating,
      ),
    );
  }
}

class Body extends StatelessWidget {
  final price;
  final name;
  final numOfViewers;
  final rating;
  final description;

  const Body(
      {Key key,
      this.price,
      this.name,
      this.numOfViewers,
      this.rating,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              children: [
                ShopName(
                  name: "MacDonalds",
                ),
                PriceTotal(
                  name: name,
                  numOfReviews: numOfViewers,
                  rating: rating,
                  price: price,
                  onRatingChanged: (value) {},
                ),
                Text(
                  (description != null)
                      ? description
                      : "A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty. ... As with other hamburgers, a cheeseburger may include toppings such as lettuce, tomato, onion, pickles, bacon, mayonnaise, ketchup, and mustard.",
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.emoji_food_beverage,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Eat Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ShopName extends StatelessWidget {
  final String name;
  const ShopName({
    this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: ksecondaryKey,
        ),
        SizedBox(
          width: 10,
        ),
        Text(name),
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    this.imgSrc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgSrc,
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    throw UnimplementedError();
    final path = Path();

    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
