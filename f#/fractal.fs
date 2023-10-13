type pointi3d = int * int * int

type trianglei = point3d * point3d * point3d

val cube : ((int * int * int) trianglei list) list

let GetCube incl_sides = 
  [ for (side,trigs) in cube 
      when Set.mem side incl_sides 
      ->> trigs ]


  [ [1; 1; 1]; [1; 0; 1]; [1; 1; 1] ];
  [ [1; 0; 1]; [0; 0; 0]; [1; 0; 1] ];
  [ [1; 1; 1]; [1; 0; 1]; [1; 1; 1] ];
