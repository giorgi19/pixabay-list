import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/dto/pixabay_data_model.dart';
import 'package:pixabay_list/data/repository/i_pixabay_repository.dart';

part 'pixabay_feed_cubit.freezed.dart';
part 'pixabay_feed_state.dart';

class PixabayFeedCubit extends Cubit<PixabayFeedState> {
  PixabayFeedCubit({
    required this.pixabayRepository,
  }) : super(const PixabayFeedState.initial());

  PixabayRepository pixabayRepository;

  Future<void> getPixabayData() async {
    emit(const PixabayFeedState.loading());
    final pixabayData = await pixabayRepository.getPixabayData();
    pixabayData.fold(
      (failure) {
        emit(
          PixabayFeedState.failed(error: failure.toString()),
        );
      },
      (data) {
        emit(PixabayFeedState.loaded(data: data));
      },
    );
  }
}
