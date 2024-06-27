import 'package:crypto_app/features/overview/data/model/crypto_history_model.dart';
import 'package:crypto_app/features/overview/data/model/crypto_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Interval {
  static const String day = 'd1';
}

abstract class CryptoApi {
  Future<CryptoModel> getCurrency(String name);
  Future<List<CryptoHistoryModel>> getCurrencyChart(
      String name, String interval);
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
  Future<List<CryptoHistoryModel>> getCurrencyChart(
      String name, String interval) async {
    debugPrint('getCurrencyChart: $name, $interval');
    try {
      Response response;
      response = await dio
          .get('/assets/${name.toLowerCase()}/history?interval=$interval');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        return (response.data['data'] as List)
            .map((entity) => CryptoHistoryModel.fromJson(entity))
            .toList();
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
