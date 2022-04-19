import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/List_of_objects/list_of_radio_button_objects.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
class DynamicFormPage1 extends StatefulWidget 
{
  const DynamicFormPage1({ Key? key }) : super(key: key);

  @override
  State<DynamicFormPage1> createState() => _DynamicFormPage1State();
}

class _DynamicFormPage1State extends State<DynamicFormPage1> 
{
   String? _groupValue;

  //function to update the value of radio button
  ValueChanged<String?> _valueChangedHandler() 
  {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Demo Dynamic Page2'),
      ),
      body: Container
      (
        child: _buildRadioButton(RadioButtonObjectList.radioButtonQuestions, context),
      )
    );
  }
 
   renderRadioButton(options)
   {
    return Column
    (
      children:options.map((option) => 
      Flexible
      (
       child:  CustomRadioButton<String>
          (
            value: '1',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '1',
            text: option,
          ),
    )
    ).toList()
    );
  
   }

  Widget _buildRadioButton(List radioButtonQuestions,BuildContext context)
  {
       return ListView.builder
       (
      itemCount: radioButtonQuestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: 
            [
              Text(radioButtonQuestions[index]['question']),
              //renderRadioButton(radioButtonQuestions[index]['options'])
              
            ],
          ),
        );
      },
    );
  
  }
}