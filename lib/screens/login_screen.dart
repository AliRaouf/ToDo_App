import 'package:flutter/material.dart';
import 'package:tasks_app/components/custom_button.dart';
import 'package:tasks_app/components/custom_text_form_field.dart';
import 'package:tasks_app/screens/register_screen.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfffaf4f4),
      body: Form(
        child: Container(
          margin: EdgeInsets.only(top: screenheight * 0.08),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: screenheight * 0.3,
                  width: screenwidth * 0.5,
                ),
                const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Container(width: screenwidth*0.95,height: screenheight*0.09,
                  margin: EdgeInsets.only(
                      bottom: screenheight * 0.04, top: screenheight * 0.01),
                  child: CustomTextFormField(hint: "Email", controller: emailController,),
                ),
                Container(width: screenwidth*0.95,height: screenheight*0.09,margin: EdgeInsets.only(bottom: screenheight*0.04),
                  child: CustomTextFormField(hint: "Password", controller: passwordController,),
                ),
                CustomButton(width: screenwidth*0.5, height: screenheight*0.06, onPressed: () {
                  print("Password: ${passwordController.text} + email: ${emailController.text}");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TasksScreen();
                  }
                  )
                  );
                  },text: "Login",)
                ,Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Don't Have an Account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterScreen();
                    }
                    )
                    );
                  },child: const Text("Register"))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




