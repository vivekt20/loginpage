import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_interface/register.dart';

class LoginSharedpref extends StatefulWidget{
  const LoginSharedpref({super.key});
  @override
  State<LoginSharedpref> createState()=> _LoginSharedprefState();
}
class _LoginSharedprefState extends State<LoginSharedpref>{
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  String _loginMessage='';
  
  Future <void> _login()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? storedUsername= prefs.getString('username');
    String? storedPassword=prefs.getString('password');

    if(storedUsername==usernameController.text&&
    storedPassword==passwordController.text
    ){
      setState(() {
        _loginMessage='Login Successful!';
      });
    }else{
      setState(() {
        _loginMessage='Invalid credentials! please try again.';
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(244, 0, 255, 8),
            Colors.green,
            const Color.fromARGB(255, 5, 83, 55),
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Login",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,),)],
            ),
            
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )
              ),
              child: Padding(padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("User Name",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                  ),
                  SizedBox(height: 15),
                  Text("Password",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                     child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
                     )),
                  ),
                  Center(child: Text(_loginMessage),),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>RegisterSharedpref()));
                    }, child: Text('Go to Registration',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
              ),
            ))
          ],
        ),
        
      ),
      
    );
  }
}