import 'package:final_projcct/login_page.dart';
import 'package:final_projcct/Pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const WelcomePage(),
      routes: {
        '/login':(context) => const Login(), 
        '/register':(context) => const Register(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF242C3C),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,1],
            colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
          ) 
        ),
        child: Center(
          child: Column(
            children:<Widget>[
              const Padding(padding: EdgeInsets.all(40),child:  Text("Welcome", style: TextStyle(fontSize: 42, color: Colors.white,fontWeight: FontWeight.bold),)),
              const SizedBox(width: 250, child: Text("This is a food delivery app that ensure high quality food and fast delivery in Cambodia", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w300),textAlign: TextAlign.center,)),
              Padding(padding: const EdgeInsets.only(bottom: 20.0),child: Image.asset('assets/images/stopwatch.png')),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    ),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF776C94),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            minimumSize: const Size(190, 55),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          }, // Add your onPressed callback here
                          child: const Text("Log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Don’t have an account?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal
                                )
                              ),
                              TextSpan(
                                text: " Sign Up",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ),
                                recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  Navigator.pushNamed(context, '/register');
                                }
                              ),
                            ],
                          ),
                        ),
                        const Text("Choose a language",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal
                          )
                        ),
                         const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LanguageBox(text: "English", image: 'US.png',color: Color(0xFF776C94),),
                            LanguageBox(text: "Khmer", image: 'KH.png',color: Color(0xFF776C94),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class LanguageBox extends StatelessWidget {
  
  final String text;
  final String image;
  final Color color;

  const LanguageBox({
    super.key,
    required this.image,
    required this.text,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/$image'),
                  Text("   $text", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),),
                ],
              
              ),
            )
          ],
        ),
      ),
    );
  }
}
