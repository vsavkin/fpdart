part of fp;

partial(Function func,
        [List appliedPosArgs = const [],
        Map<String,dynamic> appliedNamedArgs = const {}]){

  return callSink((posArgs, namedArgs){
    var pos = []..addAll(appliedPosArgs)..addAll(posArgs);
    var named = new Map<Symbol, dynamic>();
    named.addAll(symbolize(appliedNamedArgs));
    named.addAll(namedArgs);
    return Function.apply(func, pos, named);
  });
}