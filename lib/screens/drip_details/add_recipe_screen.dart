import 'package:drip/constants/gaps.dart';
import 'package:drip/constants/sizes.dart';
import 'package:drip/recipe_model/recipe_model.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

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
  final List<Map<String, TextEditingController>> _extractionStepsControllers =
      [];
//추출방법 추가
  void _addExtractionStep() {
    setState(() {
      _extractionStepsControllers.add({
        'amount': TextEditingController(),
        'time': TextEditingController(),
      });
    });
  }

//추출방법 삭제
  void _removeExtractionStep(int index) {
    setState(() {
      _extractionStepsControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새로운 레시피'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12, vertical: Sizes.size24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<String>(
                  //글자체 변경 필요
                  width: 200,
                  label: const Text('드립퍼 선택'),
                  //기본값
                  initialSelection: _selectedDripper,
                  dropdownMenuEntries: _dripperOptions
                      .map((dripper) => DropdownMenuEntry(
                            value: dripper,
                            label: dripper,
                          ))
                      .toList(),
                  onSelected: (value) {
                    setState(() {
                      _selectedDripper = value!;
                    });
                  },
                ),
                Gaps.h20,
                //레시피 이름 등록
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
                Gaps.h40,
                //분쇄도
                DropdownMenu<String>(
                  width: 200,
                  label: const Text("분쇄도"),
                  initialSelection: _selectedGrindSize,
                  dropdownMenuEntries: _grindSizeOptions
                      .map((grind) => DropdownMenuEntry(
                            value: grind,
                            label: grind,
                          ))
                      .toList(),
                  onSelected: (value) {
                    setState(() {
                      _selectedGrindSize = value!;
                    });
                  },
                ),
                Gaps.h10,
                //콩 량
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
                Gaps.h10,
                //물 량
                TextFormField(
                  controller: _waterAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '추출량 (ml)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '최종추출량을 적어주세요';
                    }
                    return null;
                  },
                ),
                Gaps.h10,
                //물의 온도
                TextFormField(
                  controller: _waterTemperatureController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '물의 온도 (°C)',
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
                Gaps.h10,
                //총 시간
                TextFormField(
                  controller: _totalTimeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '추출시간 (초)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '최종 추출시간을 적어주세요';
                    }
                    return null;
                  },
                ),
                Gaps.h10,

                const Text(
                  'Extraction Steps',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ..._extractionStepsControllers.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, TextEditingController> controllers = entry.value;
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controllers['amount'],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText:
                                    'Step ${index + 1} - Water Amount (ml)',
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    int.tryParse(value) == null) {
                                  return 'Enter valid amount';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: controllers['time'],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Time (sec)',
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    int.tryParse(value) == null) {
                                  return 'Enter valid time';
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _removeExtractionStep(index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }),

                // Add Step Button
                ElevatedButton(
                  onPressed: _addExtractionStep,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('Add Extraction Step'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Gather extraction steps
                      List<Map<String, int>> extractionSteps =
                          _extractionStepsControllers.map((controllers) {
                        return {
                          'amount': int.parse(controllers['amount']!.text),
                          'time': int.parse(controllers['time']!.text),
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

                      // Print or save the CoffeeRecipe object
                      print(coffeeRecipe);
                    }
                  },
                  child: const Text('Save Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
