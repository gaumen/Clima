import 'package:http/http.dart' as http; //TO PREVENT CONFUSION 
import 'dart:convert';
class NetworkHelper{
  final url;
  NetworkHelper({this.url});

  Future getData() async{
     http.Response response=await http.get(url);
      if(response.statusCode==200){
        String data=response.body;
        return jsonDecode(data);
      }
      else{
      print(response.statusCode);
      return null;
    }
  }
}