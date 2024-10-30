import 'package:drip/constants/sizes.dart';
import 'package:flutter/material.dart';

class ExtractionStep extends StatefulWidget {
  final int index;
  final Map<String, TextEditingController> controllers;
  final VoidCallback onRemove;

  const ExtractionStep({
    super.key,
    required this.index,
    required this.controllers,
    required this.onRemove,
  });

  @override
  State<ExtractionStep> createState() => _ExtractionStepState();
}

class _ExtractionStepState extends State<ExtractionStep> {
  String selectedAction = '작업 선택'; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: selectedAction,
                items: ['작업 선택', '물 추가', '스왈링', '휘젓기']
                    .map(
                      (action) => DropdownMenuItem<String>(
                        value: action,
                        child: Text(action),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAction = value!;
                    if (selectedAction != '물 추가') {
                      widget.controllers['amount']?.text = '해당 없음';
                    }
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: widget.onRemove,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (selectedAction == '물 추가')
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controllers['amount'],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: '물량 (ml)',
                      labelStyle: TextStyle(color: Colors.brown)),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return '올바른 량을 기입해 주세요';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: widget.controllers['time'],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: '시간 (초)',
                      labelStyle: TextStyle(color: Colors.brown)),
                ),
              ),
            ],
          )
        else
          TextFormField(
            controller: widget.controllers['time'],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: '시간 (초)',
            ),
          ),
      ],
    );
  }
}
