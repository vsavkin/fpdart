part of fp;

anyArgs(Function func){
  return callSink((posArgs, namedArgs) => func());
}