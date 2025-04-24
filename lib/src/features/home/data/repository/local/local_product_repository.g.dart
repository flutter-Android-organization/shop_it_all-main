// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_product_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localProductRepositoryHash() =>
    r'2cd80877b84202aa7c784a3fb07fd7dd1ce943ca';

/// See also [localProductRepository].
@ProviderFor(localProductRepository)
final localProductRepositoryProvider =
    AutoDisposeProvider<LocalProductRepository>.internal(
  localProductRepository,
  name: r'localProductRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localProductRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalProductRepositoryRef
    = AutoDisposeProviderRef<LocalProductRepository>;
String _$fetchProductHash() => r'70fa3bfc4e7d35232dd3a48838ac46fd16f3f5ab';

/// See also [fetchProduct].
@ProviderFor(fetchProduct)
final fetchProductProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  fetchProduct,
  name: r'fetchProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchProductRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$totalProductHash() => r'ef620d372048809dadd88ba8ebd772ce4ed80bbd';

/// See also [totalProduct].
@ProviderFor(totalProduct)
final totalProductProvider = AutoDisposeProvider<int>.internal(
  totalProduct,
  name: r'totalProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalProductRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
