import 'package:custom_check_box/custom_check_box.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/List_of_objects/list_of_radio_button_objects.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/custom_widgets/custom_form_field.dart';
import 'package:demo_flutter_calender_application_1/screens/dynamic_form_project/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class DynamicFormPage extends StatefulWidget 
{
  const DynamicFormPage({ Key? key }) : super(key: key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> 
{
   /*
    ListOfController 
    * 
    */
  final TextEditingController _userResponseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userResponse = '';
  bool shouldCheck = false;
  bool shouldCheckDefault = false;
  String? _groupValue;
  DateTime? _selectedDate;

  
  void _presentDatePicker() 
  {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker
    (
            context: context,
            initialDate: DateTime.now(),
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
        title: Text('Demo of Dynamic Form'),
      ),
      body:SingleChildScrollView
      (
        scrollDirection: Axis.vertical,
        child: Form
        (
          key: _formKey,
          child:Column
          (
             children: 
             [
               _buildTextField('What is your name'),
               SizedBox(height: 5,),
               _buildRadioButton(RadioButtonObjectList.radioButtonQuestions,context),
               SizedBox(height: 5,),
               _buildCheckBoxes('Check Box Demo'),
               SizedBox(height: 5.0,),
               _buildFileUpload(),
               SizedBox(height: 10,),
                _buildDatePicker(context),
               SizedBox(height: 10,),
               ElevatedButton
               (
                 onPressed: ()
                 {
                   if(_formKey.currentState!.validate())
                   {
                     print(_userResponseController.text);
                     print(_groupValue);
                     print(DateTime.now());
                   }
                   _userResponseController.text = '';
                 }, 
                 child: Text('Submit')
               )
             ],
          )
        ),
      )
    );
  }

  Widget _buildTextField(String question,/*String questionId*/)
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
          child: CustomFormField
          (
            controller: _userResponseController, 
            keyboardType: TextInputType.text, 
            inputAction: TextInputAction.done, 
            label: 'name', 
            //hint: 'Enter your name', 
            validator: (value) =>  value.isEmpty? 'TextField can not be Empty': null
           
          ),
        )
      ],
    );
  }

  Widget _buildRadioButton(List radioButtonQuestions,BuildContext context)
  {
    return ListView.builder
    (
      itemCount: radioButtonQuestions.length,
      itemBuilder: (context,index)
      {
         return Column
    (
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text
            (
              radioButtonQuestions[index]['question'],
              style: TextStyle
              (
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          // SizedBox(height: 10,),
          // CustomRadioButton<String>
          // (
          //   value: '1',
          //   groupValue: _groupValue,
          //   onChanged: _valueChangedHandler(),
          //   label: '1',
          //   text: radioButtonQuestions[index]['options'][0],
          // ),
          
        ],
    );
      }
    );
    /*
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
          CustomRadioButton<String>(
            value: '1',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '1',
            text: 'Phone Gap',
          ),
          CustomRadioButton<String>(
            value: '2',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '2',
            text: 'Appcelerator',
          ),
          CustomRadioButton<String>(
            value: '3',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '3',
            text: 'React Native',
          ),
          CustomRadioButton<String>(
            value: '4',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '4',
            text: 'Native Script',
          ),
          CustomRadioButton<String>(
            value: '5',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: '5',
            text: 'Flutter',
          ),
        ],
    );*/
  }

  Widget _buildCheckBoxes(String question)
  {
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
        Row
        (
          children: 
          [
            CustomCheckBox
            (
              value: shouldCheck,
              shouldShowBorder: true,
              borderColor: Colors.red,
              checkedFillColor: Colors.red,
              borderRadius: 5,
              borderWidth: 1,
              checkBoxSize: 18,
              onChanged: (val) {
                //do your stuff here
                setState(() {
                  shouldCheck = val;
                });
              },
            ),
            SizedBox(width: 10,),
             Text(
              'Customized Check Box',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            

          ],
          
          ),
        Row
        (
          children: 
          [
            CustomCheckBox(
              value: shouldCheckDefault,
              splashColor: Colors.red.withOpacity(0.4),
              tooltip: 'Custom Check Box',
              splashRadius: 40,
              onChanged: (val) {
                //do your stuff here
                setState(() {
                  shouldCheckDefault = val;
                });
              },
            ),
            SizedBox(width: 10,),
            Text(
              'Default Check Box',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            
          ],
        )
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
               ElevatedButton
               (
                 onPressed:()
                 {
                   //add functionality to upload file from device.
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

    return Column
    (
      children: 
      [
        // display the selected date
        Container
        (
          padding: const EdgeInsets.all(30),
          child: Text
          (
            _selectedDate != null ? _selectedDate.toString() : 'No Date Selected!',
            style: const TextStyle(fontSize: 30),
          ),
        ),
         // Show the Date Picker when this button clicked
        ElevatedButton
        (
          onPressed: _presentDatePicker, 
          child: const Text('Select Date')
        ),
      ]);
   
  }
}