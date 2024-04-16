import 'package:crypto_app/features/contentful/data/model/asset_model.dart';
import 'package:crypto_app/features/contentful/data/model/banner_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ContentfulApi {
  Future<List<BannerModal>> getBannerList();
  Future<AssetModel> getAsset(String id);
}

class ContentfulApiImpl implements ContentfulApi {
  final Dio dio;

  ContentfulApiImpl({required this.dio});

  @override
  Future<List<BannerModal>> getBannerList() async {
    try {
      Response response;
      response = await dio.get(
          '/spaces/wb1nctoytp0e/environments/master/entries?access_token=UxMFzJNyz02okuSVTgYhArl1iASyNZweb_J42jPHgEM&content_type=banner');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        debugPrint(response.data['items'].toString());
        AssetModel bannerAsset = await getAsset(
            response.data['items'][0]['fields']['bannerImage']['sys']['id']);
        return (response.data['items'] as List)
            .map((e) => BannerModal.fromJson(e, bannerAsset))
            .toList();
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<AssetModel> getAsset(String id) async {
    try {
      Response response;
      response = await dio.get(
          '/spaces/wb1nctoytp0e/environments/master/assets/$id?access_token=UxMFzJNyz02okuSVTgYhArl1iASyNZweb_J42jPHgEM');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        return AssetModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
