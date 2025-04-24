// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartTotalHash() => r'f4208cb521cedeed97a720201396ff4f7d64b8ac';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = AutoDisposeProvider<double>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CartTotalRef = AutoDisposeProviderRef<double>;
String _$cartPageControllerHash() =>
    r'44d4be8a17de2ac8f89653e8147899aa2e655dc4';

/// See also [CartPageController].
@ProviderFor(CartPageController)
final cartPageControllerProvider = AutoDisposeAsyncNotifierProvider<
    CartPageController, List<ProductModel>>.internal(
  CartPageController.new,
  name: r'cartPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartPageController = AutoDisposeAsyncNotifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
