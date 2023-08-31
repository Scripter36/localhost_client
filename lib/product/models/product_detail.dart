import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localhost/product/models/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_detail.freezed.dart';
part 'product_detail.g.dart';

@freezed
class ProductData with _$ProductData {
  const factory ProductData({
    required int productId,
    required List<String> imageUrls,
    required String authorProfileImageUrl,
    required int authorId,
    required String authorName,
    required double authorRating,
    required int authorRatingCount,
    required ProductState state,
    required String title,
    required String location,
    required DateTime createdAt,
    required int price,
    required int remainPrice,
    required String unit,
    required double standardUnitAmount,
    required double pricePerStandardUnit,
    required double minimumAmount,
    required double incrementAmount,
    required int favoriteCount,
    required int participantCount,
    required int viewCount,
    String? content,
    String? desiredLocationName,
    String? desiredLocation,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);
}

@riverpod
class ProductDetail extends _$ProductDetail {
  @override
  Map<int, AsyncValue<ProductData>> build() {
    return HashMap();
  }

  Future<void> load(int productId) async {
    state = {...state, productId: const AsyncValue.loading()};
    state = {
      ...state,
      productId: await AsyncValue.guard(() async {
        // TODO
        await Future.delayed(const Duration(milliseconds: 500));
        return ProductData(
            productId: productId,
            imageUrls: ["https://picsum.photos/1000?time=$productId"],
            authorProfileImageUrl: "https://picsum.photos/200",
            authorId: 0,
            authorName: "지역냉장고",
            authorRating: 4.5,
            authorRatingCount: 5,
            state: ProductState.normal,
            title: "쌀 10kg 구매 모집합니다",
            location: "행운동",
            createdAt: DateTime.now().subtract(Duration(minutes: 100)),
            price: 120000,
            remainPrice: 24000,
            unit: "kg",
            standardUnitAmount: 1,
            pricePerStandardUnit: 12000,
            minimumAmount: 1,
            incrementAmount: 1,
            favoriteCount: 3,
            participantCount: 4,
            viewCount: 1754);
      })
    };
  }
}
