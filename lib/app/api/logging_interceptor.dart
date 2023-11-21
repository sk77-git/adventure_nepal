import 'dart:developer';

import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

///This class is used to log all the http methods
class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST[${data.method}] => PATH: ${data.url}');
    print('=> HEADERS: ${data.headers}');
    print('=> BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE[${data.statusCode}] => PATH: ${data.url}');
    log('=> BODY:${data.body}');
    return data;
  }
}
