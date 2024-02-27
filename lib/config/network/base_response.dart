class BaseResponse {
  int? statusCode;
  dynamic body;
  Map<String, String>? headers;

  BaseResponse({this.statusCode, this.body, this.headers});
}
