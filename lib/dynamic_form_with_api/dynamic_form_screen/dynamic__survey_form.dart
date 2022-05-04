import 'package:demo_flutter_calender_application_1/custom_widgets/custom_form_textField.dart';
import 'package:demo_flutter_calender_application_1/dynamic_form_with_api/dynamic_form_db_services/read_json_question_data.dart';
import 'package:demo_flutter_calender_application_1/dynamic_form_with_api/dynamic_form_model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DynamicSurveyForm extends StatefulWidget 
{
  const DynamicSurveyForm({ Key? key }) : super(key: key);

  @override
  State<DynamicSurveyForm> createState() => _DynamicSurveyFormState();
}

class _DynamicSurveyFormState extends State<DynamicSurveyForm> 
{
  final _formKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      
      body: Center
      (
        child:FutureBuilder
          (
            future: ApiService().fetchQuestions(),
            builder: (context,AsyncSnapshot<QuestionData> snapshot)
            {
              if(snapshot.hasError)
              {
                print(snapshot.error.toString());
              }
              if(snapshot.data!=null)
              {
                List<Data> questionDataList2 = snapshot.data!.data!;
                return SingleChildScrollView
                (
                  scrollDirection: Axis.vertical,
                    child: FormBuilder
                    (
                      key: _formKey,
                      child: Column
                        (
                          children: 
                          [
                            //below list view builder is for data list of QuestionData
                            ListView.builder
                            (
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: questionDataList2.length,
                              itemBuilder:(context,index)
                              {
                                print(questionDataList2);
                                //below list is for question list of QuestionData 
                                return ListView.builder
                                (
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: questionDataList2[index].question!.length,
                                  itemBuilder:(context,index1)
                                  {
                                      
                                return _buildWidgets
                                (
                                  questionDataList2[index].question![index1].id,
                                  questionDataList2[index].question![index1].type,
                                  questionDataList2[index].question![index1].tagName,
                                  questionDataList2[index].question![index1].question,
                                  questionDataList2[index].question![index1].options,
                            
                                );
                                  }
                                );
                                
                              }
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton
                            (
                              onPressed:()
                              {
                                //Write code to capture and submit data
                                //print('Write code to submit form data');
                                if(_formKey.currentState!.saveAndValidate())
                                {
                                  //  formMapData = _formKey.currentState!.value;
                                  //  print(formMapData);
                                  //  print(formMapData['checkBox2_Answer']);
                                   print(_formKey.currentState!.value);
                                  _formKey.currentState!.reset();
                                }
                              
                              }, 
                              child: Text('Submit Data')
                            )
                          ],
                        ),
                    ),
                );
              }
              return Center
              (
                child: CircularProgressIndicator(),
              );
            }
          ),
        ),
    );
  }

   
  Widget _buildWidgets(id,widgetType,tagName,question,options)
  {
    if(widgetType =='Text Input')
    {
     
     return _buildTextField(id,widgetType,tagName,question);
    
      //return Center(child: Text(' Return TextFiled Widget'));
      //print('Return TextField');
    }
    else if(widgetType =='Single Choice')
    {
    
      return _buildRadioButton(id,widgetType,tagName,question,options);
      //return Center(child: Text(' Return RadioButton Widget'));
    }
    else if( widgetType =='Multiple Choice')
    {
      return _buildMultiChoiceOptionsWidget(id,widgetType,tagName, question,options);
      //return Center(child: Text('Return CheckBox Widget'));
      //print("Return CheckBox Widget");
    }
    else if(widgetType =='PDF')
    {
      return _buildFileUpload(id,widgetType);
       //return Center(child: Text(' Return Upload pdf Widget'));
      
    }
    else if(widgetType =='Yes/No')
    {
      //return _buildFileUpload(context,uniqueKey);
       return Center(child: Text(' Return Yes/no Widget'));
      
    }
    else if(widgetType =='Photo')
    {
      //return _buildFileUpload(id,widgetType);
       return Center(child: Text(' Return Photo Widget'));
      
    }
    else
    {
       return _buildDatePicker(id,widgetType);
       //return Center(child: Text(' Return datePicker Widget'));
    }
   
  }

  
  Widget _buildTextField(id,widgetType,tagName,question)
  {
  
    return Padding
    (
      padding: const EdgeInsets.all(8.0),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Padding
          (
            padding: const EdgeInsets.all(8.0),
            child: Text
            (
              question,
              style: const TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 5,),
          CustomFormTextField
          (
            nameKey:widgetType+" Widget No "+id.toString(), 
            userDefineHintText:'Enter your response',
            userDefineValidator: FormBuilderValidators.required
            (
              errorText: 'Field can not be empty'
            ) 
          )
        ]
      ),
    );
  }

 Widget _buildRadioButton(id,widgetType,tagName,question,options)
 {
    
    return Padding
    (
      padding: const EdgeInsets.all(8.0),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Padding
          (
            padding: const EdgeInsets.all(8.0),
            child: Text
            (
              question,
              style: const TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 5,),
          FormBuilderRadioGroup
              (
                name:widgetType+" Widget No "+id.toString(),
                decoration: InputDecoration
                (
                  enabledBorder: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide
                    (
                      //color:MyColors.primaryCardBorderColor
                      color: Colors.grey
                    )
                  ),
                  errorBorder: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide
                    (
                      color: Colors.red,
                      //width: 2.0
                    )
                  ),

                ), 
                orientation: OptionsOrientation.vertical,
                options: 
                [
                  for(int i=0;i<options.length;i++)
                  
                      '${options[i]}'
                  
                ].map((e) => FormBuilderFieldOption(value: e)).toList(growable:true),
                validator:FormBuilderValidators.required
                  (
                    errorText: 'Field can not be empty'
                  ),
                onChanged: (val)
                {
                  //print(val);
                },
                
              )
        ]
      ),
    );
 }

 Widget _buildMultiChoiceOptionsWidget(id,widgetType,tagName,question,options)
 {
   return Padding
   (
     padding: const EdgeInsets.all(8.0),
     child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          Text
          (
            question,
            style: const TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
          ),
          
           SizedBox(height: 10,),
           FormBuilderCheckboxGroup
           (
             name:widgetType+" Widget No "+id.toString(),
             decoration: InputDecoration
             (
               enabledBorder: OutlineInputBorder
               (
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide
                 (
                   color: Colors.grey
                 )
               )
             ),
             orientation: OptionsOrientation.vertical, 
             options:
             [
               for(int i=0;i<options.length;i++)
                  '${options[i]}'
                  
             ].map((e) => FormBuilderFieldOption(value: e)).toList(growable:true),
                
             
           ),
          
        ]
      ),
   );

 }
 
  Widget _buildFileUpload(id,widgetType)
  {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container
      (
        height: 150,
        child: FormBuilderFilePicker
        (
        name:widgetType+" Widget No "+id.toString(),
        decoration: InputDecoration
        (
          labelText: "Attachments",
          labelStyle: TextStyle
          (
            color:Colors.grey
          ),
          enabledBorder: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide
                      (
                        //color:MyColors.primaryCardBorderColor
                        color: Colors.grey
                      )
                    ),
          focusedBorder: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide
                      (
                        //color: MyColors.primaryCardBorderColor
                        color:Colors.grey
                      )
                    ),
        ),
        maxFiles: null,
        previewImages: true,
        onChanged: (val) => print(val),
        selector: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Icon(Icons.file_upload),
            Text('Upload'),
          ],
        ),
        onFileLoading: (val) 
        {
          print(val);
        },
  ),
      ),
    );
  }



 Widget  _buildDatePicker(id,widgetType)
 {
   return Padding
   (
     padding: const EdgeInsets.all(8.0),
     child: Column
     (
       crossAxisAlignment: CrossAxisAlignment.start,
       children: 
       [
         Text
         (
           'DOB',
            style: const TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
         ),
         SizedBox(height:10),
         FormBuilderDateTimePicker
         (
           name:widgetType+" Widget No "+id.toString(),
           firstDate: DateTime(1970),
           inputType: InputType.date,
           lastDate: DateTime(2030),
           format: DateFormat('dd-MM-yyyy'),
                //onChanged: _onChanged,
           decoration:const InputDecoration
                (
                  suffixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide
                    (
                      color: Colors.grey
                    )
                  )
                ),
           
         ),
          
       ],
     ),
   );
 }
}