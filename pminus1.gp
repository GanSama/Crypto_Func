\\pminus1.gp
\\Ganyuan Cao
\\2019/2/23
\\Pari/GP
pminus1(a,N,B)=
{
   local(b,p,q,j);
   b = Mod(a,N);
   for(j=2,B,
      b = b^j;
   );
   b = lift(b);
   p = gcd(b-1,N);
   q = N/p;
   return ([p,q]);
}
