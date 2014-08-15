part of fp;

/**
 * Partially applies a function.
 *
 * Example:
 *
 *    func(pos1, pos2, {named}) => "$pos1 $pos2 $named";
 *
 *    var partial = _.partial(func, ["pos1"]);
 *    partial("pos2"); // returns "pos1 pos2";
 *
 *    var partial = _.partial(func, [], {"named" : "named1"});
 *    partial("pos1", "pos2"); // returns "pos1 pos2 named1";
 */
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

/**
 * Transforms a function taking multiple arguments into
 * a chain of functions taking zero or more arguments.
 *
 * Example:
 *
 *    func(pos1, pos2) => "$pos1 $pos2";
 *    final c = _.curry(func);
 *
 *    c("pos1", "pos2"); //returns "pos1 pos2"
 *    c("pos1")("pos2"); //returns "pos1 pos2"
 *    c()("pos1")()("pos2"); //returns "pos1 pos2"
 */
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