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

Function curry(Function func){
  final allParams = (reflect(func) as ClosureMirror).function.parameters;
  final numberOfRequiredParams = allParams.where((_) => !_.isOptional).length;

  withSavedArgs(List savedPosArgs, Map savedNamedArgs){
    return callSink((posArgs, namedArgs){
      final pos = []..addAll(savedPosArgs)..addAll(posArgs);
      final named = new Map<Symbol, dynamic>();
      named.addAll(savedNamedArgs);
      named.addAll(namedArgs);

      if(pos.length >= numberOfRequiredParams) {
        return Function.apply(func, pos, named);
      } else {
        return withSavedArgs(pos, named);
      }
    });
  }

  return withSavedArgs([], {});
}