part of fp;

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