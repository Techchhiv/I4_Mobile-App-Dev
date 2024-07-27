
import 'package:final_projcct/Pages/naviagate.dart';
import 'package:final_projcct/Pages/register_page.dart';
import 'package:final_projcct/welcome_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      routes: {
        '/welcome':(context) => const Welcome(),
        '/register':(context) => const Register(),
        '/landing':(context) => const Navigate(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>();
    bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: const Color(0xFF242C3C)),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: _formKey,
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
                        icon: const Icon(Icons.arrow_back,size: 25,color: Colors.white)),
                      ),
                      const Text("Login",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),),
                      const Text("")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InputBox(
                      icon: const Icon(Icons.person_sharp), 
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
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
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
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot your password?", style: TextStyle(color: Color(0xFFDAA21C))),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                        Navigator.pushNamed(context, '/landing');
                      }
                    }, // Add your onPressed callback here
                    child: const Text("Log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Or connect using", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SignBox(image: 'f.png', text: "Facebook", color: Color.fromARGB(255, 15, 82, 168), width: 120, height: 50),
                      // LanguageBox(image: 'facebook.png', text: "Facebook", color: Color(0xFF039BE5)),
                      SignBox(image: 'g.png', text: "Google", color: Color(0xFFE43009), width: 120, height: 50),
                      // LanguageBox(image: 'google.png', text: "Google", color: Color(0xFF469C49)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,bottom: 20),
                    child: Center(
                      child: SizedBox(
                        height: 1,
                        width: 210,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          ),
                      ),
                    )
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(color: Color(0xFFDAA21C), fontSize: 12, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Navigator.pushNamed(context, '/register');
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

class InputBox extends StatelessWidget {
  final Icon icon;
  final String text;
  final String placeholder;
  final Icon? pass;
  final String? Function(String?)? validator;

  const InputBox({
    super.key,
    required this.icon,
    required this.text,
    required this.placeholder,
    this.pass,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text, textAlign: TextAlign.start,style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 75,
            child: TextFormField(
              autocorrect: true,
              decoration: InputDecoration(
              prefixIcon: icon,
              prefixIconColor: Colors.grey,
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.white,
              errorStyle: const TextStyle(color: Color(0xFFDAA21C)),
              helperText: '',
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(15))),
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
              ),
              validator: validator,
            ),
          ),  
        )
      ],
    );
  }
}

class PasswordInputBox extends StatelessWidget {

  final Icon icon;
  final String text;
  final String placeholder;
  final String? Function(String?)? validator;
  final bool passwordVisible;
  final VoidCallback togglePasswordVisibility;

  const PasswordInputBox({
    super.key,
    required this.icon,
    required this.text,
    required this.placeholder,
    required this.validator,
    required this.passwordVisible,
    required this.togglePasswordVisibility,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, textAlign: TextAlign.start,style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 75,
            child: TextFormField(
              autocorrect: true,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
              prefixIcon: icon,
              prefixIconColor: Colors.grey,
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: togglePasswordVisibility,
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.white,
              errorStyle: const TextStyle(color: Color(0xFFDAA21C)),
              helperText: '',
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(15))),
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
              ),
              validator: validator,
            ),
          ),
        )
      ],
    );
  }
}