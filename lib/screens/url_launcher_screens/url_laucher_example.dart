import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class urlLauncherExample extends StatefulWidget 
{
  const urlLauncherExample({ Key? key }) : super(key: key);

  @override
  State<urlLauncherExample> createState() => _urlLauncherExampleState();
}

class _urlLauncherExampleState extends State<urlLauncherExample> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
       appBar: AppBar
       (
         title: Text('URL Launcher Example'),
       ),  
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column
         (
           children: 
           [
             Center
             (
               child:Link
               (
                 /*
                   LinkTarget.self will open the link in same browser and 
                   if we set it to 'LinkTarget.blank' will open it in external browser and it is default behaviour.
                  */
                 //target: LinkTarget.self,
                 target: LinkTarget.blank,
                 uri: Uri.parse('https://flutter.dev'), 
                 builder: (context,followLink) => ElevatedButton
                                (
                                  onPressed: followLink, 
                                  child: Text('Open Link')
                                )
               )
             
             ),
             SizedBox(height: 10,), 
              Center
             (
               child:Link
               (
                 /*
                   LinkTarget.self will open the link in same browser and 
                   if we set it to 'LinkTarget.blank' will open it in external browser and it is default behaviour.
                  */
                 target: LinkTarget.self,
                 //target: LinkTarget.blank,
                 uri: Uri.parse('https://appConsultio.com'), 
                 builder: (context,followLink) => MouseRegion
                 (
                   cursor: SystemMouseCursors.click,
                   child: GestureDetector
                   (
                     onTap: followLink,
                     child: Text
                     (
                       'Open Link',
                       style: TextStyle
                       (
                         color: Colors.blue,
                         fontSize: 16,
                         decoration: TextDecoration.underline
                       ),
                    ),
                   ),
                 )
               )
             
             ),
           ],
         ),
       ),
    );
  }
}