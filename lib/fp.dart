library fp;

import 'dart:mirrors';

part 'src/invoke.dart';
part 'src/partial.dart';
part 'src/compose.dart';
part 'src/field.dart';
part 'src/log.dart';
part 'src/any_args.dart';
part 'src/symbolize.dart';
part 'src/present.dart';
part 'src/common_functions.dart';

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
