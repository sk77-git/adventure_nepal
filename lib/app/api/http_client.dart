import 'package:http_interceptor/http/intercepted_client.dart';

import 'logging_interceptor.dart';

///This class is uses http library to connect to the internet for data communication
class MyHttpClient {
  static final client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    /*interceptors: [],*/
    requestTimeout: const Duration(seconds: 60),
  );
}
