LIB "tst.lib"; tst_init();
// ----- 1.  setting up the algebra
  ring R = 0,(e,f,h),dp;
  matrix D[3][3];
  D[1,2]=-h; D[1,3]=2*e; D[2,3]=-2*f;
  def A=nc_algebra(1,D); setring A;
// ----- equivalently, you may use the following:
//  LIB "ncalg.lib";
//  def A = makeUsl2();
//  setring A;
// ----- 2.  defining the set S
  ideal S = e^3, f^3, h^3 - 4*h;
  option(redSB);
  option(redTail);
  option(prot);  // let us activate the protocol
  ideal L = std(S);
  L;
  vdim(L); // the vector space dimension of the module A/L
  option(noprot); // turn off the protocol
  ideal T = twostd(S);
  T;
  vdim(T);  // the vector space dimension of the module A/T
  print(matrix(reduce(L,T)));  // reduce L with respect to T
  // as we see, L is included in the left ideal generated by T
  print(matrix(reduce(T,L)));  // reduce T with respect to L
  // the non-zero elements belong to T only
  ideal LT = twostd(L); // the two-sided Groebner basis of L
  // LT and T coincide as left ideals:
  size(reduce(LT,T));
  size(reduce(T,LT));
tst_status(1);$