\\ecfunc.gp
\\Ganyuan Cao
\\2019/2/18
\\Pari/GP

searche(e)=
{
  if(e==[], return([])); /* It wasn't an elliptic curve */
  my(group=[[0]],p=component(e.disc,1)); /* Figures out p from the curve */
  for(x=0,p-1,
    for(y=0,p-1,
	  if(ellisoncurve(e,[x,y]), group=concat(group,[[x,y]]))
    )
  );
  return(group);
}


tally(list) = my(v=vector(#list));for(j=1,#list, v[list[j]]++); return(v)

rootFinderPrime(p)=
{
    local(root);
    for(x=0,p-1,
        if(Mod(x^3-36*x^2-7*x,p) == 0,
            root = concat(root,x)
          );
        );
    return (root);
}
