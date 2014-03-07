part of fp_test;

testSeqFunctions(){
  group("[seq functions]", (){
    test("first", (){
      expect(_.first([1,2,3,4]), equals(1));
    });

    test("rest", (){
      expect(_.rest([1,2,3,4]), equals([2,3,4]));
    });
  });
}