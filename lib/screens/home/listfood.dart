import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/food.dart';
import 'package:food_application/screens/home/details/detailsScreen.dart';

Widget foodDetailCard(food myfood, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 150,
      child: Card(
        color: kPrimaryColor,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context{return detailscreen()})))
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detailscreen(
                        name: "Burger",
                        price: 45,
                        numOfViewers: 35,
                        rating: 4.5,
                      )),
              // name: "Burger",
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 125.0,
                      height: 125.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(myfood.profileImg),
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      myfood.nameFood,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      myfood.ingrediant,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// class ListFood extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFCFAF8),
//       body: ListView(
//         children: [
//           SizedBox(height: 15.0,),
//           Container(
//             padding: EdgeInsets.only(right: 15.0),
//             width: MediaQuery.of(context).size.width-30,
//             height: MediaQuery.of(context).size.width-50,
//             child: GridView.count(
//               crossAxisCount: 2,
//               primary: false,
//               crossAxisSpacing: 10.0,
//               mainAxisSpacing: 15.0,
//               childAspectRatio: 0.8,
//               children: [
//               ],
//             ),

//             ),
//         ],
//       ),

//     );
//   }

//   Widget buildCard(String name, String price, String imgPath, bool added,
//   bool isFavorite, context)
//   {
//     return Padding(
//       padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 3.0,
//                 blurRadius: 5.0,
//               )
//             ],
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
