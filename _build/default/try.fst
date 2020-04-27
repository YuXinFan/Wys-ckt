module Try
type distinct (x1:int) (x2:int) (y1:int) (y2:int) =
  x1 =!= x2 /\ x1 =!= y1 /\ x1 =!= y2 /\ x2 =!= y1 /\ x2 =!= y2 /\ y1 =!= y2

type eq_one (n:int) (x1:int) (x2:int) (x3:int) (x4:int) = n = x1 \/ n = x2 \/ n = x3 \/ n = x4

assume val sort: x1:int -> x2:int -> y1:int -> y2:int{distinct x1 x2 y1 y2}
                 -> GTot (r:(int * int * int * int){MkTuple4._1 r < MkTuple4._2 r      /\
		                           MkTuple4._2 r < MkTuple4._3 r      /\
					   MkTuple4._3 r < MkTuple4._4 r      /\
					   eq_one (MkTuple4._1 r) x1 x2 y1 y2 /\
					   eq_one (MkTuple4._2 r) x1 x2 y1 y2 /\
					   eq_one (MkTuple4._3 r) x1 x2 y1 y2 /\
					   eq_one (MkTuple4._4 r) x1 x2 y1 y2})

