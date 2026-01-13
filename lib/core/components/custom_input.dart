import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wl_platform/core/branding/theme/const/app_color_extansion.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool showError;
  final TextStyle? style;
  final FocusNode? focusNode;
  final bool obscureText;
  final Color? borderColor;
  final Color? focusedBorderColor;
  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.inputFormatters,
    this.style,
    this.textCapitalization,
    this.textInputAction,
    required this.showError,
    this.focusNode,
    this.obscureText = false,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    widget.controller.addListener(_onTextChange);
  }

  void _onFocusChange() {
    if (mounted) setState(() {});
  }

  void _onTextChange() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    widget.controller.removeListener(_onTextChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShowLabel =
        _focusNode.hasFocus || widget.controller.text.isNotEmpty;
    String? errorText = widget.showError && widget.controller.text.isEmpty
        ? widget.validator?.call(widget.controller.text)
        : null;

    final focusedBorderColor =
        widget.focusedBorderColor ??context.brandGreen;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: (_focusNode.hasFocus || errorText != null)
                    ? Border.all(
                        color: errorText != null
                            ? const Color(0xFFEF2323)
                            : focusedBorderColor,
                        width: 1.5,
                      )
                    : null,
              ),
              child: TextFormField(
                style:
                    widget.style ??
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                cursorHeight: 16,
                controller: widget.controller,
                focusNode: _focusNode,
                obscureText: widget.obscureText,
                onChanged: (value) {
                  widget.onChanged?.call(value);
                },
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                  suffixIcon: widget.suffix != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: widget.suffix,
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    bottom: 8,
                    left: 14,
                    right: 16,
                    top: 28,
                  ),
                  prefixIcon: shouldShowLabel && widget.prefix != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: widget.prefix,
                        )
                      : null,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  hintText: widget.label,
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFBDBDBD),
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorStyle: const TextStyle(height: 0, fontSize: 0),
                ),
              ),
            ),
            if (shouldShowLabel)
              Positioned(
                left: widget.prefix != null ? 40 : 16,
                top: 6,
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 12,
                    color: errorText != null
                        ? const Color(0xFFEF2323)
                        : const Color(0xFF8E8E92),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
        if (errorText != null && errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 6),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Color(0xFFEF2323),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
