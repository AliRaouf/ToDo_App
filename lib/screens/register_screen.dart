import 'package:flutter/material.dart';
import 'package:tasks_app/components/custom_button.dart';
import 'package:tasks_app/components/custom_text_form_field.dart';
import 'package:tasks_app/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var nameController=TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfffaf4f4),
      body: Form(
        child: Container(
          margin: EdgeInsets.only(top: screenheight * 0.03),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }
                      )
                      );
                    }, icon: const Icon(Icons.arrow_back_ios)),
                  ],
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: screenheight * 0.3,
                  width: screenwidth * 0.5,
                ),
                const Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ), Container(width: screenwidth*0.95,height: screenheight*0.09,
                  margin: EdgeInsets.only(
                      bottom: screenheight * 0.04, top: screenheight * 0.01),
                  child: CustomTextFormField(hint: "Name", controller: nameController,),
                ),
                Container(width: screenwidth*0.95,height: screenheight*0.09,
                  margin: EdgeInsets.only(
                      bottom: screenheight * 0.04),
                  child: CustomTextFormField(hint: "Email", controller: emailController,),
                ),
                Container(width: screenwidth*0.95,height: screenheight*0.09,margin: EdgeInsets.only(bottom: screenheight*0.04),
                  child: CustomTextFormField(hint: "Password", controller: passwordController,),
                ),
                CustomButton(width: screenwidth*0.5, height: screenheight*0.06, onPressed: () {
                  print("Password: ${passwordController.text} + name: ${nameController.text} + email: ${emailController.text}");
                },text: "Register",)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




