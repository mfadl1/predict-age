import 'package:flutter/material.dart';

import '../utils/logger.dart';

extension on Route<dynamic> {
  String get str => '${settings.name}';
}

class AppRouteObserver extends NavigatorObserver {
  AppRouteObserver() {
    // log.onRecord.listen((e) => debugPrint('$e'));
  }

  // final log = Logger('MyNavObserver');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    LogService.info(
        'didPush: ${route.str}, previousRoute= ${previousRoute?.str}, ${route.isFirst}');
    // debugPrint('New route pushed: ${_route.child}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      LogService.info(
          'didPop: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      LogService.info(
          'didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      LogService.info(
          'didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      LogService.info('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => LogService.info('didStopUserGesture');
}