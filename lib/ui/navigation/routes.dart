enum Routes { start, map }

extension RoutesExt on Routes {
  String get routeName => '/${name}_page';
}
