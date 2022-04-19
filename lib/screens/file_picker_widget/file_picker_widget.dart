
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PickAnyFile extends StatefulWidget 
{
  const PickAnyFile({ Key? key }) : super(key: key);

  @override
  State<PickAnyFile> createState() => _PickAnyFileState();
}

class _PickAnyFileState extends State<PickAnyFile> 
{
  File? pdfFile;
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
       appBar: AppBar
       (
         title: Text('File Picker Demo'),
       ),
       body:Column
       (
         children: 
         [
           Center
           (
             child: Text(pdfFile.toString()),
           ),
           Center
           (
              child: ElevatedButton
              (
                onPressed:() async
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
                        pdfFile = File(path!);
                          
                     });
                   }
                  
                }, 
                child: Text('Select File')
              ),
           ),
         ],
       )
    );
  }

 
}