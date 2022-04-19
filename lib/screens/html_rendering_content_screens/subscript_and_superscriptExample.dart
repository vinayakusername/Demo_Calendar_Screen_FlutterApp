import 'dart:ui';
import 'package:flutter/material.dart';

class DisplaySubAndSuperScript extends StatelessWidget 
{
  const DisplaySubAndSuperScript({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Demo of Subscript and SuperScript in Flutter'),
        centerTitle: true,
      ),
      
      //body: _buildRichTextSpan()
      body: _buildWrapWidget(),
    );

  }

   Widget _buildRichTextSpan()
   {
     return Padding(
          padding: EdgeInsets.all(30),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Acid Sulfuric: ',
                  style: TextStyle(color: Colors.purple, fontSize: 30)),
              TextSpan(
                  text: 'H',
                  style: TextStyle(color: Colors.purple, fontSize: 30)),
              TextSpan(
                  text: '2',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 10,
                      fontFeatures: [FontFeature.subscripts()])),
              TextSpan(
                text: 'S',
                style: TextStyle(color: Colors.purple, fontSize: 30),
              ),
              TextSpan(
                text: 'O',
                style: TextStyle(color: Colors.purple, fontSize: 30),
              ),
              TextSpan(
                text: '4',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 10,
                    fontFeatures: [FontFeature.subscripts()]),
              ),
            ]),
          ),
        );
   }

   /*
    wrap() widget will not give you overflow error when children widgets are added it will adjust acccording to it.
    whereas row() and column() widget will give you overflow error when widgets are not fitted in it.
    */
  Widget _buildWrapWidget()
  {
    return Padding
    (
      padding: const EdgeInsets.all(8.0),
      child: Center
      (
        child: Wrap
        (
            direction: Axis.horizontal,
            children: 
            [
               Text
               (
                 'x',
                 style: TextStyle(color: Colors.purple, fontSize: 30),
               ),
               Text
               (
                 '2',
                 style: TextStyle
                 (
                   fontSize: 10,
                   fontWeight: FontWeight.bold,
                   fontFeatures: [FontFeature.superscripts()]
                 ),
               ),
               Text
               (
                 '+',
                 style: TextStyle(color: Colors.purple, fontSize: 30),
               ),
               Text
               (
                 'y',
                 style: TextStyle(color: Colors.purple, fontSize: 30),
               ),
               Text(
                      '5',
                      style: TextStyle
                      (
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.superscripts()]
                      ),
                    ),
                Text
                (
                  ' + ',
                  style: TextStyle(color: Colors.purple, fontSize: 30),
                ),
                Text
                (
                  'z',
                  style: TextStyle(color: Colors.purple, fontSize: 30),
                ),
                Text(
                      'n',
                      style: TextStyle
                      (
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.superscripts()]
                      ),
                    ),

            ],
        ),
      ),
    );
  }

}