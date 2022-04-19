
import 'dart:convert';
import 'dart:io';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/custom_widgets/custom_form_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class DynamicFormPage4 extends StatefulWidget 
{
  const DynamicFormPage4({ Key? key }) : super(key: key);

  @override
  State<DynamicFormPage4> createState() => _DynamicFormPage4State();
}

class _DynamicFormPage4State extends State<DynamicFormPage4> 
{
 
  final TextEditingController _userResponseController = TextEditingController();
  int foundKey = -1;
  List checkBoxData = List<String>.empty(growable: true);
  List radiodata = List<String>.empty(growable: true);
  List textFieldData = [];
  String result ='';
  DateTime? _selectedDate;
  File? _pdfFile;



  Future<List> readJson(BuildContext context) async 
  {
    final String response = await rootBundle.loadString('assets/json_data/json_widget_data.json');
    final data = await json.decode(response);
    //print(data);
    
    List customWidgetList = data['widgets'];
   
    return customWidgetList;
    
  }
  
   void _presentDatePicker() 
  {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker
    (
            context: context,
            initialDatePickerMode: DatePickerMode.day,
            initialDate: DateTime.now(),//DateTime.now() this method will display current date with current time. 
            firstDate: DateTime(2000),
            lastDate: DateTime(2050)
            
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) 
      {
        return;
      }
      setState(() 
      {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });

    });
  }

  Future<void> _pickFile() async
  {
     final result = await FilePicker.platform.pickFiles
                   (
                     type: FileType.custom,//this is used to pick pdf files
                     allowedExtensions: ['pdf','doc']
                   );//this will allows to pick all types of files from device

                   if(result != null)
                   {
                     final path =  result.files.single.path;
                     setState(() 
                     {
                        _pdfFile = File(path!);
                          
                     });
                   }
  }



  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Center
      (
        child: FutureBuilder
        (
          future: readJson(context),
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
                        print('Write code to submit form data');
                        print(result);
                        
                      }, 
                      child: Text('Submit Data')
                    )
                  ],
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
  
  Widget _buildWidgets(id,widgetType,question,no_Of_Options,options,index,BuildContext context)
  {
    if(widgetType =='TextField')
    {
     
      return _buildTextField(question,index);
      
      //return Center(child: Text(' Return TextFiled Widget'));
      //print('Return TextField');
    }
    else if(widgetType =='RadioButton')
    {
       return _buildRadioButton(id,question,options);
    }
    else if( widgetType =='CheckBox')
    {
      return _buildMultiChoiceWidget(id, question,options);
      //return Center(child: Text('Return CheckBox Widget'));
      //print("Return CheckBox Widget");
    }
    else if(widgetType =='UploadFile')
    {
       return _buildFileUpload();
      
    }
    else
    {
      return _buildDatePicker(context);
    }
   
  }
