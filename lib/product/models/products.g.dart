// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductListItemData _$$_ProductListItemDataFromJson(
        Map<String, dynamic> json) =>
    _$_ProductListItemData(
      productId: json['productId'] as int,
      thumbnailUrl: json['thumbnailUrl'] as String,
      state: $enumDecode(_$ProductStateEnumMap, json['state']),
      title: json['title'] as String,
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      price: json['price'] as int,
      remainPrice: json['remainPrice'] as int,
      unit: json['unit'] as String,
      standardUnitAmount: json['standardUnitAmount'] as int,
      pricePerStandardUnit: json['pricePerStandardUnit'] as int,
      favoriteCount: json['favoriteCount'] as int,
      participantCount: json['participantCount'] as int,
    );

Map<String, dynamic> _$$_ProductListItemDataToJson(
        _$_ProductListItemData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'thumbnailUrl': instance.thumbnailUrl,
      'state': _$ProductStateEnumMap[instance.state]!,
      'title': instance.title,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'price': instance.price,
      'remainPrice': instance.remainPrice,
      'unit': instance.unit,
      'standardUnitAmount': instance.standardUnitAmount,
      'pricePerStandardUnit': instance.pricePerStandardUnit,
      'favoriteCount': instance.favoriteCount,
      'participantCount': instance.participantCount,
    };

const _$ProductStateEnumMap = {
  ProductState.normal: 'normal',
  ProductState.completeMatching: 'completeMatching',
  ProductState.completePurchase: 'completePurchase',
  ProductState.finished: 'finished',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'c9aa4c6c15626400529c8b3e986a21c79fe73ffd';

/// See also [Products].
@ProviderFor(Products)
final productsProvider =
    AutoDisposeNotifierProvider<Products, List<ProductListItemData>>.internal(
  Products.new,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Products = AutoDisposeNotifier<List<ProductListItemData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
