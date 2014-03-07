part of fp_test;

class InvokeTest {
  noArguments() => "no arguments";
  withPosArguments(posArg) => posArg;
  withNamedArguments({key}) => key;
}

class PropertyTest {
  var field;
}

testInvoke(){
  group("[invoke]", (){
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

    group("[getField]", (){
      test("invokes a getter", (){
        final obj = new PropertyTest()..field  = "value";
        final getField = _.getField("field");
        expect(getField(obj), equals("value"));
      });

      test("throws an exception when an invalid field name", (){
        final obj = new PropertyTest();
        final getField = _.getField("invalid");
        expect(() => getField(obj), throws);
      });
    });

    group("[setField]", (){
      test("invokes a setter", (){
        final obj = new PropertyTest()..field = "old";

        final setField = _.setField("field", "new");
        setField(obj);

        expect(obj.field, equals("new"));
      });

      test("throws an exception when an invalid field name", (){
        final obj = new PropertyTest();
        final setField = _.setField("invalid", "new");
        expect(() => setField(obj), throws);
      });
    });
  });
}