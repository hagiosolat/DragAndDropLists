import 'package:drag_and_drop_lists/drag_and_drop_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_1/src/features/articles/domain/article_models.dart'; // additional import referencing Article & Priority classes in my project.
import 'package:flutter/material.dart'; //additional
import 'package:responsive_1/src/features/priority_view/presentation/widgets.dart'; //additional

class DragAndDropItem implements DragAndDropInterface {
  /// The child widget of this item.
  Widget child;

  /// Widget when draggable
  Widget? feedbackWidget;

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
    this.feedbackWidget,
    this.canDrag = true,
    this.key,
    this.child = const SizedBox(height: 10),
    //additions
    required this.title,
    Iterable<DragAndDropItem>? childList,
    this.article,
  }) : children = <DragAndDropItem>[] {
    if (feedbackWidget == null) {
      var fb = MyFeedbackWidget(title);
      feedbackWidget =
          Transform.translate(offset: const Offset(-10, -16), child: fb);
    }
    if (childList == null) return;

    for (final DragAndDropItem child in childList) {
      children.add(child);
      child.parent = this;
    }
  }
}
