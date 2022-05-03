import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget CustomFormTextField
({
  required String nameKey,
  TextEditingController? textEditingController,
  String? userDefineLabelText,
  int? userDefineMaxLength,
  required String userDefineHintText,
  TextInputType? userDefineKeyboardType,
  TextInputAction? userDefineInputAction,
  String? Function(String?)? userDefineValidator,
  EdgeInsetsGeometry? userDefineContentPadding

})
{
  return FormBuilderTextField
          (
            name: nameKey,
            controller: textEditingController,
            keyboardType: userDefineKeyboardType,
            textInputAction: userDefineInputAction,
            cursorColor:  Colors.grey ,
            maxLength: userDefineMaxLength,
            decoration: InputDecoration
            (
              // label:Text(userDefineLabelText!),
              // labelStyle: TextStyle
              // (
              //   color: Colors.grey
              // ),
              hintText:userDefineHintText,
              contentPadding: userDefineContentPadding,
              enabledBorder: OutlineInputBorder
              (
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide
                (
                  color:Colors.grey
                )
              ),
              focusedBorder: OutlineInputBorder
              (
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide
                (
                  color: Colors.grey
                )
              ),
              errorBorder: OutlineInputBorder
              (
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide
                (
                  color: Colors.red
                )
              ),
              focusedErrorBorder: OutlineInputBorder
              (
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide
                (
                  color: Colors.red,
                  //width: 2
                )
              ),
            ),
            validator: userDefineValidator,
            // validator:FormBuilderValidators.required
            // (
            //   errorText: 'Field Can not be empty'
            // ) ,
          );
 }