
import 'package:final_projcct/Pages/naviagate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Foods());
}

class Foods extends StatelessWidget {
  const Foods({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const FoodsPage(),
      routes: {
        '/landing':(context) => const Navigate(), 
      },
    );
  }
}

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  int _selectedItem = 1;
  final bool _selectedValue1 = false;
  final bool _selectedValue2 = false;
  final bool _selectedValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF242C3C),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,1],
            colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
          ),
        ),
        child: Stack(
          children: [
            Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 50,right: 50,bottom: 30),
              child: Column(
                children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/spaghetti.png',width: 350,height: 250)),
                      const Padding(padding: EdgeInsets.all(8)),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Meatball Spaghetti",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.star,color: Color.fromARGB(255, 211, 194, 39),),
                          RichText(text: const TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: "4.5",
                                style: TextStyle(color: Colors.black)
                              ),
                              WidgetSpan(child: SizedBox(width: 5)),
                              TextSpan(
                                text: "(251+)",
                                style: TextStyle(color: Colors.grey)
                              ),
                              WidgetSpan(child: SizedBox(width: 10)),
                              TextSpan(
                                text: "See Review",
                                style: TextStyle(
                                  color: Color(0xFFFE724C),
                                  decoration: TextDecoration.underline
                                )
                              )
                            ]
                          ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(text: 
                            const TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$",
                                  style: TextStyle(color: Color(0xFF077657))
                                ),
                                WidgetSpan(child: SizedBox(width: 2)),
                                TextSpan(
                                  text: "8.99",
                                  style: TextStyle(color: Color(0xFF077657),fontSize: 24,fontWeight: FontWeight.w500)
                                ),
                              ]
                            ),
                          ),
                          Row(
                            children: [
                              DecoratedBox(decoration: 
                                BoxDecoration(
                                  border: Border.all(color: const Color(0xFFFE724C),width: 0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        if(_selectedItem>1){
                                          _selectedItem--;
                                        }
                                      })
                                    },
                                    child: const Icon(Icons.remove,size: 18,color: Color(0xFFFE724C))
                                  )
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              SizedBox(width: 17, child: Align(alignment: Alignment.center, child: Text(_selectedItem.toString(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500)))),
                              const Padding(padding: EdgeInsets.all(5)),
                              DecoratedBox(decoration: 
                                BoxDecoration(
                                  border: Border.all(color: const Color(0xFFFE724C),width: 0.5),
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFFE724C)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        _selectedItem++;
                                      })
                                    },
                                    child: const Icon(Icons.add,size: 18,color: Colors.white)
                                  )
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      const Text("Use a mix of beef and pork for tenderness. Breadcrumbs – Helps to bind the meatballs. Parmesan – Adds a rich, savory flavor. Spaghetti – Use your favorite type, cooked al dente. Marinara sauce – A classic tomato-based sauce with garlic, onions, and Italian herbs.",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Choice of Add on",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Extra Meatball"),
                          Row(
                            children: [
                              const Text("+\$2.99", style: TextStyle(fontWeight: FontWeight.w500),),
                              const SizedBox(width: 8),
                              CircularCheckbox(value: _selectedValue1),
                            ]
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Extra Cheese"),
                          Row(
                            children: [
                              const Text("+\$0.99",style: TextStyle(fontWeight: FontWeight.w500)),
                              const SizedBox(width: 8),
                              CircularCheckbox(value: _selectedValue2),
                            ]
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Extra Parmesan"),
                          Row(
                            children: [
                              const Text("+\$2.49", style: TextStyle(fontWeight: FontWeight.w500)),
                              const SizedBox(width: 8),
                              CircularCheckbox(value: _selectedValue3),
                            ]
                          )

                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFFE724C),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15,bottom: 15, left: 50,right: 50),
                          child: Text("Add to Cart", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
             Positioned(
                top: 50,
                left: 30,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/landing');
                  },
                  child: Image.asset('assets/images/chevronleft.png')),
              ),
            
          ],
        )
      )
    );
  }
}

class CircularCheckbox extends StatefulWidget {
  final bool value;

  const CircularCheckbox({
    super.key, required this.value,
  });

  @override
  State<CircularCheckbox> createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  late bool dynamicValue;

  @override
  void initState(){
    super.initState();
    dynamicValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        setState(() {
          dynamicValue = !dynamicValue;
        });
       },
       child: Container(
         width: 20.0,
         height: 20.0,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border.all(
             color: dynamicValue ? const Color(0xFFFE724C) : Colors.grey,
             width: 2.0,
           ),
         ),
         child: Center(
           child: Container(
             width: 10.0,
             height: 10.0,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: dynamicValue ? const Color(0xFFFE724C) : Colors.transparent,
             ),
           ),
         ),
       ),
     );
  }
}