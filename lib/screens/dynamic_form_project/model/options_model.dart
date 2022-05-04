class Options
{
  String? option_value;
  Options({this.option_value});

  factory Options.fromJson(Map<String,dynamic>jsonData)
  {
    return Options
    (
      option_value: jsonData['value']
    );
    
  }
}