part of fp;

partial(Function func,
        [List appliedPosArgs = const [],
        Map<String,dynamic> appliedNamedArgs = const {}]){

  return callSink((posArgs, namedArgs){
    var pos = []..addAll(appliedPosArgs)..addAll(posArgs);
    var named = {}..addAll(symbolize(appliedNamedArgs))..addAll(namedArgs);
    return Function.apply(func, pos, named);
  });
}