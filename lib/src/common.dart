part of fp;

/**
 * Transforms `forEach` method into `forEach` function.
 * Usage: `forEach(fn)(iter)`
 */
forEach(Function func) => (Iterable iter) => iter.forEach(func);

/**
 * Transforms `map` method into `map` function.
 * Usage: `map(fn)(iter)`
 */
map(Function func) => (Iterable iter) => iter.map(func);

/**
 * Transforms `reduce` method into `reduce` function.
 * Usage: `reduce(fn)(iter)`
 */
reduce(Function func) => (Iterable iter) => iter.reduce(func);

/**
 * Transforms `fold` method into `fold` function.
 * Usage: `fold(init, fn)(iter)`
 */
fold(dynamic initial, Function func) => (Iterable iter) => iter.fold(initial, func);

/**
 * Transforms `any` method into `any` function.
 * Usage: `any(fn)(iter)`
 */
any(Function func) => (Iterable iter) => iter.any(func);

/**
 * Transforms `contains` method into `contains` function.
 * Usage: `contains(el)(iter)`
 */
contains(dynamic element) => (Iterable iter) => iter.contains(element);

/**
 * Transforms `elementAt` method into `elementAt` function.
 * Usage: `elementAt(index)(iter)`
 */
elementAt(int index) => (Iterable iter) => iter.elementAt(index);

/**
 * Transforms `[]` method into a function.
 * Usage: `getByKey(key)(map)`
 */
getByKey(dynamic key) => (Map map) => map[key];

/**
 * Transforms `where` method into `where` function.
 * Usage: `where(fn)(iter)`
 */
where(Function func) => (Iterable iter) => iter.where(func);

/**
 * Transforms `firstWhere` method into `firstWhere` function.
 * Usage: `firstWhere(fn)(iter)`
 */
firstWhere(Function func) => (Iterable iter) => iter.firstWhere(func);

/**
 * Transforms `lastWhere` method into `lastWhere` function.
 * Usage: `lastWhere(fn)(iter)`
 */
lastWhere(Function func) => (Iterable iter) => iter.lastWhere(func);

/**
 * Transforms `skip` method into `skip` function.
 * Usage: `skip(n)(iter)`
 */
skip(int n) => (Iterable iter) => iter.skip(n);