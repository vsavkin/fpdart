part of fp;

getField(String memberName)
  => (self)
    => reflect(self).
       getField(s(memberName)).
       reflectee;

setField(String memberName, value)
  => (self)
    => reflect(self).
       setField(s(memberName), value).
       reflectee;