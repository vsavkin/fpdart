part of fp;

present(_) => _ != null;

compact(List list) => list.where(present);