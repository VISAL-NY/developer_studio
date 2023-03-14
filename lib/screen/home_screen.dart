import 'package:flutter/material.dart';
import 'package:developer_studio/screen/detail_screen.dart';

class MyHomeScreen extends StatelessWidget {
   MyHomeScreen({super.key});

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Studio' ,
      initialRoute:'/',
      routes: {
        //'/':(context) => const MyHomeScreen(),
        '/detail':(context) => const DetailScreen(),
      },
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Sign In",style: TextStyle(fontSize: 24),),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
              ),
    
              ElevatedButton(onPressed: (){
                if(_emailController.value.text=="admin@gmail.com" && _passwordController.value.text=="admin"){
                  Navigator.pushNamed(context, '/detail');
                }
                  
              }, child:const SizedBox(
                  width: 60,
                  height: 40,
                child: Center(child: Text("Login",style: TextStyle(fontSize: 18),)))
              )
            ],
          ),
        ),
      ),
    );
  }
}