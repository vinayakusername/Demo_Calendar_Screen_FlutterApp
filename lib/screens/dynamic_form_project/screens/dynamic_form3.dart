import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class DynamicFormPage3 extends StatefulWidget 
{
  const DynamicFormPage3({ Key? key }) : super(key: key);

  @override
  State<DynamicFormPage3> createState() => _DynamicFormPage3State();
}

class _DynamicFormPage3State extends State<DynamicFormPage3> 
{

  int id = -1;
  
  List selectdata = List<String>.empty(growable: true);
  List radiodata = List<String>.empty(growable: true);

  var url = Uri.parse('https://stoplight.io/mocks/khurramsoftware/data/20414976/getdata');

  fetchApiData() async
  {
    final response = await get(url);
    if(response.statusCode == 200)
    {
      final responseBody = jsonDecode(response.body);
      return responseBody;
    }
    else
    {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: SingleChildScrollView
      (
        child: FutureBuilder
        (
          future: fetchApiData(),
          builder: (context,AsyncSnapshot snapshot)
          {
            if(snapshot.hasError)
            {
              return Container
              (
                child: Text(snapshot.error.toString()),
              );
            }
            if(snapshot.data!=null)
            {
              return Column
              (
                children: 
                [
                  SizedBox
                  (
                    height: 40,
                  ),
                  Container
                  (
                    height: 120,
                    child: CircleAvatar
                    (
                      radius: 80,
                      backgroundImage: NetworkImage
                      (
                        snapshot.data['image_url']
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(snapshot.data['service_name']),
                  SizedBox(height: 5,),
                  ListView.builder
                  (
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder:(context,index)
                    {
                      //return Container();
                       return _row
                       (
                         index,
                         snapshot.data!['fields'][index]["name"],
                         snapshot.data!['fields'][index]["type"],
                         snapshot.data!['fields'][index]["id"],
                         snapshot.data!['fields'][index]["options"]
                       );
                    }
                  )
                ],
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

 // dynamic row
  _row(int index, name,field_type,id,field_data)
  {
    var _mySelection;
    field_type=="select"?selectdata=field_data:selectdata;
    field_type=="radio"?radiodata=field_data:radiodata;
    if(field_type=="select")
    {
      return Container
      (
        padding: const EdgeInsets.fromLTRB(28, 15, 28, 28),
        child: InputDecorator(
            decoration: InputDecoration(
              labelText: name,focusColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrangeAccent),
                borderRadius:  BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide:  BorderSide(
                    color: Colors.deepOrangeAccent
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrangeAccent),
                borderRadius:  BorderRadius.circular(20.0),
              ),
            ),
            child:Center(
                child:  DropdownButton(
                  style: TextStyle(
                      color: Colors.deepOrangeAccent
                  ),
                  autofocus: true,
                  hint: Text(
                      "Select "+name
                  ),
                  items: selectdata.map((t) 
                  {
                    return DropdownMenuItem
                    (

                      child: Text(t["text"]),
                      value: t["value"],
                    );
                  }).toList(),
                  onChanged: (newVal) {

                    _mySelection = newVal ;
                    print(_mySelection);
                    setState(() {

                    });
                  },
                  value: _mySelection,
                ))
        ),
      );
    }
    else if(field_type=="radio"){

      return Container(

        padding: const EdgeInsets.fromLTRB(28, 15, 28, 28),
        child: InputDecorator(

          decoration: InputDecoration(
            labelText: name,fillColor: Colors.blue,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: new BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide:  BorderSide(
                  color: Colors.deepOrangeAccent
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
          child:  Column(
            children:
            radiodata.map
            ((data) 
            {
              var inde = radiodata.indexOf(data);
              return RadioListTile<dynamic>
              (
                title: Text("${data["text"]}"),
                value: id, 
                groupValue: inde,
                activeColor: Colors.lightBlue,
                autofocus: true, 
                onChanged: (val)
                {
                   setState(() {
                    print(inde);
                    id = inde;
                  });
                }
                );
              }
            ).toList()
              // return RadioListTile
              // (
              //   title: Text("${data["text"]}"),
              //   groupValue: inde,
              //   // toggleable: true,
              //   // controlAffinity: ListTileControlAffinity.leading,
              //   activeColor: Colors.lightBlue,
              //   autofocus: true,
              //   value: id,

              //   onChanged: (val) {
              //     setState(() {
              //       print(inde);
              //       id = inde;
              //     });
              //   },
              // );}).toList(),
          ),
        ),


      );
    }
    
    else{
      return  Padding(
        padding: const EdgeInsets.fromLTRB(28, 15, 28, 28),
        child: TextFormField(
          keyboardType:  field_type=="number"&&id=="amount"?TextInputType.numberWithOptions(decimal: true):field_type=="text"?TextInputType.text:TextInputType.phone,
          // inputFormatters: [
          //   field_type=="number"&&id=="amount"?FilteringTextInputFormatter.allow
          //                                                                  (
          //                                                                    RegExp
          //                                                                    ("[. 0-9]")
          //                                                                    ):
          //                                                                    field_type=="text"?
          //                                                                     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú 0-9]")):
          //                                                                     FilteringTextInputFormatter.digitsOnly,
          // ],
          decoration:  InputDecoration(
            labelText: name,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: new BorderRadius.circular(10.0),
            ),
            border:  OutlineInputBorder(

              borderRadius:  BorderRadius.circular(10.0),
              borderSide:  BorderSide(
                  color: Colors.deepOrangeAccent
              ),
            ),
            labelStyle: TextStyle(


            ),


          ),
          onChanged: (val){
          },
        ),
      );
    }
  }
}