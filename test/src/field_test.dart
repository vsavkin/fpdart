part of fp_test;

class PropertyTest {
  var field;
}

testField(){
  group("[getField]", (){
    var obj;

    setUp((){
      obj = new PropertyTest();
    });

    test("invokes a getter", (){
      obj.field = "value";
      var getField = _.getField("field");
      expect(getField(obj), equals("value"));
    });

    test("throws an exception when an invalid field name", (){
      var getField = _.getField("invalid");
      expect(() => getField(obj), throws);
    });
  });

  group("[setField]", (){
    var obj;

    setUp((){
      obj = new PropertyTest();
    });

    test("invokes a setter", (){
      obj.field = "old";

      var setField = _.setField("field", "new");
      setField(obj);

      expect(obj.field, equals("new"));
    });

    test("throws an exception when an invalid field name", (){
      var setField = _.setField("invalid", "new");
      expect(() => setField(obj), throws);
    });
  });
}