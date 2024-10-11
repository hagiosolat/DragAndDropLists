import 'package:drag_and_drop_lists/drag_and_drop_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_1/src/features/folder_view/domain/folder_view_models.dart'; //addition
import 'package:responsive_1/src/features/articles/domain/article_models.dart'; // additional import referencing Article & Priority classes in my project.

class DragAndDropItem implements DragAndDropInterface {
  /// The child widget of this item.
  final Widget child;

  /// Widget when draggable
  final Widget? feedbackWidget;

  /// Whether or not this item can be dragged.
  /// Set to true if it can be reordered.
  /// Set to false if it must remain fixed.
  final bool canDrag;
  final Key? key;
  //additions
  bool get isFolder => article == null;
  final String title;
  final Article? article;
  final List<DragAndDropItem> children;
  DragAndDropItem? parent;

  DragAndDropItem({
    required this.child,
    this.feedbackWidget,
    this.canDrag = true,
    this.key,
    //additions
    required this.title,
    Iterable<DragAndDropItem>? childList,
    this.article,
  }) : children = <DragAndDropItem>[] {
    if (childList == null) return;

    for (final DragAndDropItem child in childList) {
      children.add(child);
      child.parent = this;
    }
  }
}

