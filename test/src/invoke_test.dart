part of fp_test;

class InvokeTest {
  noArguments() => "no arguments";
  withPosArguments(posArg) => posArg;
  withNamedArguments({key}) => key;
}

testInvoke(){
  group("[invoke]", (){
    obj() => new InvokeTest();

    test("invokes a method without arguments", (){
      final invoke = _.invoke("noArguments");
      expect(invoke(obj()), equals("no arguments"));
    });

    test("invokes a method with positional arguments", (){
      final invoke = _.invoke("withPosArguments", ["pos"]);
      expect(invoke(obj()), equals("pos"));
    });
    
    test("invokes a method with named arguments", (){
      final invoke = _.invoke("withNamedArguments", [], {"key" : "value"});
      expect(invoke(obj()), equals("value"));
    });

    test("throws an exception when invalid method name", (){
      final invoke = _.invoke("invalid");
      expect(() => invoke(obj()), throws);
    });

    test("throws an exception when invalid number of positional arguments", (){
      final invoke = _.invoke("withPosArguments", [1,2,3]);
      expect(() => invoke(obj()), throws);
    });

    test("throws an exception when invalid named argument", (){
      final invoke = _.invoke("withNamedArguments", [], {"invalid" : "value"});
      expect(() => invoke(obj()), throws);
    });
  });
}