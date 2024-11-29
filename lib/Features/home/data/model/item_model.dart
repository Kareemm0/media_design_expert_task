import 'package:equatable/equatable.dart';

class ItemModel with EquatableMixin {
  @override
  List<Object?> get props => [item];

  final String item;

  ItemModel({required this.item});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      item: Map<String, dynamic>.from(json).toString(),
    );
  }
}
