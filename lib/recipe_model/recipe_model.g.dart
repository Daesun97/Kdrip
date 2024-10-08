// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeRecipeImpl _$$CoffeeRecipeImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeRecipeImpl(
      coffeeBeansAmount: (json['coffeeBeansAmount'] as num).toInt(),
      waterAmount: (json['waterAmount'] as num).toInt(),
      waterTemperature: (json['waterTemperature'] as num).toInt(),
      totalTime: (json['totalTime'] as num).toInt(),
      extractionSteps: (json['extractionSteps'] as List<dynamic>)
          .map((e) => Map<String, int>.from(e as Map))
          .toList(),
      recipeName: json['recipeName'] as String,
      grindSize: json['grindSize'] as String,
    );

Map<String, dynamic> _$$CoffeeRecipeImplToJson(_$CoffeeRecipeImpl instance) =>
    <String, dynamic>{
      'coffeeBeansAmount': instance.coffeeBeansAmount,
      'waterAmount': instance.waterAmount,
      'waterTemperature': instance.waterTemperature,
      'totalTime': instance.totalTime,
      'extractionSteps': instance.extractionSteps,
      'recipeName': instance.recipeName,
      'grindSize': instance.grindSize,
    };
