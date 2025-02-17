import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wori_app/core/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
  _usernameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();
    super.dispose();
  }

  void _showInputValues(){
    String userName = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();
    print(" $userName $password $email");
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextInput("Username", Icons.person, _usernameController),
              SizedBox(height: 20,),
              _buildTextInput("Email", Icons.email_outlined, _emailController),
              SizedBox(height: 20,),
              _buildTextInput("Password", Icons.lock, _passwordController,isPassword: true),
              SizedBox(height: 20,),
              _buildRegisterButton(),
              SizedBox(height: 20,),
              _buildLoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(){
    return Center(
      child: GestureDetector(
        onTap: (){
          _showInputValues();
        },
        child:RichText(text: TextSpan(text: "Already have an account ? ",style: TextStyle(color: Colors.grey)
      ,  children: [
          TextSpan(
            text: "Click here to Login",

            style: TextStyle(color: Colors.blue)
          )
            ]
        ),

        ) ,
      ),
    );
  }

  Widget _buildRegisterButton () {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: DefaultColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
        onPressed: (){
          _showInputValues();
        }, child:Text("Register",style: TextStyle(color: Colors.white),),);
  }

  Widget _buildTextInput(
      String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              // suffixIcon: isPassword ? ,
              hintStyle: TextStyle(color: Colors.grey,),
              border: InputBorder.none
            ),
                style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
