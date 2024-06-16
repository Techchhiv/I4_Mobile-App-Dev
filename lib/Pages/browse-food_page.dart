import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: BrowseFoodPage(),
    )
  );
}

class BrowseFoodPage extends StatelessWidget {
  const BrowseFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,1],
            colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Text("Browse Food",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Our Food",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                          const Text("Special For You", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          const Padding(padding: EdgeInsets.all(12)),
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
                          const Padding(padding: EdgeInsets.all(12)),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("All", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              Text("Popular", style: TextStyle(color: Colors.grey)),
                              Text("Top of the Week", style: TextStyle(color: Colors.grey)),
                              Text("Seafood", style: TextStyle(color: Colors.grey)),
                              Text("Fast Food", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(20)),
                          const Text("Popular", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          const Padding(padding: EdgeInsets.all(10)),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(bottom: 5,top: 5),
                            child: Wrap(
                              spacing: 15,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                FoodItem(image: "item_burger.png", name: "Beef Burger with vegetables",price: 9.99,),
                                FoodItem(image: "item_pasta.png", name: "Cheesy Pasta",price: 8.99,),
                                FoodItem(image: "item_pizza.png", name: "Spanish Squid Stew",price: 11.99,),
                                FoodItem(image: "item_squid.png", name: "Beef Burger with vegetables",price: 9.99,),
                            
                              ],
                            ),
                          ),

                          const Padding(padding: EdgeInsets.all(20)),
                          const Text("Top of the week", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          const Padding(padding: EdgeInsets.all(10)),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(bottom: 5,top: 5,left: 2),
                            child: Wrap(
                              spacing: 15,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                FoodItem(image: "item_chicken.png", name: "Spicy Fried Chicken",price: 9.99,),
                                FoodItem(image: "item_pasta.png", name: "Cheesy Pasta",price: 8.99,),
                                FoodItem(image: "item_pizza.png", name: "Pineapple Pizza",price: 11.99,),
                                FoodItem(image: "item_crab.png", name: "New York Style Crab",price: 9.99,),
                            
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(20)),
                          const Text("Seafood", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          const Padding(padding: EdgeInsets.all(10)),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(bottom: 5,top: 5,left: 2),
                            child: Wrap(
                              spacing: 15,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                FoodItem(image: "item_lobster.png", name: "Lobster with dipping sauce",price: 9.99,),
                                FoodItem(image: "item_crab.png", name: "New York Style Crab",price: 8.99,),
                                FoodItem(image: "item_squid.png", name: "Spanish Squid Stew",price: 11.99,),
                                FoodItem(image: "item_oyster.png", name: "Fresh Oyster",price: 1.99,),
                            
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FoodItem extends StatelessWidget {
  final String image;
  final String name;
  final double price;

  const FoodItem({super.key, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            spreadRadius: 2, // spread radius
            blurRadius: 3, // blur radius
            offset: const Offset(3, 2),
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/items/$image",width: 90,height: 70,),
            const Padding(padding: EdgeInsets.all(2)),
            SizedBox(width: 88,child: Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis, maxLines: 1,)),
            const Padding(padding: EdgeInsets.all(2)),
            Text("\$${price.toString()}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.green))
          ],
        ),
      ),
    );
  }
}