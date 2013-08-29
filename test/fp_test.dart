library fp_test;

import 'package:unittest/unittest.dart';
import 'package:fp/fp.dart' as _;

part 'src/invoke_test.dart';
part 'src/partial_test.dart';
part 'src/compose_test.dart';
part 'src/field_test.dart';
part 'src/any_args_test.dart';
part 'src/integration_test.dart';

main(){
  testInvoke();
  testPartial();
  testCompose();
  testField();
  testIntegration();
  testAnyArgs();
}