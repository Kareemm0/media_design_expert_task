import 'package:dartz/dartz.dart';
import 'package:media_design_expert_task/core/network/error/failure.dart';

abstract class ItemRepo {
  Future<Either<Failure, List<String>>> getItem();
}
