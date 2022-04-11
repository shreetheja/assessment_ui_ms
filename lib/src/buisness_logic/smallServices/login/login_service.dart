import 'dart:convert';

import 'package:assesment_ui/src/buisness_logic/data/models/api-response.dart';
import 'package:assesment_ui/src/buisness_logic/data/models/loginData/login_model.dart';
import 'package:assesment_ui/src/buisness_logic/resources/api_info.dart';
import 'package:http/http.dart' as http;
class LoginService{
    static const header = {
    'Content-Type': 'application/json',
  };
    Future<ApiResponse<LoginData>> login(String aid,String uid,String password) async {
      Uri url = Uri.https(assessment_MS, '/user/login');
      var body = {
        'a_id':aid,
        'u_id':uid,
        'password':password
      };
      http.Response res = await http.post(url,headers: header,body:jsonEncode(body));
      if(res.statusCode == 200){
        LoginData data = LoginData.fromJson(res.body);
        return ApiResponse(statusCode: res.statusCode, error:false,data:data);
      }
      else
        return ApiResponse(statusCode:res.statusCode, error: true,errorMessage: res.body);
    }

}