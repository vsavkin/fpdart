part of fp;

Function partial(Function func,
        [List appliedPosArgs = const [],
        Map<String,dynamic> appliedNamedArgs = const {}]){

  return callSink((posArgs, namedArgs){
    final pos = []..addAll(appliedPosArgs)..addAll(posArgs);
    final named = new Map<Symbol, dynamic>();
    named.addAll(symbolize(appliedNamedArgs));
    named.addAll(namedArgs);
    return Function.apply(func, pos, named);
  });
}