/*
  _onUpdate(int index_key,String val)
  {
    for(var map in textFieldData)
    {
       if(map.containsKey('id'))
       {
         if(map['id']==index_key)
         {
           foundKey = index_key;
           break;
         }
       } 
    }

    if(-1 != foundKey)
    {
      textFieldData.removeWhere((map)
      {
         return map["id"]== foundKey;
      });
    }

    Map<String,dynamic> json = 
    {
      "id":index_key,
      "value":
      {
        "text":val
      }
    };

    textFieldData.add(json);

    setState(() 
    {
      result = textFieldData.toString();
    });
  }

*/
  Widget _buildTextField(String question,index/*String questionId*/)
  {
  
    return Column
    (
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
        Padding
        (
          padding: const EdgeInsets.all(8.0),
          child: TextFormField
          (
            keyboardType:TextInputType.text ,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration
            (
              enabledBorder: OutlineInputBorder
              (
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide
                 (
                    color: Colors.grey,
                    width: 2
                 ),
              ),
              focusedBorder: OutlineInputBorder
              (
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide
                 (
                    color: Colors.grey,
                    width: 2
                 ),
              ),
              label: Text(question),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            validator: (value) =>  value!.isEmpty? 'TextField can not be Empty': null,
            onChanged: (val)
            {
              //_onUpdate(index,val);
            },
          ),
          // child: CustomFormField
          // (
          //   controller: _userResponseController, 
          //   keyboardType: TextInputType.text, 
          //   inputAction: TextInputAction.done,
          //   //label:'answer' 
          //   label:question,
          //   //hint: question, 
          //   validator: (value) =>  value.isEmpty? 'TextField can not be Empty': null
           
          // ),
        )
      ],
    );
  }

  Widget _buildRadioButton(id,question, optionsData)
  {
    radiodata = optionsData;
    return Column
    (
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text
            (
              question,
              style: TextStyle
              (
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 10,),
           Column(
            children:
            radiodata.map
            ((data) 
            {
              var inde = radiodata.indexOf(data);
              var selected_value = radiodata.elementAt(inde); 

              return RadioListTile<dynamic>
              (
                title: Text("${data["text"]}"),
                value: id, 
                groupValue:inde,
                activeColor: Colors.lightBlue,
                //autofocus: true,//whether option should be selected initially or not. 
                autofocus: false,
                onChanged: (val)
                {
                 
                   setState(() 
                   { 
                    print(val); 
                    print(inde);
                    print(selected_value);
                    id = inde;
                    
                  });
                }
                );
              }
            ).toList()
             
          ),
        ],
    );   
  }

  Widget _buildMultiChoiceWidget(id, question,optionsData)
  {
    checkBoxData = optionsData;
    bool _value = false;
    return Column
    (
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
           Column(
            children:
            checkBoxData.map
            ((data) 
            {
              var inde = checkBoxData.indexOf(data);
              return CheckboxListTile
              (
                title: Text("${data["text"]}"),
                value: _value,
                selected: _value,
                activeColor: Colors.green,
                checkColor: Colors.white,
                autofocus: false, 
                onChanged: (val)
                {
                  setState(() 
                  {
                    _value = val!;
                    id =inde;
                    print(id);
                    print(_value);  
                  });
                 
                }
              );
              
              }
            ).toList()
             
          ),
      ],
    );
  }

   Widget _buildFileUpload()
  {
    return Padding
    (
      padding: const EdgeInsets.all(8.0),
      child: Container
      (
         width: MediaQuery.of(context).size.width,
         height: 200,
         decoration: BoxDecoration
         (
           border: Border.all
           (
             color: Colors.grey,
             width: 1.5
           ),
           borderRadius: BorderRadius.circular(8)
         ),
         child: Padding
         (
           padding: const EdgeInsets.only(top: 80),
           child: Column
           (
             crossAxisAlignment: CrossAxisAlignment.center,
             children: 
             [
               Text
               (
                 'Upload your file',
                 textAlign: TextAlign.center,
                 style: TextStyle
                 (
                   fontSize: 12,
                   color: Colors.grey
                 ),
               ),
               SizedBox(height: 10,),
               Text
               (
                 _pdfFile!=null ? _pdfFile!.path : '',
                 textAlign: TextAlign.center,
                 style: TextStyle
                 (
                   fontSize: 10,
                   color: Colors.grey
                 ),
               ),
               SizedBox(height: 10,),
               ElevatedButton
               (
                 onPressed:()
                 {
                   //add functionality to upload file from device.
                   _pickFile();
                 }, 
                 child: Text('Upload')
               )
             ],
           ),
         ),
      ),
    );
  }

  
  Widget _buildDatePicker(BuildContext context)
  {

    return Padding
    (
      padding: const EdgeInsets.all(8.0),
      child: Container
      (
         width: MediaQuery.of(context).size.width,
         height: 150,
         decoration: BoxDecoration
         (
           border: Border.all
           (
             color: Colors.grey,
             width: 1.5
           ),
           borderRadius: BorderRadius.circular(8)
         ),
        child: Column
        (
          children: 
          [
            // display the selected date
            Container
            (
              padding: const EdgeInsets.all(30),
              child: Text
              (
                //_selectedDate != null ? _selectedDate.toString() : 'No Date Selected!',//this statement will display date with current time.
                /*
                 Below given statement will display only date. 
                */
                _selectedDate!=null? DateFormat('dd-MM-yyyy').format(_selectedDate!):'No Date Selected',
                style: const TextStyle(fontSize: 25),
              ),
            ),
             // Show the Date Picker when this button clicked
            ElevatedButton
            (
              onPressed: _presentDatePicker, 
              child: const Text('Select Date')
            ),
          ]),
      ),
    );
   
  }
}