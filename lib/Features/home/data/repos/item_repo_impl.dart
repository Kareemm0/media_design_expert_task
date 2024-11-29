import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
import '../../domain/item_repo.dart';
import '../datasource/base/items_data_source.dart';

class ItemRepoImpl implements ItemRepo {
  final ItemsDataSource _source;

  ItemRepoImpl(this._source);

  @override
  Future<Either<Failure, List<String>>> getItem() async {
    try {
      final response = await _source.getItem();

      if (response.isNotEmpty) {
        final List data = response.values.toList();

        final List<String> items = data.map((item) => item.toString()).toList();

        return Right(items);
      } else {
        return const Left(ServerFailure('Unexpected response format'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
