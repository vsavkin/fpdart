library fp;

import 'dart:mirrors';

part 'src/invoke.dart';
part 'src/partial.dart';
part 'src/compose.dart';
part 'src/field.dart';
part 'src/tap.dart';

s(String name) => new Symbol(name);

Map<Symbol, dynamic> symbolize(Map<String, dynamic> map){
  return map.keys.fold({}, (memo, key){
    memo[s(key)] = map[key];
    return memo;
  });
}

class CallSink {
  Function func;

  CallSink(this.func);

  call() => func([], {});

  noSuchMethod(Invocation c)
  => c.memberName == s("call") ?
  func(c.positionalArguments, c.namedArguments) :
  super.noSuchMethod(c);
}

callSink(func) => new CallSink(func);
