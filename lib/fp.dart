library fp;

import 'dart:mirrors';

part 'src/invoke.dart';
part 'src/partial.dart';
part 'src/compose.dart';
part 'src/field.dart';
part 'src/tap.dart';
part 'src/any_args.dart';

s(String name) => new Symbol(name);

Map<Symbol, dynamic> symbolize(Map<String, dynamic> map){
  return map.keys.fold(new Map<Symbol, dynamic>(), (memo, key){
    memo[s(key)] = map[key];
    return memo;
  });
}

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
