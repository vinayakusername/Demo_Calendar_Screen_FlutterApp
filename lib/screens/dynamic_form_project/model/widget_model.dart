import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/model/options_model.dart';

class CustomWidgets
{
  int? id;
  String? widgetType;
  String? question;
  int? no_Of_Options;
  Options ? options;
  //List<String>? options;

  CustomWidgets
  ({
     this.id,
     this.widgetType,
     this.question,
     this.no_Of_Options,
     this.options
  });
 
  factory CustomWidgets.fromJson(Map<String, dynamic> parsedJson) 
  {
  
  return CustomWidgets
  (
      id: parsedJson['id'],
      widgetType: parsedJson['widgetType'],
      question: parsedJson['question'],
      no_Of_Options: parsedJson['no_Of_Options'],
      options: Options.fromJson(parsedJson['options'])
      //options: List<String>.from(parsedJson['options'])
  );
}

}