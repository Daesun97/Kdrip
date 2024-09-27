// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeRecipeImpl _$$CoffeeRecipeImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeRecipeImpl(
      recipeName: json['recipeName'] as String,
      degree: json['degree'] as String,
      coffeeBeansAmount: (json['coffeeBeansAmount'] as num).toInt(),
      waterAmount: (json['waterAmount'] as num).toInt(),
      waterTemperature: (json['waterTemperature'] as num).toInt(),
      totalTime: (json['totalTime'] as num).toInt(),
      extractionSteps: (json['extractionSteps'] as List<dynamic>)
          .map((e) => Map<String, int>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$CoffeeRecipeImplToJson(_$CoffeeRecipeImpl instance) =>
    <String, dynamic>{
      'recipeName': instance.recipeName,
      'degree': instance.degree,
      'coffeeBeansAmount': instance.coffeeBeansAmount,
      'waterAmount': instance.waterAmount,
      'waterTemperature': instance.waterTemperature,
      'totalTime': instance.totalTime,
      'extractionSteps': instance.extractionSteps,
    };
