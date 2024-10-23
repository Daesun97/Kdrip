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
  bool _isDisposed = false; // 컨트롤러 해제 여부 추적
  String selectedAction = '물 추가'; // 초기값 설정

  @override
  void initState() {
    super.initState();
    // 초기값 설정 (만약 컨트롤러에 값이 없으면 '물 추가'로 설정)
    widget.controllers['amount']?.text = '해당 없음';
  }

  @override
  void dispose() {
    // 컨트롤러 해제 및 상태 플래그 설정
    widget.controllers.forEach((key, controller) {
      controller.dispose();
    });
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisposed) {
      // 위젯이 해제된 상태라면 빈 위젯 반환
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            style: Theme.of(context).textTheme.bodyMedium,
            value: selectedAction,
            items: ['물 추가', '스왈링', '휘젓기']
                .map((action) => DropdownMenuItem<String>(
                      value: action,
                      child: Text(action),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedAction = value!;
                // 작업 종류에 따라 양의 기본값 설정
                if (selectedAction != '물 추가') {
                  widget.controllers['amount']?.text = '해당 없음';
                }
              });
            },
            decoration: const InputDecoration(
              labelText: '추출 과정 추가',
            ),
          ),
        ),
        const SizedBox(width: 16),
        if (selectedAction == '물 추가')
          Expanded(
            child: TextFormField(
              controller: widget.controllers['amount'],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '추가할 물량 (ml)',
              ),
              validator: (value) {
                if (selectedAction == '물 추가' &&
                    (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null)) {
                  return 'Enter valid amount';
                }
                return null;
              },
            ),
          ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            controller: widget.controllers['time'],
            decoration: const InputDecoration(
              labelText: '시간 (초)',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: widget.onRemove,
        ),
      ],
    );
  }
}
