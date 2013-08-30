# FP in Dart

## Symbolize

    test("returns a map with symbolized keys", () {
       var s = _.symbolize({"one" : 1});
       expect(s[const Symbol("one")], equals(1));
    });

## Invoke

    class Obj {
      noArguments() => "no arguments";
      withArguments(posArg) => posArg;
    }

    var obj = new Obj();

    test("invokes a method without arguments", (){
      var invoke = _.invoke("noArguments");
      expect(invoke(obj), equals("no arguments"));
    });

    test("invokes a method with arguments", (){
      var invoke = _.invoke("withArguments", ["pos"]);
      expect(invoke(obj), equals("pos"));
    });

## Field

    class Obj {
      var field;
    }

    var obj = new Obj();

    test("invokes a getter", (){
      obj.field = "value";
      var getField = _.getField("field");
      expect(getField(obj), equals("value"));
    });

    test("invokes a setter", (){
      obj.field = "old";

      var setField = _.setField("field", "new");
      setField(obj);

      expect(obj.field, equals("new"));
    });

## Compose

    test("composes two or more functions", () {
      var compose = _.compose([_.getField("length"), _.invoke("trim")]);
      expect(compose("   abc  "), equals(3));
    });

## Partial

    func(pos1, pos2) => "$pos1 $pos2";

    test("partially applies an argument", () {
      var partial = _.partial(func, ["pos1"]);
      expect(partial("pos2"), equals("pos1 pos2"));
    });

## Tap

    add(a, b) => a + b;
    var addWithLogging = _.tap((a,b) => print("arguments are $a and $b"), add);
    expect(addWithLogging(1,2), equals(3)); //also prints arguments are 1 and 2

## Any Args

    test("ignores all args", () {
      var c = () => "RES";
      var anyArgsC = _.anyArgs(c);

      expect(anyArgsC(1,2,3), equals("RES"));
      expect(anyArgsC(one: 'one', two: 'two'), equals("RES"));
    });