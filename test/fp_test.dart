library fp_test;

import 'package:unittest/unittest.dart';
import 'package:fp/fp.dart' as _;

part 'src/common_test.dart';
part 'src/compose_test.dart';
part 'src/decorators_test.dart';
part 'src/invoke_test.dart';
part 'src/iterable_utils_test.dart';
part 'src/partial_test.dart';
part 'src/utils_test.dart';

main(){
  testCommon();
  testCompose();
  testDecorators();
  testInvoke();
  testIterableUtils();
  testPartial();
  testUtils();
}