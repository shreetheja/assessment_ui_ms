class ApiResponse<T>{
  T? data;
  String? errorMessage;
  bool error;
  int statusCode;

  ApiResponse({this.data,this.errorMessage,required this.statusCode,required this.error});
}