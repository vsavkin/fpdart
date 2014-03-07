part of fp_test;

testPresent(){
  group("[present]", (){
    test("returns false when given a null", (){
      expect(_.present(null), isFalse);
    });

    test("returns true otherwise", (){
      expect(_.present(12121), isTrue);
    });
  });
}