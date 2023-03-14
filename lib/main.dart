import 'package:flutter/material.dart';
import 'package:developer_studio/screen/home_screen.dart';
import 'package:developer_studio/screen/detail_screen.dart';
import 'dart:html' as html;

void main(){
  html.window.history.pushState(null, '', '/');
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