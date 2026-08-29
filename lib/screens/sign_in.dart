import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/styles/colors.dart';
import 'package:mobile_project/styles/text_styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{

  //login function
  static Future<User?> loginUsingEmailPassword({required String email,required String password, required BuildContext context})async{
   FirebaseAuth auth= FirebaseAuth.instance;
   User? user;

   try{
     UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
     user= userCredential.user;

   }on FirebaseAuthException catch (e){
     if (e.code == "user-not-found"){
       print("No user found for that email");
     }
   }
   return user ;
  }
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool hidePassword = true ;


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;

    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: darkBlue,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Size.height * 0.1),
                width: Size.height * 0.3,
                child: Image.asset(
                  "assets/logo.png" ,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: Size.height * 0.05),
              Text(
                "Sign In",
                style: titleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                      suffix: Icon(Icons.email_outlined),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.0, horizontal: 14),
                child: TextField(

                  obscureText: hidePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                      suffix: InkWell(onTap:(){ setState(() {
                        hidePassword=!hidePassword ;
                      });},
                      child: Icon(Icons.remove_red_eye_sharp )),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Size.height * 0.05),
                child: SizedBox(
                  width: Size.width * 0.8,
                  height: Size.height * 0.07,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white, width: 0.9)),
                      ),
                      onPressed: ()async{

                        User? user= await loginUsingEmailPassword(email: emailController.text, password: passwordController.text, context: context);

                        if (user != null){

                          Navigator.pushNamed(context, "Map Page");

                        }
                      },
                      child:const Text("Sign In")),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
String? validatePassword(String? formaPassword) {

  if (formaPassword == null || formaPassword.isEmpty){
    return "password is required" ;
  }
}
