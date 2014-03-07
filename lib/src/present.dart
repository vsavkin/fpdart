part of fp;

bool present(_) => _ != null;

List compact(List list) => list.where(present);