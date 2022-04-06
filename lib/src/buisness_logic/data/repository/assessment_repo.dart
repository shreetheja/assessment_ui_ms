import 'dart:convert';

import 'package:assesment_ui/src/buisness_logic/data/models/api-response.dart';
import 'package:assesment_ui/src/buisness_logic/data/models/assessment_data.dart';
import 'package:assesment_ui/src/buisness_logic/resources/api_info.dart';
import 'package:http/http.dart' as http;

abstract class AssessmentRepo{
  Future<ApiResponse<AssessmentData>> login(String aId,String usn);
  Future<ApiResponse<bool>> markAnswer(String aId,String usn, int index, int answer);
   Future<ApiResponse<bool>> submit(String aId,String usn);
}

class AssessmentRepo_impl implements AssessmentRepo {
 
  static const header = {
    'Content-Type': 'application/json',
  };
  Future<ApiResponse<AssessmentData>> login(String aId,String usn) async {
    final uri = Uri.http(assessment_MS, 'loginInfo/${aId}/${usn}');
    ('aid  : ${aId} usn: ${usn}');
    http.Response resp = await http.get(uri);
    try {
      if (resp.statusCode == 200) {
        String data = resp.body;
        (data);
        Map<String,dynamic> jsonData = jsonDecode(data)['data'];
        return ApiResponse(
            data: AssessmentData.fromJson(jsonData),
            error: false,
            statusCode: 200);
      } else {
        return ApiResponse(
            error: false, errorMessage: resp.body, statusCode: resp.statusCode);
      }
    } catch (e) {
      (e.toString());
      return ApiResponse(error: true, errorMessage: 'Internal Server error', statusCode:500);
    }
  }

  Future<ApiResponse<bool>> markAnswer(String aId,String usn, int index, int answer) async {
    ('Marking Answer');
    Map<String,String> params = {"q": index.toString(), "a": answer.toString()};
    final uri = Uri.http(assessment_MS, '/markAnswer/${aId}/${usn}',params);
    (uri);
    http.Response resp = await http.get(uri);
    try {
      if (resp.statusCode == 200) {
        return ApiResponse(data: true, error: false, statusCode: 200);
      } else {
        return ApiResponse(
            error: false, statusCode: resp.statusCode, errorMessage: resp.body,data:false);
      }
    } catch (e) {
      (e);
      return ApiResponse(data: false,error: true, errorMessage: 'Internal Server error', statusCode: 200);
    }
  }

  Future<ApiResponse<bool>> submit(String aId,String usn) async {
    final uri = Uri.http(assessment_MS, '/submit/${aId}/${usn}');
    http.Response resp = await http.get(uri);
    try {
      if (resp.statusCode == 200) {
        return ApiResponse(data: false, error: false, statusCode: 200);
      } else {
        return ApiResponse(
            error: false, statusCode: resp.statusCode, errorMessage: resp.body);
      }
    } catch (e) {
      (e);
      return ApiResponse(error: true, errorMessage: 'Internal Server error', statusCode: 200);
    }
  }
}
