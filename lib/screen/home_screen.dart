import 'package:flutter/material.dart';
import 'package:developer_studio/screen/detail_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqlite3/sqlite3.dart';

class MyHomeScreen extends StatefulWidget {
   MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final _emailController=TextEditingController();

  final _passwordController=TextEditingController();
  late var box;
  String email="";
  List<dynamic> itemList=[];
 late var db;

  @override
  void initState() {
    box=GetStorage();
  
    db=sqlite3.openInMemory();
    db.execute('''
    CREATE TABLE artists (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL
    );
  ''');



    super.initState();
  }

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
        appBar: AppBar(),
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
                // if(_emailController.value.text=="admin@gmail.com" && _passwordController.value.text=="admin"){
                //   Navigator.pushNamed(context, '/detail');
                //   box.write('email', _emailController.value.text).toString();

                // }
                setState(() {
                  
                   final stmt = db.prepare("INSERT INTO artists (name) VALUES (4)");
                  stmt..execute();
  

                stmt.dispose();


                final ResultSet resultSet =
      db.select('SELECT * FROM artists');



      print('hhhhhhh${resultSet[2]['id']}');
                });
                
                  
              }, child:const SizedBox(
                  width: 60,
                  height: 40,
                child: Center(child: Text("Login",style: TextStyle(fontSize: 18),)))
              ),

              box.read('email')==null?Container():ListView.builder(
                shrinkWrap: true,
                  itemCount:box.read('email').length,
                  itemBuilder: (context,index){
                    return Text(box.read('email')[index]);
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}