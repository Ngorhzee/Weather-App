import 'dart:convert';

import 'package:http/http.dart'as http;
class NetworkHelper{
NetworkHelper(this.url);
 final String url;
Future getData()async{
 http.Response response =await http.get(Uri.parse(url));
 var data=jsonDecode(response.body);
 return data;
}
}