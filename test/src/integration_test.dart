part of fp_test;

class Person {
  var id;
  Person(this.id);

  salary() => 10000;
}

class Company{
  List<Person> employees;
  Company(this.employees);
}

testIntegration() {
  group("[integration]", () {
    test("idReader", () {
      withDefault(defaultValue) => (val) => val == null ? defaultValue : val;
      field(name) => _.compose([withDefault('--'), _.getField(name)]);
      var idReader = field("id");

      expect(idReader(new Person(null)), equals('--'));
      expect(idReader(new Person(100)), equals(100));
    });
  });
}