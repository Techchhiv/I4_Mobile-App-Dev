import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Cart", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          const SingleChildScrollView(
            child: Column(
              children: [
                ItemCart(image: "burger2.png", name: "Burger", price: 10),
                Padding(padding: EdgeInsets.only(top: 20)),
                ItemCart(image: "pizza2.png", name: "Pizza", price: 10),
                Padding(padding: EdgeInsets.only(top: 20)),
                ItemCart(image: "pasta2.png", name: "Pasta", price: 10),
              ],
            )
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Align(
            alignment: Alignment.centerRight,
            child: Text("More", style: TextStyle(color: Colors.white),),
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total amount:", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              Text("30\$", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 60)),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF133453),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              minimumSize: const Size(323, 43),
            ),
            onPressed: () {}, // Add your onPressed callback here
            child: const Text("CHECK OUT", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ItemCart({super.key, required this.name, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 104,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        children: [
          Image.asset('assets/images/$image',width: 94.71,),
          const Padding(padding: EdgeInsets.only(right: 20)),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 28,
                      width: 28,
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () => {},
                        icon: Image.asset('assets/images/minus.png',width: 28,height: 28),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text("1"),
                    ),
                    SizedBox(
                      height: 28,
                      width: 28,
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () => {},
                        icon: Image.asset('assets/images/plus.png',width: 28,height: 28),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Image.asset('assets/images/3dot.png'),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Text("\$$price"),
              ],
            ),
          )
        ],
      ),
    );
  }
}