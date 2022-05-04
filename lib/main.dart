//import 'package:demo_flutter_calender_application_1/screens/calender_home_screen.dart';
//import 'package:demo_flutter_calender_application_1/screens/render_html_contentExample.dart';
//import 'package:demo_flutter_calender_application_1/screens/subscript_and_superscriptExample.dart';
import 'package:demo_flutter_calender_application_1/dynamic_form_with_api/dynamic_form_db_services/read_json_question_data.dart';
import 'package:demo_flutter_calender_application_1/dynamic_form_with_api/dynamic_form_screen/dynamic__survey_form.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/screens/dynamic_form.dart';
//import 'package:demo_flutter_calender_application_1/screens/user_rating_screens/rateMyAppHomePage.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/screens/dynamic_form2.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/screens/dynamic_form3.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/screens/dynamic_form4.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/screens/dynamic_form5.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_textEditing_controller/dynamic_textEditing_controller.dart';
import 'package:demo_flutter_calender_application_1/screens/file_picker_widget/file_picker_widget.dart';
import 'package:demo_flutter_calender_application_1/screens/user_rating_screens/rate_my_app_example.dart';
//import 'package:demo_flutter_calender_application_1/screens/url_launcher_screens/url_laucher_example.dart';
//import 'package:demo_flutter_calender_application_1/screens/user_rating_screens/user_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() 
{
  initializeDateFormatting().then((_) => runApp(MyApp()));

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return RateAppInitWidget
    (
     builder:(rateMyApp)=> MaterialApp
    (
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: CalenderHomeScreen()
      //home: DisplaySubAndSuperScript(),
      //home: RenderHTMLContent(),
      //home: urlLauncherExample(),
       //home: RateMyAppHomePage(rateMyApp: rateMyApp,),
       //home: ReviewMyApp(),
       //home: DynamicFormPage1(),
       //home: DynamicFormPage(),
       //home: DynamicFormPage4(),
       //home: DynamicForm5Page(),
       home: DynamicSurveyForm(),
       //home: DynamicFormPage3(),
       //home: PickAnyFile(),
       //home: DynamicTextEditingController(),
    )
    );
   
  }
}


