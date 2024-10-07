import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension BuildContextX on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
