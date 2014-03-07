part of fp_test;

testFlatten(){
  group("[flatten]", (){
    test("flattens a nested list", (){
      expect(_.flatten([[1,2], [3]]), equals([1,2,3]));
    });
  });

  group("[flatMap]", (){
    test("example", (){
      final dup = _.flatMap((n) => [n, n]);
      expect(dup([1,2]), equals([1,1,2,2]));
    });
  });
}