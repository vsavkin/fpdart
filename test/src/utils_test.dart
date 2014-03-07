part of fp_test;

testUtils(){
  group("[utils]", (){
    group("[present]", (){
      test("returns false when given a null", (){
        expect(_.present(null), isFalse);
      });

      test("returns true otherwise", (){
        expect(_.present(12121), isTrue);
      });
    });

    group("[compact]", (){
      test("filters our all blank values", (){
        expect(_.compact([1,2,null,3]), equals([1,2,3]));
      });
    });

    group("[symbolize]", () {
      test("returns a map with symbolized keys", () {
        final s = _.symbolize({"one" : 1});
        expect(s[#one], equals(1));
      });
    });
  });
}