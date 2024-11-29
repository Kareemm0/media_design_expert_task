part of 'item_cubit.dart';

sealed class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

final class ItemInitial extends ItemState {}

final class ItemGetLoadingState extends ItemState {}

final class ItemGetSuccessState extends ItemState {
  final List<String> model;

  const ItemGetSuccessState(this.model);
}

final class ItemGetFailureState extends ItemState {
  final String message;

  const ItemGetFailureState(this.message);
}
