part of fp;

compose(List<Function> funcs)
  => callSink((posArgs, namedArgs){
    var reversed = funcs.reversed;
    var firstResult = Function.apply(reversed.first, posArgs, namedArgs);
    return reversed.skip(1).fold(firstResult, (prevRes, func) => func(prevRes));
  });