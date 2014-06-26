part of fp;

invoke(memberName, [List posArgs = const [], Map namedArgs = const {}])
  => (self)
    => reflect(self).
       invoke(s(memberName), posArgs, symbolize(namedArgs)).
       reflectee;

Function getField(memberName)
  => (self)
    => reflect(self).
      getField(s(memberName)).
      reflectee;

Function setField(memberName, value)
  => (self)
    => reflect(self).
      setField(s(memberName), value).
      reflectee;