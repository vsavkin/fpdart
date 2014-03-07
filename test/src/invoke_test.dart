part of fp_test;

class InvokeTest {
  noArguments() => "no arguments";
  withArguments(posArg) => posArg;
}

testInvoke(){
  group("[invoke]", (){
    obj() => new InvokeTest();

    test("invokes a method without arguments", (){
      final invoke = _.invoke("noArguments");
      expect(invoke(obj()), equals("no arguments"));
    });

    test("invokes a method with arguments", (){
      final invoke = _.invoke("withArguments", ["pos"]);
      expect(invoke(obj()), equals("pos"));
    });

    test("throws an exception when invalid method name", (){
      final invoke = _.invoke("invalid");
      expect(() => invoke(obj()), throws);
    });
  });
}