import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localhost/product/models/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'product.freezed.dart';
part 'product.g.dart';

enum Category {
  vegetable, // 채소
  fruit, // 과일, 견과, 쌀
  fish, // 수산, 해산, 건어물
  meat, // 정육, 계란
  processed, // 가공식품
  salad, // 샐러드, 간편식
  drink, // 생수, 음료, 우유, 커피
  health, // 건강식품
  living, // 생활용품, 리빙, 캠핑
  pet // 반려동물
}

extension CategoryExtension on Category {
  String localize(AppLocalizations appLocalizations) {
    switch (this) {
      case Category.vegetable:
        return appLocalizations.category_vegetable;
      case Category.fruit:
        return appLocalizations.category_fruit;
      case Category.fish:
        return appLocalizations.category_fish;
      case Category.meat:
        return appLocalizations.category_meat;
      case Category.processed:
        return appLocalizations.category_processed;
      case Category.salad:
        return appLocalizations.category_salad;
      case Category.drink:
        return appLocalizations.category_drink;
      case Category.health:
        return appLocalizations.category_health;
      case Category.living:
        return appLocalizations.category_living;
      case Category.pet:
        return appLocalizations.category_pet;
    }
  }
}

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
    required Category category,
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
    required String content,
    String? desiredLocationName,
    String? desiredLocation,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);
}

@riverpod
Future<ProductData> product(ProductRef ref, int productId) async {
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
      category: Category.fruit,
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
      viewCount: 1754,
      content: '''관악구에서 쌀 함께 구입하실 분 모집합니다.
저는 1kg만 필요해서 함께 구매했으면 좋겠어요.
서울대입구역에서 소분해서 나눠가지면 좋을 듯 합니다.''',
      desiredLocationName: "서울대입구역");
}
