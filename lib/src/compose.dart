part of fp;

Function compose(List<Function> funcs)
  => callSink((posArgs, namedArgs){
    final reversed = funcs.reversed;
    final firstResult = Function.apply(reversed.first, posArgs, namedArgs);
    return reversed.skip(1).fold(firstResult, (prevRes, func) => func(prevRes));
  });