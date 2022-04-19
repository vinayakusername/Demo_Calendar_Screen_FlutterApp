import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderHomeScreen extends StatefulWidget 
{
  const CalenderHomeScreen({ Key? key }) : super(key: key);

  @override
  State<CalenderHomeScreen> createState() => _CalenderHomeScreenState();
}

class _CalenderHomeScreenState extends State<CalenderHomeScreen> 
{
  
  String? dropdownvalue = 'en_US';
  var items =  ['en_US','pl_PL','fr_FR','zh_CN','hi_IN','mr_IN'];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Calendar App'),
      ),
      drawer: Drawer
      (
         child: ListView
         (
           // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: 
          [
           const DrawerHeader
           (
            decoration: BoxDecoration
            (
              color: Colors.blue,
            ),
           child: Text('Drawer Header'),
           ),
          ListTile
          (
            title: const Text('Item 1'),
            leading: Icon(Icons.access_alarm),
            onTap: () 
            {
                // Update the state of the app.
                  // ...
            },
          ),
        ListTile
        (
         leading: Icon(Icons.account_balance_wallet_rounded),
         title: const Text('Item 2'),
         onTap: () 
         {
          // Update the state of the app.
          // ...
         },
        ),
         ListTile
        (
         leading: Icon(Icons.wifi),
         title: const Text('Languages'),
         onTap:()=>  _buildDropDownList()
         ),
      ],
     ),
    ),
    body: TableCalendar
    (
      focusedDay: DateTime.now(), 
      firstDay: DateTime.utc(2022), 
      lastDay: DateTime.utc(2030),
      locale: dropdownvalue,
    ),
  );
  }

  

  Widget _buildDropDownList()
  {
    return  Container
    (
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              DropdownButton
              (
                value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) 
                  {
                       return DropdownMenuItem
                       (
                           value: items,
                           child: Text(items)
                       );
                  }
                  ).toList(),
                  onChanged:(String? newValue)
                  {
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  }
               
              ),
            ],
          ),
        ),
      );
  }
}