import 'api_base_url.dart';

class EndPoints {
  EndPoints._();

  static const String login = "${ApiBaseUrl.loginBaseUrl}login";
  static const String authToken = "${ApiBaseUrl.tokenUrl}token";
}
