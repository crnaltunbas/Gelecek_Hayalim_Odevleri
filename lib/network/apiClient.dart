import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  final String baseUrl;
  final String endPoint ;
  final http.Client httpClient;
  ApiClient({required this.baseUrl, required this.httpClient, required this.endPoint});
  Future<http.Response?> get(double from, double to) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/$endPoint?from=$from&to=$to'));
    if (response.statusCode != 200) {
      Logger().e('Request failed with status: ${response.statusCode}.');
      return null;
    } else {
      return response;
    }
  }
}
//get request atıldı ve genel api iletişim servisi kurulmuş oldu eğer birden
// fazla api kullanılacak ise base url'i bir değişken olarak almalıyız tek bir api kullanılacak ise base url direkt verilebilir.
//birinci base url:https://currency-conversion-and-exchange-rates.p.rapidapi.com/
//birinci endpoint: latest
//