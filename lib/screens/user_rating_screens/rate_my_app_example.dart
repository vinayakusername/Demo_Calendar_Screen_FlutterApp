import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInitWidget extends StatefulWidget 
{
  final Widget Function(RateMyApp) builder; 

  const RateAppInitWidget({ Key? key,required this.builder }) : super(key: key);

  @override
  State<RateAppInitWidget> createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> 
{
  RateMyApp? rateMyApp;

  static const playStoreId ='com.android.chrome';
  static const appStoreId = 'com.apple.mobilesafari';
  
  @override
  Widget build(BuildContext context) 
  {
    return RateMyAppBuilder
    (
      rateMyApp: RateMyApp
      (
        googlePlayIdentifier: playStoreId,
        appStoreIdentifier: appStoreId,
  
      ),
      onInitialized: (context,rateMyApp)
      {
        setState(() 
        {
          this.rateMyApp = rateMyApp;//we are storing data of rateMyApp obtain from sharePreferences which device store.
        });
      },
      builder: (context)=> rateMyApp == null 
                                         ? Center(child: CircularProgressIndicator(),)
                                         : widget.builder(rateMyApp!) 
    );
  }
}