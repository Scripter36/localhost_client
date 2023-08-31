import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products.g.dart';
part 'products.freezed.dart';

enum ProductState {
  normal,
  completeMatching,
  completePurchase,
  finished,
}

@freezed
class ProductListItemData with _$ProductListItemData {
  const factory ProductListItemData({
    required int productId,
    required String thumbnailUrl,
    required ProductState state,
    required String title,
    required String location,
    required DateTime createdAt,
    required int price,
    required int remainPrice,
    required String unit,
    required int standardUnitAmount,
    required int pricePerStandardUnit,
    required int favoriteCount,
    required int participantCount,
  }) = _ProductListItemData;

  factory ProductListItemData.fromJson(Map<String, dynamic> json) => _$ProductListItemDataFromJson(json);
}

@riverpod
class Products extends _$Products {
  // for test purpose
  static int lastTimestamp = DateTime.now().millisecondsSinceEpoch;
  static ProductListItemData generateRandomProduct() {
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if (currentTimestamp <= lastTimestamp) {
      currentTimestamp = lastTimestamp + 1;
    }
    lastTimestamp = currentTimestamp;
    return ProductListItemData(
        productId: currentTimestamp,
        thumbnailUrl: 'https://picsum.photos/200?time=$currentTimestamp}',
        state: switch (Random().nextInt(4)) {
          0 => ProductState.normal,
          1 => ProductState.completeMatching,
          2 => ProductState.completePurchase,
          3 => ProductState.finished,
          _ => ProductState.normal,
        },
        title: '쌀 10kg 구매 모집합니다',
        location: '행운동',
        createdAt: DateTime.now().subtract(Duration(minutes: Random().nextInt(60 * 24 * 30 * 2))),
        price: 120000,
        remainPrice: 12000,
        unit: 'g',
        standardUnitAmount: 100,
        pricePerStandardUnit: 1200,
        favoriteCount: Random().nextInt(30),
        participantCount: Random().nextInt(12));
  }

  @override
  List<ProductListItemData> build() {
    return [
      for (int i = 0; i < 20; i++) generateRandomProduct(),
    ];
  }

  Future<void> loadMore() {
    // for test
    return Future.delayed(Duration(milliseconds: 500)).then((value) => state = [...state, ...build()]);
  }

  Future<void> refresh() {
    // for test
    return Future.delayed(Duration(milliseconds: 500)).then((value) => state = build());
  }
}
