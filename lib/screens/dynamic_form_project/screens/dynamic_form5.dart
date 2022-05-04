import 'package:demo_flutter_calender_application_1/custom_widgets/custom_form_textField.dart';
import 'package:demo_flutter_calender_application_1/db_services/read_json_data.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/List_of_objects/list_of_radio_button_objects.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/custom_widgets/custom_form_field.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/model/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DynamicForm5Page extends StatefulWidget 
{
  const DynamicForm5Page({ Key? key }) : super(key: key);

  @override
  State<DynamicForm5Page> createState() => _DynamicForm5PageState();
}

class _DynamicForm5PageState extends State<DynamicForm5Page> 
{

  Map<String,dynamic> formMapData =  new Map();
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
            future: readDynamicFormJsonData(context),
            builder: (context,AsyncSnapshot snapshot)
            {
              if(snapshot.hasError)
              {
                print(snapshot.error.toString());
              }
              if(snapshot.data!=null)
              {
                List widgetList2 = snapshot.data!;
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
                            ListView.builder
                            (
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widgetList2.length,
                              itemBuilder:(context,index)
                              {
                                return _buildWidgets
                                (
                                  widgetList2[index]['id'],
                                  widgetList2[index]['unique_key'],
                                  widgetList2[index]['widgetType'],
                                  widgetList2[index]['question'],
                                  widgetList2[index]['no_Of_Options'],
                                  widgetList2[index]['options'],
                                  index,
                                  context
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
                                   formMapData = _formKey.currentState!.value;
                                   print(formMapData);
                                   print(formMapData['checkBox2_Answer']);
                                  //print(_formKey.currentState!.value);
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
  
  Widget _buildWidgets
  (
    id,
    uniqueKey,
    widgetType,
    question,
    no_Of_Options,
    options,
    index,
    BuildContext context
  )
  {
    if(widgetType =='TextField')
    {
     
     return _buildTextField(question,index,uniqueKey);
    
      //return Center(child: Text(' Return TextFiled Widget'));
      //print('Return TextField');
    }
    else if(widgetType =='RadioButton')
    {
    
      return _buildRadioButton(id,uniqueKey,question,options);
      //return Center(child: Text(' Return RadioButton Widget'));
    }
    else if( widgetType =='CheckBox')
    {
      return _buildMultiChoiceOptionsWidget(uniqueKey, question,options);
      //return Center(child: Text('Return CheckBox Widget'));
      //print("Return CheckBox Widget");
    }
    else if(widgetType =='UploadFile')
    {
      return _buildFileUpload(context,uniqueKey);
       //return Center(child: Text(' Return Upload Widget'));
      
    }
    else
    {
       return _buildDatePicker(context,uniqueKey);
       //return Center(child: Text(' Return datePicker Widget'));
    }
   
  }

  
  Widget _buildTextField(String question,index,uniqueKey)
  {
  
    return Column
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
          nameKey:uniqueKey, 
          userDefineHintText:'Enter your response',
          userDefineValidator: FormBuilderValidators.required
          (
            errorText: 'Field can not be empty'
          ) 
        )
      ]
    );
  }

 Widget _buildRadioButton(id,uniqueKey,question,options)
 {
    
    return Column
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
              name: uniqueKey,
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
                
                    '${options[i]['option_value']}'
                
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
    );
 }
 Widget _buildMultiChoiceOptionsWidget(uniqueKey,question,options)
 {
   return Column
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
           name: uniqueKey,
           orientation: OptionsOrientation.vertical, 
           options:
           [
             for(int i=0;i<options.length;i++)
                '${options[i]['option_value']}'
                
           ].map((e) => FormBuilderFieldOption(value: e)).toList(growable:true),
              
           
         ),
        
      ]
    );

 }

  Widget _buildFileUpload(context,uniqueKey)
  {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container
      (
        height: 150,
        child: FormBuilderFilePicker
        (
        name:uniqueKey,
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



 Widget  _buildDatePicker(context,uniqueKey)
 {
   return Column
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
         name:uniqueKey,
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
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )
              ),
         
       ),
        
     ],
   );
 }
}
