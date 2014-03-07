part of fp;

invoke(String memberName, [List posArgs = const [], Map namedArgs = const {}])
  => (self)
    => reflect(self).
       invoke(s(memberName), posArgs, symbolize(namedArgs)).
       reflectee;

Function getField(String memberName)
  => (self)
    => reflect(self).
      getField(s(memberName)).
      reflectee;

Function setField(String memberName, value)
  => (self)
    => reflect(self).
      setField(s(memberName), value).
      reflectee;