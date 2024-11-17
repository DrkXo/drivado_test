class ApiConstants {
  ApiConstants._instance();

  static final _singleton = ApiConstants._instance();

  factory ApiConstants() => _singleton;

  final String baseUrl = 'https://673736a9aafa2ef222330e54.mockapi.io/';
}
