import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import '../config/server_url.dart';


Future postRequest(String url, {formdata}) async{
  try{
    Dio dio = new Dio();
    Response response ;
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();
    if (formdata == null) {
          response = await dio.post(servicePath[url]);
    } else {
          response = await dio.post(servicePath[url],data: formdata);
    }
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print(e);
  }
}

Future getHomePageContent() async{
  try{
    Dio dio = new Dio();
    Response response ;
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();
    var formData = {'lon':'116.31027221679688','lat':'40.10198233557799'};
    response = await dio.post(servicePath['homePageContent'],data: formData);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print(e);
  }
}


Future getHomePageBlowContent(int page) async{
  try{
    Dio dio = new Dio();
    Response response ;
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();
    var formData = {'page':page,};
    response = await dio.post(servicePath['homePageBlowConten'],data: formData);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print(e);
  }
}