import 'dart:convert';
import 'dart:ffi';

import 'package:drip/constants/gaps.dart';
import 'package:drip/constants/sizes.dart';
import 'package:drip/recipe_model/recipe_model.dart';
import 'package:drip/recipes.dart';
import 'package:drip/widgets/extractinStep.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  List<CoffeeRecipe> coffeeRecipes = [];
  final _formKey = GlobalKey<FormState>();
  int actionNum = 0;

  String _selectedDripper = '드립퍼';
  String _selectedGrindSize = '분쇄도';

  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _coffeeBeansAmountController =
      TextEditingController();
  final TextEditingController _waterAmountController = TextEditingController();
  final TextEditingController _waterTemperatureController =
      TextEditingController();
  final TextEditingController _totalTimeController = TextEditingController();

  final List<String> _dripperOptions = [
    '드립퍼',
    '하리오 V60',
    '캐맥스',
    '에스프레소',
    '프랜치 프레스',
    '칼리타'
  ];
  final List<String> _grindSizeOptions = ['분쇄도', '굵게', '중간', '얇게'];

  // 추출 과정 단계 관리 리스트
  final List<Map<String, dynamic>> _extractionStepsControllers = [];

  // 추출 단계 추가
  void _addExtractionStep() {
    setState(() {
      _extractionStepsControllers.add({
        //amout는 없을 수도 있는데 그건 어케 조건을 걸지?
        //여기서 Controller를 만들게 아니라 + 누를때 마다 생성해야 하나?
        //그게 되나 이거
        'action $actionNum': null,
        'amount $actionNum': null,
        'time $actionNum': null,
      });
    });
    actionNum += 1;
  }

  void _removeExtractionStep(int index) {
    setState(() {
      // 각 컨트롤러 안전하게 해제
      _extractionStepsControllers[index].forEach((key, controller) {
        controller?.dispose();
      });
      _extractionStepsControllers.removeAt(index); // 상태 변경
      actionNum -= 1;
    });
  }

  Future<void> _saveRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(
        coffeeRecipes_Hario.map((recipe) => recipe.toJson()).toList());
    await prefs.setString('coffeeRecipes', jsonString);
  }

  @override
  void dispose() {
    // 모든 TextEditingController 해제
    _recipeNameController.dispose();
    _coffeeBeansAmountController.dispose();
    _waterAmountController.dispose();
    _waterTemperatureController.dispose();
    _totalTimeController.dispose();
    for (var controllers in _extractionStepsControllers) {
      controllers.forEach((key, controller) {
        controller?.dispose(); // null이 아닌 컨트롤러만 해제
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double dropdownButtonSize =
        MediaQuery.of(context).size.width / 3 + 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text('새로운 레시피'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12, vertical: Sizes.size12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 레시피 이름 입력
                TextFormField(
                  controller: _recipeNameController,
                  decoration: const InputDecoration(
                    labelText: '레시피 이름',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '레시피의 이름을 적어주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Sizes.size24),

                // 드립퍼 및 분쇄도 선택
                Row(
                  children: [
                    DropdownMenu<String>(
                      width: dropdownButtonSize,
                      label: const Text('드립퍼 선택'),
                      initialSelection: _selectedDripper,
                      dropdownMenuEntries: _dripperOptions
                          .map((dripper) => DropdownMenuEntry(
                                value: dripper,
                                label: dripper,
                              ))
                          .toList(),
                      onSelected: (value) {
                        if (value != _selectedDripper) {
                          setState(() {
                            _selectedDripper = value!;
                          });
                        }
                      },
                    ),
                    const SizedBox(width: Sizes.size24),
                    DropdownMenu<String>(
                      width: dropdownButtonSize,
                      label: const Text('분쇄도'),
                      initialSelection: _selectedGrindSize,
                      dropdownMenuEntries: _grindSizeOptions
                          .map((grind) => DropdownMenuEntry(
                                value: grind,
                                label: grind,
                              ))
                          .toList(),
                      onSelected: (value) {
                        if (value != _selectedGrindSize) {
                          setState(() {
                            _selectedGrindSize = value!;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.size10),

                // 원두량 입력
                TextFormField(
                  controller: _coffeeBeansAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '원두량(g)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '원두량을 적어주세요';
                    }
                    return null;
                  },
                ),
                // 물 량
                const SizedBox(height: Sizes.size10),
                TextFormField(
                  controller: _waterAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '총 물 량(ml)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '총 물의 량을 적어주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Sizes.size10),
                //온도
                TextFormField(
                  controller: _waterTemperatureController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '물 온도(°C)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '물의 온도를 적어주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Sizes.size10),
                //시간
                TextFormField(
                  controller: _totalTimeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '총 시간(초)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '총 시간을 적어주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Sizes.size10),

                // 추출 과정 목록
                const Text(
                  '추출 과정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // 추출 단계 리스트 렌더링
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _extractionStepsControllers.length,
                  itemBuilder: (context, index) {
                    final controllers = _extractionStepsControllers[index];
                    return ExtractionStep(
                      index: index,
                      controllers: controllers,
                      onRemove: () => _removeExtractionStep(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: Sizes.size10);
                  },
                ),

                // 단계 추가 버튼
                ElevatedButton(
                  onPressed: _addExtractionStep,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('추출 과정 추가'),
                    ],
                  ),
                ),
                //저장
                Padding(
                  padding: const EdgeInsets.only(top: Sizes.size20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Gather extraction steps
                        List<Map<String, dynamic>> extractionSteps =
                            _extractionStepsControllers.map((controllers) {
                          return {
                            'action': controllers['action']!,
                            'amount': int.tryParse(
                                    controllers['amount']?.text ?? '0') ??
                                0,
                            'time': int.tryParse(
                                    controllers['time']?.text ?? '0') ??
                                0,
                          };
                        }).toList();

                        // Create a CoffeeRecipe object with the input values
                        final coffeeRecipe = CoffeeRecipe(
                          dripperName: _selectedDripper,
                          recipeName: _recipeNameController.text,
                          grindSize: _selectedGrindSize,
                          coffeeBeansAmount:
                              int.parse(_coffeeBeansAmountController.text),
                          waterAmount: int.parse(_waterAmountController.text),
                          waterTemperature:
                              int.parse(_waterTemperatureController.text),
                          totalTime: int.parse(_totalTimeController.text),
                          extractionSteps: extractionSteps,
                        );
                        _saveRecipes;

                        // Print or save the CoffeeRecipe object
                        print(coffeeRecipe);
                      }
                    },
                    child: const Text('레시피 저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
