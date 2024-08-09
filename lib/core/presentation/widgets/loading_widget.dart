import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isLoading ? const CircularProgressIndicator() : Container(),
        Positioned(
          child: IgnorePointer(
            ignoring: isLoading,
            child: Opacity(opacity: isLoading ? 0.6 : 1, child: child),
          ),
        ),
      ],
    );
  }
}
