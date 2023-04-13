import 'package:dio/dio.dart';

import '../constants/constant_text.dart';

class CustomDioMixin {
  final capitalService =
      Dio(BaseOptions(baseUrl: ConstantText.baseUrlOfCapitals));
  final weatherServive = Dio(
    BaseOptions(baseUrl: ConstantText.baseUrlOfWeather),
  );
}
