// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealsHash() => r'c0a89c991fe595afa51a28a734b795f6d15505a7';

/// See also [meals].
@ProviderFor(meals)
final mealsProvider = AutoDisposeFutureProvider<List<Meal>>.internal(
  meals,
  name: r'mealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
String _$mealCountHash() => r'8a77b66e55a7686d13b5f781563d77fe361fccc8';

/// See also [mealCount].
@ProviderFor(mealCount)
final mealCountProvider = AutoDisposeProvider<Map<String, int>>.internal(
  mealCount,
  name: r'mealCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MealCountRef = AutoDisposeProviderRef<Map<String, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
