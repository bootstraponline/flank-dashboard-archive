import 'package:meta/meta.dart';

/// A class that represents the data of the project group to display
/// inside a dialog.
class ProjectGroupDialogViewModel {
  /// A unique identifier of the project.
  final String id;

  /// A name of the project.
  final String name;

  /// A list of projects' identifiers, related to the group.
  final List<String> selectedProjectIds;

  /// Creates the [ProjectGroupDialogViewModel].
  ProjectGroupDialogViewModel({
    @required this.id,
    @required this.name,
    @required this.selectedProjectIds,
  });
}