library fp;

import 'dart:mirrors';

part 'src/common.dart';
part 'src/compose.dart';
part 'src/decorators.dart';
part 'src/invoke.dart';
part 'src/iterable_utils.dart';
part 'src/partial.dart';
part 'src/utils.dart';

class CallSink {
  Function func;

  CallSink(this.func);

  call() => func([], new Map<Symbol, dynamic>());

  noSuchMethod(Invocation c)
    => c.memberName == s("call") ?
      func(c.positionalArguments, c.namedArguments) :
      super.noSuchMethod(c);
}

callSink(func) => new CallSink(func);
