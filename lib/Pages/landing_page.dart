
import 'package:final_projcct/Pages/food_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
   
    home: const Scaffold(
      backgroundColor: Colors.blue, // Added background color for better visibility
      body: LandingPage(),
    ),
    routes: {
      '/foodpages':(context) => const Foods(),
    },
  ));
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello User,", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Icon(Icons.table_rows_rounded, color: Colors.grey),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 18),
                      Padding(padding: EdgeInsets.only(left: 5, top: 10)),
                      Text("Phnom Pehn, Russey Keo", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              minWidth: double.maxFinite,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Promotion", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.all(5)),
                  Center(child: Image.asset("assets/images/promotion.png")),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("view all", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(5),
                    child: Wrap(
                      spacing: 20,
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'burger.png', text: 'Burger'),
                        Category(image: 'pizza.png', text: 'Pizza'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                        Category(image: 'pasta.png', text: 'Pasta'),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("view all", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    height: 280, // Set a specific height for the ListView
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Food(image: 'food_pasta.png', text: "Cheesy Pasta", store: "Pizza Company"),
                            Food(image: 'food_burger.png', text: "Beef Burger with...", store: "Pizza Company"),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Food(image: 'food_pizza.png', text: "Pineapple Pizza", store: "Pizza Company"),
                            Food(image: 'food_chicken.png', text: "Spicy Fried Chicken", store: "Pizza Company"),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String text;

  const Category({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            spreadRadius: 2, // spread radius
            blurRadius: 3, // blur radius
            offset: const Offset(3, 2),
          ),
        ],
      ),
      child: SizedBox(
        height: 100,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/$image', width: 60, height: 45),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  final String image;
  final String text;
  final String store;

  const Food({
    super.key,
    required this.image,
    required this.text,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            spreadRadius: 2, // spread radius
            blurRadius: 3, // blur radius
            offset: const Offset(3, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('assets/images/foods/$image', width: 145, height: 85),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(store, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Color(0xFFA59C9C)))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Icon(Icons.star, size: 10, color: Colors.amber),
                  Icon(Icons.star, size: 10, color: Colors.amber),
                  Icon(Icons.star, size: 10, color: Colors.amber),
                  Icon(Icons.star, size: 10, color: Colors.amber),
                  Icon(Icons.star_border, size: 10),
                  Text(" (4.0)", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/foodpages')
                  },
                  child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$10", style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.w500)),
                  Icon(Icons.add_circle, color: Colors.red, size: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
