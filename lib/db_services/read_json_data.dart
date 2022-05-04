import 'dart:convert';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/model/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List> readDynamicFormJsonData(BuildContext context) async 
  {
    final String response = await rootBundle.loadString('assets/json_data/json_widget_data2.json');
    final data = await json.decode(response);
    //print(data);
    
    List customWidgetList = data['widgets'];
    
    return customWidgetList;

  }