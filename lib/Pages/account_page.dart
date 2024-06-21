import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: AccountPage(),
    )
  );
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3,1],
              colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20,left: 30,right: 30),
              child: Column(
                children: [ 
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: ()=>{
                              Navigator.pushNamed(context, '/login'),
                            },
                            child: const Icon(Icons.logout,color: Color(0xFF646060))
                          ),
                          const Icon(Icons.settings,color: Color(0xFF646060)),
                        ],
                      ),
                  
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF6C6FD6)),
                      color: const Color(0xFFF9F6F6)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Icon(Icons.person_outline,size: 38),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(6)),
                  const Text("Elijah Wood", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                  const Text("Edit Profile", style: TextStyle(color: Color(0xFF9796A1), fontSize: 12)),
                  const Padding(padding: EdgeInsets.all(20)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Full name", style: TextStyle(color: Color(0xFF9796A1), fontSize: 14,fontWeight: FontWeight.w500))),
                  const Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Elijah Wood",
                      hintStyle: TextStyle(color: Color(0xFF111719),fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("E-mail", style: TextStyle(color: Color(0xFF9796A1), fontSize: 14,fontWeight: FontWeight.w500))),
                  const Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "prelookstudio@gmail.com",
                      hintStyle: TextStyle(color: Color(0xFF111719),fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Location", style: TextStyle(color: Color(0xFF9796A1), fontSize: 14,fontWeight: FontWeight.w500))),
                  const Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Ruessy Keo, Phnom Pehn",
                      hintStyle: TextStyle(color: Color(0xFF111719),fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phone Number", style: TextStyle(color: Color(0xFF9796A1), fontSize: 14,fontWeight: FontWeight.w500))),
                  const Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "+(855) 0986 8786",
                      hintStyle: TextStyle(color: Color(0xFF111719),fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}