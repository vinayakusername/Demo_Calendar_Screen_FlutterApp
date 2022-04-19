import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateMyAppHomePage extends StatefulWidget 
{
  final RateMyApp rateMyApp;
  const RateMyAppHomePage({ Key? key,required this.rateMyApp }) : super(key: key);

  @override
  State<RateMyAppHomePage> createState() => _RateMyAppHomePageState();
}

class _RateMyAppHomePageState extends State<RateMyAppHomePage> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Padding
      (
        padding: EdgeInsets.all(48),
        child: Center
        (
          child: ElevatedButton
          (
            onPressed: (){}, 
            child:Text('Rate My App')
          ),
        ),
      ),
    );
  }
}