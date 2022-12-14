// Use of this source code is governed by the Apache License, Version 2.0
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:metrics/base/presentation/widgets/svg_image.dart';
import 'package:metrics/common/presentation/strings/common_strings.dart';
import 'package:metrics/common/presentation/widgets/metrics_text_form_field.dart';

/// A [TextField] with the ability to search across projects.
class ProjectSearchInput extends StatefulWidget {
  /// A callback for [TextField] value change.
  final ValueChanged<String> onChanged;

  /// An initial value for this input.
  final String initialValue;

  /// Creates [TextField] to search projects.
  ///
  /// Initializes widget [key], an [initialValue] and [onChanged] callback.
  const ProjectSearchInput({
    Key key,
    @required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  _ProjectSearchInputState createState() => _ProjectSearchInputState();
}

class _ProjectSearchInputState extends State<ProjectSearchInput> {
  /// A text editing controller for a project name.
  TextEditingController _projectNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _projectNameController.text = widget.initialValue;
  }

  @override
  void didUpdateWidget(ProjectSearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    _projectNameController = TextEditingController(text: widget.initialValue);
    _projectNameController.selection = TextSelection.fromPosition(
      TextPosition(offset: _projectNameController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MetricsTextFormField(
      controller: _projectNameController,
      onChanged: widget.onChanged,
      prefixIconBuilder: (context, color) {
        return SvgImage(
          'icons/search.svg',
          width: 20.0,
          height: 20.0,
          color: color,
        );
      },
      hint: CommonStrings.searchForProject,
    );
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    super.dispose();
  }
}
