part of fp_test;

class PropertyTest {
  var field;
}

testField(){
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
}