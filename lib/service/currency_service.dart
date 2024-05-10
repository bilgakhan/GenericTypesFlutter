import 'package:app1/core/config/network_config.dart';
import 'package:app1/core/consts/links.dart';
import 'package:app1/model/aloqa_model.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  static Future<NetworkResponseConfig> getAloqaCurrency() async {
    try {
      Response response = await Dio().get(AppLinks.aloqaUrl);
      if (response.statusCode == 200) {
        return NetworkSuccessResponse(
          (response.data as List).map((e) => AloqaModel.fromJson(e)).toList(),
        );
      } else {
        return NetworkErrorResponse(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return NetworkExceptionResponse(e);
    }
  }
}
