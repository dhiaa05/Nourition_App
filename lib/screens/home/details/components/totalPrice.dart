import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PriceTotal extends StatelessWidget {
  final int price, numOfReviews;
  final double rating;
  final String name;
  final RatingChangeCallback onRatingChanged;
  const PriceTotal({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating, this.name, this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SmoothStarRating(
                    borderColor: kPrimaryColor,
                    rating: rating,
                    onRated: onRatingChanged,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("$numOfReviews Reviews")
                ],
              )
            ],
          )),
          priceRating(context, price: price)
        ],
      ),
    );
  }

  Container priceRating(BuildContext context, {int price}) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 65,
      width: 65,
      color: kPrimaryColor,
      child: Text(
        "\$$price",
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
