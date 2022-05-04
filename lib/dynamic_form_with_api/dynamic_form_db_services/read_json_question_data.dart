
import 'dart:convert';
import 'package:demo_flutter_calender_application_1/dynamic_form_with_api/dynamic_form_model/question_model.dart';
import 'package:http/http.dart';



//This class allows us to fetch the data from http api and then return a list of articles.
class ApiService
{
  
   final endPointUrl = "http://test.sanjivsirdeoghar.com/api/getQuestionByProgram";

  Future<QuestionData> fetchQuestions() async 
  {
     final response = await post
                           (
                             Uri.parse(endPointUrl),
                             body: 
                             {
                               "program_id":'2'
                             },
                             
                           );

   print(response.body);
   var data = jsonDecode(response.body.toString());
  
  if (response.statusCode == 200) 
  {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(QuestionData.fromJson(data).data![0].programName);
    return QuestionData.fromJson(jsonDecode(response.body));
  } 

   else
   {
     throw("Can't get question Data");
   }

  }
  }