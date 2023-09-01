// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductData _$$_ProductDataFromJson(Map<String, dynamic> json) =>
    _$_ProductData(
      productId: json['productId'] as int,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      authorProfileImageUrl: json['authorProfileImageUrl'] as String,
      authorId: json['authorId'] as int,
      authorName: json['authorName'] as String,
      authorRating: (json['authorRating'] as num).toDouble(),
      authorRatingCount: json['authorRatingCount'] as int,
      state: $enumDecode(_$ProductStateEnumMap, json['state']),
      title: json['title'] as String,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      price: json['price'] as int,
      remainPrice: json['remainPrice'] as int,
      unit: json['unit'] as String,
      standardUnitAmount: (json['standardUnitAmount'] as num).toDouble(),
      pricePerStandardUnit: (json['pricePerStandardUnit'] as num).toDouble(),
      minimumAmount: (json['minimumAmount'] as num).toDouble(),
      incrementAmount: (json['incrementAmount'] as num).toDouble(),
      favoriteCount: json['favoriteCount'] as int,
      participantCount: json['participantCount'] as int,
      viewCount: json['viewCount'] as int,
      content: json['content'] as String,
      desiredLocationName: json['desiredLocationName'] as String?,
      desiredLocation: json['desiredLocation'] as String?,
    );

Map<String, dynamic> _$$_ProductDataToJson(_$_ProductData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imageUrls': instance.imageUrls,
      'authorProfileImageUrl': instance.authorProfileImageUrl,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorRating': instance.authorRating,
      'authorRatingCount': instance.authorRatingCount,
      'state': _$ProductStateEnumMap[instance.state]!,
      'title': instance.title,
      'category': _$CategoryEnumMap[instance.category]!,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'price': instance.price,
      'remainPrice': instance.remainPrice,
      'unit': instance.unit,
      'standardUnitAmount': instance.standardUnitAmount,
      'pricePerStandardUnit': instance.pricePerStandardUnit,
      'minimumAmount': instance.minimumAmount,
      'incrementAmount': instance.incrementAmount,
      'favoriteCount': instance.favoriteCount,
      'participantCount': instance.participantCount,
      'viewCount': instance.viewCount,
      'content': instance.content,
      'desiredLocationName': instance.desiredLocationName,
      'desiredLocation': instance.desiredLocation,
    };

const _$ProductStateEnumMap = {
  ProductState.normal: 'normal',
  ProductState.completeMatching: 'completeMatching',
  ProductState.completePurchase: 'completePurchase',
  ProductState.finished: 'finished',
};

const _$CategoryEnumMap = {
  Category.vegetable: 'vegetable',
  Category.fruit: 'fruit',
  Category.fish: 'fish',
  Category.meat: 'meat',
  Category.processed: 'processed',
  Category.salad: 'salad',
  Category.drink: 'drink',
  Category.health: 'health',
  Category.living: 'living',
  Category.pet: 'pet',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailHash() => r'84247a71e869b4a4abfa7cf8a594baead0892804';

/// See also [ProductDetail].
@ProviderFor(ProductDetail)
final productDetailProvider = AutoDisposeNotifierProvider<ProductDetail,
    Map<int, AsyncValue<ProductData>>>.internal(
  ProductDetail.new,
  name: r'productDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductDetail
    = AutoDisposeNotifier<Map<int, AsyncValue<ProductData>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
