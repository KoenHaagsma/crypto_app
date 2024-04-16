import 'package:crypto_app/features/overview/data/model/crypto_model.dart';
import 'package:dio/dio.dart';

abstract class CryptoApi {
  Future<CryptoModel> getCurrency(String name);
  Future<List<CryptoModel>> getCurrencyList();
}

class CryptoApiImpl implements CryptoApi {
  final Dio dio;

  CryptoApiImpl({required this.dio});

  @override
  Future<CryptoModel> getCurrency(String name) async {
    try {
      Response response;
      response = await dio.get('/assets/$name');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        return CryptoModel.fromJson(response.data['data']);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<List<CryptoModel>> getCurrencyList() async {
    try {
      Response response;
      response = await dio.get('/assets');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        return (response.data['data'] as List)
            .map((entity) => CryptoModel.fromJson(entity))
            .toList();
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
