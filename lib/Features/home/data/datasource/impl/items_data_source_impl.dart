import 'package:media_design_expert_task/Features/home/data/datasource/base/items_data_source.dart';
import 'package:media_design_expert_task/core/constant/end_points.dart';
import 'package:media_design_expert_task/core/network/dio/base_dio.dart';

class ItemsDataSourceImpl implements ItemsDataSource {
  final BaseDio _dio;

  ItemsDataSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> getItem() async {
    try {
      final response = await _dio.get(EndPoints.baseUrl);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
