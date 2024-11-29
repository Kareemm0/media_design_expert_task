import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_design_expert_task/Features/home/domain/item_repo.dart';
part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepo _repo;
  ItemCubit(this._repo) : super(ItemInitial());

  List<String> item = [];

  List<String> filter = [];

  Future<void> getItem() async {
    final result = await _repo.getItem();

    result.fold(
      (left) {
        log("========${left.message}");
        emit(ItemGetFailureState(left.message));
      },
      (result) {
        item = result;
        log("====item List is $item");
        emit(ItemGetSuccessState(result));
      },
    );
  }
}
