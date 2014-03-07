part of fp;

bool present(_) => _ != null;

Iterable compact(Iterable list) => list.where(present);