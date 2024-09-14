import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pixabay_list/data/api/api_client.dart';
import 'package:pixabay_list/data/api/failure/api_failure.dart';
import 'package:pixabay_list/data/dto/pixabay_data_model.dart';
import 'package:pixabay_list/main/bootstrap/bootstrap.dart';

class PixabayDataSource {
  final ApiClient _apiClient = locator<ApiClient>();

  Future<List<PixabayDataModel>> getPixabayData() async {
    try {
      final response = await _apiClient.httpClient.get('');
      if (response.statusCode == HttpStatus.ok) {
        // decode json response
        // return PixabayDataModel
        return [];
      }
      return [];
    } on DioException catch (e) {
      throw ApiFailure.getApiFailure(e);
    } catch (error, stackTrace) {
      throw Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
