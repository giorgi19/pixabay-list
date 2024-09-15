import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pixabay_list/data/api/failure/api_failure.dart';
import 'package:pixabay_list/data/api/failure/general_failure.dart';
import 'package:pixabay_list/data/api/repo_response.dart';
import 'package:pixabay_list/data/data_sources/remote/pixabay_data_source.dart';
import 'package:pixabay_list/data/dto/pixabay_data_model.dart';

abstract class IPixabayRepository {
  RepoResponse<PixabayDataModel> getPixabayData();
}

class PixabayRepository implements IPixabayRepository {
  PixabayRepository({
    required this.pixabayDataSource,
  });

  final PixabayDataSource pixabayDataSource;

  @override
  RepoResponse<PixabayDataModel> getPixabayData() async {
    try {
      final result = await pixabayDataSource.getPixabayData();
      return right(result);
    } on DioException catch (error) {
      return left(ApiFailure.getApiFailure(error));
    } catch (error) {
      return left(
        GeneralFailure.unknown(error.toString()),
      );
    }
  }
}
