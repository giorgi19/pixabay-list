import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pixabay_list/data/api/api_client.dart';
import 'package:pixabay_list/data/api/failure/api_failure.dart';
import 'package:pixabay_list/data/dto/pixabay_data_model.dart';
import 'package:pixabay_list/main/bootstrap/bootstrap.dart';

class PixabayDataSource {
  final ApiClient _apiClient = locator<ApiClient>();

  Future<PixabayDataModel> getPixabayData() async {
    try {
      final response = await _apiClient.httpClient.get('');
      if (response.statusCode == HttpStatus.ok) {
        final result = PixabayDataModel.fromJson(response.data);
        return result;
      }
      return const PixabayDataModel();
    } on DioException catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        ApiFailure.getApiFailure(error),
        stackTrace,
      );
    } catch (error, stackTrace) {
      throw Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
