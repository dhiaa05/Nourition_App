import 'package:flutter/material.dart';

import 'categorieFood.dart';

 SingleChildScrollView categorieList() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
                child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorieFood(
              title: "Dinner",
              isActive: true,
              press: () {},
            ),
            CategorieFood(
              title: "Breakfast",
              press: () {},
            ),
            CategorieFood(
              title: "Salad",
              press: () {},
            ),
            CategorieFood(
              title: "Snacks & Salades",
              press: () {},
            ),
            
          ],
        ),
      );
  }
