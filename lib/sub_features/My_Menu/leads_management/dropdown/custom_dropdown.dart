import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/colors/app_colors.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  late final ValueNotifier<String?> _valueListenable;

  @override
  void initState() {
    super.initState();
    _valueListenable = ValueNotifier<String?>(widget.value);
  }

  @override
  void didUpdateWidget(covariant CustomDropdownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _valueListenable.value) {
      _valueListenable.value = widget.value;
    }
  }

  @override
  void dispose() {
    _valueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onboardingDescription,
          ),
        ),
        SizedBox(height: 0.8.h),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<String>(
            valueListenable: _valueListenable,
            validator: widget.validator,
            isExpanded: true,
            items: widget.items
                .map(
                  (e) => DropdownItem<String>(
                    value: e,
                    child: Text(e, style: TextStyle(fontSize: 13.sp)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              _valueListenable.value = value;
              widget.onChanged(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.loginFieldFill,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 3.5.w,
                vertical: 1.6.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.onboardingDescription,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              useDecorationHorizontalPadding: true,
            ),
          ),
        ),
      ],
    );
  }
}
