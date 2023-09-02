// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

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

String _$productHash() => r'f33e290708951848f0ccd2adce5f73f69d208e90';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ProductRef = AutoDisposeFutureProviderRef<ProductData>;

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<ProductData>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(
    int productId,
  ) {
    return ProductProvider(
      productId,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeFutureProvider<ProductData> {
  /// See also [product].
  ProductProvider(
    this.productId,
  ) : super.internal(
          (ref) => product(
            ref,
            productId,
          ),
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
        );

  final int productId;

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
