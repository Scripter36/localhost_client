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
  @override
  List<ProductListItemData> build() {
    return [
      ProductListItemData(
          thumbnailUrl: 'https://random.imagecdn.app/200/200',
          state: ProductState.normal,
          title: '쌀 10kg 구매 모집합니다',
          location: '행운동',
          createdAt: DateTime(2023, 8, 29, 16, 0, 0),
          price: 120000,
          remainPrice: 12000,
          unit: 'g',
          standardUnitAmount: 100,
          pricePerStandardUnit: 1200,
          favoriteCount: 3,
          participantCount: 4),
      ProductListItemData(
          thumbnailUrl: 'https://random.imagecdn.app/200/200',
          state: ProductState.completeMatching,
          title: '쌀 10kg 구매 모집합니다',
          location: '행운동',
          createdAt: DateTime(2023, 8, 29, 16, 0, 0),
          price: 120000,
          remainPrice: 12000,
          unit: 'g',
          standardUnitAmount: 100,
          pricePerStandardUnit: 1200,
          favoriteCount: 3,
          participantCount: 4),
      ProductListItemData(
          thumbnailUrl: 'https://random.imagecdn.app/200/200',
          state: ProductState.completePurchase,
          title: '쌀 10kg 구매 모집합니다',
          location: '행운동',
          createdAt: DateTime(2023, 8, 29, 16, 0, 0),
          price: 120000,
          remainPrice: 12000,
          unit: 'g',
          standardUnitAmount: 100,
          pricePerStandardUnit: 1200,
          favoriteCount: 3,
          participantCount: 4),
      ProductListItemData(
          thumbnailUrl: 'https://random.imagecdn.app/200/200',
          state: ProductState.finished,
          title: '쌀 10kg 구매 모집합니다',
          location: '행운동',
          createdAt: DateTime(2023, 8, 29, 16, 0, 0),
          price: 120000,
          remainPrice: 12000,
          unit: 'g',
          standardUnitAmount: 100,
          pricePerStandardUnit: 1200,
          favoriteCount: 3,
          participantCount: 4)
    ];
  }
}
