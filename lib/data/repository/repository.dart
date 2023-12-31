import 'package:coinrich/data/models/fetch_coins_model.dart';
import 'package:dio/dio.dart';

class Repository {
  static String baseUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "257bcb4c-5bc8-411f-ada5-a2b854ec66df";
  var currencyListingAPI = '${baseUrl}cryptocurrency/listings/latest';
  final Dio _dio = Dio();

  Future<List<DataModel>> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);

      // Parse the response and return a list of DataModel instances
      BigDataModel bigDataModel = BigDataModel.fromJson(response.data);
      List<DataModel> dataModels = bigDataModel.dataModel;

      return dataModels;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      // Return an empty list in case of an error
      return [];
    }
  }
}
