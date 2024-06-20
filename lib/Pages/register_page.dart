
import 'package:final_projcct/login_page.dart';
import 'package:final_projcct/Pages/naviagate.dart';
import 'package:final_projcct/welcome_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/app': (context) => const Navigate(),
        '/welcome': (context) => const Welcome(),
      },
      home: const Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/app':(context) => const Navigate(),
        '/welcome': (context) => const Welcome(),
      },
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), // Set preferredSize to a higher value
          child: AppBar(
            backgroundColor: const Color(0xFF242C3C),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 1],
              colors: [Color(0xFF242C3C), Color(0xFF4D5D7A)],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 25,
                          child: IconButton(onPressed: (){
                            Navigator.pushNamed(context, '/welcome');
                          }, 
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(Icons.arrow_back,size: 25,color: Colors.white)),
                        ),
                        const Text("Register",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),),
                        const Text("")
                      ],
                    ),
                    // const Padding(padding: EdgeInsets.only(top: 40)),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InputBox(
                              icon: const Icon(Icons.mail), 
                              text: "Email", 
                              placeholder: "Email",
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                  return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InputBox(
                              icon: const Icon(Icons.person), 
                              text: "Username", 
                              placeholder: "Username",
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter your username';
                                } 
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: PasswordInputBox(
                              icon: const Icon(Icons.lock_outline),
                              passwordVisible: _passwordVisible,
                              placeholder: "Password",
                              text: "Password",
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Please enter your password";
                                }else if(value.length < 6){
                                  return "Password must be over 6 character";
                                }
                                return null;
                              },
                              togglePasswordVisibility: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),  
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,bottom: 10),
                            child: PasswordInputBox(
                              icon: const Icon(Icons.lock_outline),
                              passwordVisible: _passwordVisible,
                              placeholder: "Re-Enter Password",
                              text: "Re-Enter Password",
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Please re-enter your password";
                                }else if(value.length < 6){
                                  return "Password must be over 6 character";
                                }
                                return null;
                              },
                              togglePasswordVisibility: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),  
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF776C94),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                              minimumSize: const Size(180, 50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate()?? false) {
                                // Handle form submission
                                Navigator.pushNamed(context, '/app');
                              }
                            }, // Add your onPressed callback here
                            child: const Text("Register", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: SizedBox(
                        width: 250,
                        child: RichText(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "By registering, you confirm that you accept our",
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " Term of Use",
                                style: TextStyle(color: Color(0xFFECC436), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: Color(0xFFECC436), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 20),
                      child: Center(
                        child: SizedBox(
                          height: 1,
                          width: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            ),
                        ),
                      )
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Or Sign in using", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),)
                        ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const SignBox(image: 'f.png', text: "Sign in with Facebook", color: Color(0xFF0148A4), width: 195, height: 40),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const SignBox(image: 'g.png', text: "Sign in with Facebook", color: Color(0xFFE43009), width: 195, height: 40),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already hane an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: "Sign in",
                          style: const TextStyle(color: Color(0xFFECC436), fontSize: 12, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.pushNamed(context, '/login');
                          }
                        ),
                      ] 
                    ),
                  )
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}



class SignBox extends StatelessWidget {
  
  final String text;
  final String image;
  final Color color;
  final double width;
  final double height;

  const SignBox({
    super.key,
    required this.image,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child:  Center(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/$image'),
                Text("   $text", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),),
              ],
            ),
          )
      ),
    );
  }
}
