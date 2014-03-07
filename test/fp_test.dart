library fp_test;

import 'package:unittest/unittest.dart';
import 'package:fp/fp.dart' as _;

part 'src/symbolize_test.dart';
part 'src/invoke_test.dart';
part 'src/partial_test.dart';
part 'src/compose_test.dart';
part 'src/field_test.dart';
part 'src/any_args_test.dart';
part 'src/present_test.dart';
part 'src/log_test.dart';

main(){
  testSymbolize();
  testInvoke();
  testPartial();
  testCompose();
  testField();
  testAnyArgs();
  testPresent();
  testLog();
}