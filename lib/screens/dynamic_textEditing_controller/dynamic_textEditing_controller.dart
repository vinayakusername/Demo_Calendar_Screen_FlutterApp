import 'dart:convert';

import 'package:flutter/material.dart';

class DynamicTextEditingController extends StatefulWidget 
{
  const DynamicTextEditingController({ Key? key }) : super(key: key);

  @override
  State<DynamicTextEditingController> createState() => _DynamicTextEditingControllerState();
}

class _DynamicTextEditingControllerState extends State<DynamicTextEditingController> 
{

  int _count=0;
  String result = '';
  List<Map<String,dynamic>> _values = [];



  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();
    _count = 0;
    _values =[];
    result = '';
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Dynamic Form Demo'),
        actions: 
        [
          IconButton
          (
            onPressed:() async
            {
               setState(() 
               {
                _count++;
               });
            }, 
            icon: Icon(Icons.add)
          ),
          IconButton
          (
            onPressed:()
            {
              setState(() 
              {
                 _count =0;
                 result ='';  
              });
            }, 
            icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: Container
      (
        padding: EdgeInsets.all(20),
        child: Column
        (
          children: 
          [
            Flexible
            (
              child: ListView.builder
            (
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context,index)
              {
                  return _row(index);
              }
            ),
            ),
            SizedBox(height: 10,),
            Text(result),
          ],
        ),
      ),
    );
  }

  _row(int index_Key)
  {
    return Row
    (
       children: 
       [
         Text('ID :${index_Key}'),
         SizedBox(width: 30,),
         Expanded
         (
           child: TextFormField
                 (
                  onChanged: (val)
                  {
                     _onUpdate(index_Key,val);
                  },
                 )
         ),
         
       ],
    );
  }

  _onUpdate(int index_key,String val)
  {
    int foundKey =-1;
    for(var map in _values)
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
      _values.removeWhere((map)
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

    _values.add(json);

    setState(() 
    {
      //result = _values.toString();
        result = prettyPrintJson(_values);
    });
  }

  String prettyPrintJson(jsonObject)
  {
    var encoder = JsonEncoder.withIndent(' ');
    return encoder.convert(jsonObject);
  }
}