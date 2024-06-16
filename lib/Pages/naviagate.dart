import 'package:final_projcct/Pages/account_page.dart';
import 'package:final_projcct/Pages/browse-food_page.dart';
import 'package:final_projcct/Pages/landing_page.dart';
import 'package:final_projcct/Pages/order_page.dart';
import 'package:final_projcct/Pages/cart_page.dart';
import 'package:final_projcct/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Navigate());
}

class Navigate extends StatelessWidget {
  const Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
      },
      home: NavigatePage(),
    );
  }
}

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {

  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          backgroundColor: const Color(0xFF242C3C),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,1],
            colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
          ),
        ),
        child: <Widget>[
          const LandingPage(),
          const BrowseFoodPage(),
          const OrderPage(),
          const CartPage(),
          const AccountPage()

        ][selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int value) => {
          setState(() {
            selectedIndex = value;
          })
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(selectedIcon: Icon(Icons.food_bank), icon: Icon(Icons.food_bank_outlined), label: "Browse"),
          NavigationDestination(selectedIcon: Icon(Icons.shopping_bag), icon: Icon(Icons.shopping_bag_outlined), label: "Ordered"),
          NavigationDestination(selectedIcon: Icon(Icons.shopping_cart), icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          NavigationDestination(selectedIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: "Account"),
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
        ]
      ),
      child: SizedBox(
        height: 100,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/$image',width: 60,height: 45,), 
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
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
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('assets/images/$image', width: 145, height: 85,),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,bottom: 2),
              child: Align(alignment: Alignment.centerLeft,child: Text(store, style: const TextStyle(fontSize: 9,fontWeight: FontWeight.w400, color: Color(0xFFA59C9C)))),
            ),
            // const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Row(
                children: [
                  Icon(Icons.star, size: 10,color: Colors.amber,),
                  Icon(Icons.star, size: 10,color: Colors.amber,),
                  Icon(Icons.star, size: 10,color: Colors.amber,),
                  Icon(Icons.star, size: 10,color: Colors.amber,),
                  Icon(Icons.star_border, size: 10),
                  Text(" (4.0)",style: TextStyle(fontSize: 8, fontWeight: FontWeight.w300),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
              child: Align(alignment: Alignment.centerLeft,child: Text(text, style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5,right: 5,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$10",style: TextStyle(fontSize: 12,color: Colors.green, fontWeight: FontWeight.w500)),
                  Icon(Icons.add_circle, color: Colors.red,size: 12,)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}