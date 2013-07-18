part of fp_test;

class InvokeTest {
  noArguments() => "no arguments";
  withArguments(posArg) => posArg;
}

testInvoke(){
  group("[invoke]", (){
    var obj;

    setUp((){
      obj = new InvokeTest();
    });

    test("invokes a method without arguments", (){
      var invoke = _.invoke("noArguments");
      expect(invoke(obj), equals("no arguments"));
    });

    test("invokes a method with arguments", (){
      var invoke = _.invoke("withArguments", ["pos"]);
      expect(invoke(obj), equals("pos"));
    });

    test("throws an exception when invalid method name", (){
      var invoke = _.invoke("invalid");
      expect(() => invoke(obj), throws);
    });
  });
}