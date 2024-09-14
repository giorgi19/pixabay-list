import 'package:dartz/dartz.dart';
import 'package:pixabay_list/api/failure/failure.dart';

typedef RepoResponse<T> = Future<Either<Failure, T>>;
