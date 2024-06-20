import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white
              ), 
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Ordered", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                            
                            border: Border(
                              bottom: BorderSide(width: 1, color: Color(0xFFE43009)),
                            ),
                          ),
                          child: const Text("All", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const Text("Unevaluated"),
                        const Text("Refund"),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ),
          const Expanded(
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  OrderBox(date: "06/06/2024 12:12",image: "texas.png",total: 7.13,items: "Set C etc, 2 items",name: "Texas Chicken(Sen Sok)",status: "Finished"),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  OrderBox(date: "06/06/2024 12:12",image: "ramen.png",total: 3.50,items: "H07 Ajitama etc. 2 items",name: "Riji Sushi & Ramen",status: "Finished"),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  OrderBox(date: "06/06/2024 12:12",image: "caputa.png",total: 4.57,items: "Fish Cake + Rice etc. 2 items",name: "CAPUTEA (Toul Kork)",status: "Finished"),
                  Padding(padding: EdgeInsets.only(top: 20)),
                ],
              ),
            ),
          )
        ],
      ),
    );
    
  }
}

class OrderBox extends StatelessWidget {
  final String name;
  final String image;
  final String date;
  final String items;
  final double total;
  final String status;


  const OrderBox({super.key, required this.name, required this.image, required this.date, required this.items, required this.total, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 178,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        children: [
           DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                color: Colors.black,
                width: 1,
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text(status),
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/$image'),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                        Text(items, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text("Total: \$$total")
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      clipBehavior: Clip.antiAlias,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0),
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.red, width: 1),
                      ),
                      ),
                      onPressed: ()=>{},
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Order")
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}