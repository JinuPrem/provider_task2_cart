import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task2_cart/provider/provider_page.dart';
import 'homepage.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context)=>Provider_class(),
child:const MyApp()));


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
