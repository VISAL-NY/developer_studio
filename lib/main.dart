import 'package:flutter/material.dart';
import 'package:developer_studio/screen/home_screen.dart';
import 'package:developer_studio/screen/detail_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get_storage/get_storage.dart';

void main()async{

  await GetStorage.init();
  //remove # sign from url for flutter web 
  setPathUrlStrategy();

  runApp(MaterialApp(
      title: 'Developer Studio' ,
      initialRoute:'/',
      routes: {
        //'/':(context) => const MyHomeScreen(),
        '/detail':(context) => const DetailScreen(),
      },
      home:MyHomeScreen()
      )
  );
}