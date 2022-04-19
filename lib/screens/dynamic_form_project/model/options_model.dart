class Options
{
  String? value;
  Options({this.value});

  factory Options.fromJson(Map<String,dynamic>jsonData)
  {
    return Options
    (
      value: jsonData['value']
    );
    
  }
}