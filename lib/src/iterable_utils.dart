part of fp;

/**
 * Flattens Iterable<Iterable>.
 * Example: `_.flatten([[1,2], [3]]) // returns [1,2,3]`
 */
Iterable flatten(Iterable<Iterable> list) => list.expand((i) => i);

/**
 * Maps a list and then flattens the result.
 *
 * Example:
 *
 *   _.flatMap((a) => [a,a])([1,2]); //returns [1,1,2,2]
 */
flatMap(Function func) => (Iterable<Iterable> list) => flatten(list.map(func));

/**
 * Filters out all empty elements.
 */
Iterable compact(Iterable list) => list.where(present);

/**
 * Generates a range.
 *
 * Example: `range(2, 5); //returns [2,3,4,5]`
 */
Iterable<int> range(int start, int end){
  final r = [];
  for(var i = start; i <= end; ++i)
    r.add(i);
  return r;
}

/**
 * Returns the first element of an iterable.
 */
first(Iterable list) => list.first;

/**
 * Returns all the elements of an iterable, except the first one.
 */
Iterable rest(Iterable list) => list.skip(1);