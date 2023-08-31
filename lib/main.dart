import 'package:flutter/material.dart';
import 'package:t2020_app/Screens/home_screen.dart';
//ye standar jeson hy ye world recognize hy world janta hy lakin flutter nai jnata ye
// standar jason ko hum chgnge karngy dart jason main
//map main hmary sat key value pairs hoty hy ak key or usky satmny value
//app bar main jo chizain arhy hy wo action mian hum katy hy action  hamry sat list leta hy
//jub hum jasm sy data lyty hy thu fromjasin and jub deta dety hy thu to jasn
//venues data assignment
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T2020',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}