import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';


class ReviewMyApp extends StatefulWidget 
{
  const ReviewMyApp({ Key? key }) : super(key: key);

  @override
  State<ReviewMyApp> createState() => _ReviewMyAppState();
}

class _ReviewMyAppState extends State<ReviewMyApp> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Launch App Review')),
        body: Center(
          child: RaisedButton(
            child: Text("Rate My App"),
            onPressed: () => LaunchReview.launch
            (
              androidAppId: "com.iyaffle.kural",
              iOSAppId: "585027354",
            ),
          ),
        ),
    );
  }
}