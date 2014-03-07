part of fp;

log(Function tapFunction, Function func){
  return callSink((posArgs, namedArgs){
    Function.apply(tapFunction, posArgs, namedArgs);
    return Function.apply(func, posArgs, namedArgs);
  });
}