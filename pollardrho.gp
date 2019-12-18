\\pollardrho.gp
\\Ganyuan Cao
\\2019/3/30
\\Pari/GP



\\Pollard rho for discrete log in multiplicative group
rho_dl_fp(g,h,fp,N)=
{
    local(x_l,a_l,b_l,X0,X1,Xj,Xjm1,flag=0,j,m);
    \\initialize list to store X_j, a_i,b_i
    x_l = []; a_l = []; b_l = [];
    \\initialize the random integer X0
    X0 = Mod(g^3*h^5,fp);
    \\compute X1 first
    if(Mod(lift(X0),3) == 0,
        X1 = Mod(g^(3+4)*h^(5+3),fp);
        a_l = concat(a_l,7);b_l = concat(b_l,8);
      );
    if(Mod(lift(X0),3) == 1,
        X1 = Mod(g^(3+9)*h^(5+7),fp);
        a_l = concat(a_l,12);b_l = concat(b_l,12);
      );
    if(Mod(lift(X0),3) == 2,
        X1 = Mod(g^(3+19)*h^(5+6),fp);
        a_l = concat(a_l,22);b_l = concat(b_l,11);
      );
    x_l = concat(x_l,X1);
    \\iteratively compute from X2
    j = 2;
    while(flag == 0,
        Xjm1 = x_l[j-1];
        if(Mod(lift(Xjm1),3) == 0,
            Xj = Mod(g^(a_l[j-1]+4)*h^(b_l[j-1]+3),fp);
            a_l = concat(a_l,a_l[j-1]+4);b_l = concat(b_l,b_l[j-1]+3);
          );
        if(Mod(lift(Xjm1),3) == 1,
            Xj = Mod(g^(a_l[j-1]+9)*h^(b_l[j-1]+7),fp);
            a_l = concat(a_l,a_l[j-1]+9);b_l = concat(b_l,b_l[j-1]+7);
          );
        if(Mod(lift(Xjm1),3) == 2,
            Xj = Mod(g^(a_l[j-1]+19)*h^(b_l[j-1]+6),fp);
            a_l = concat(a_l,a_l[j-1]+19);b_l = concat(b_l,b_l[j-1]+6);
          );

        x_l = concat(x_l,Xj);


        if(Mod(j,2) == 0,
            k = j/2;
            \\Print the stored data : X_2j,X_j,a_2j,a_j,b_2j,b_j
            print("X_"j " is " lift(Xj) ", X_"k " is " lift(x_l[j/2]));
            print("a_"j " is " a_l[j] ", a_"k " is " a_l[j/2]);
            print("b_"j " is " b_l[j] ", b_"k " is " b_l[j/2]);
            print();
            \\check if X_2j = X_j for some j
            if(Xj == x_l[j/2],flag = 1;break(););
          );
        j = j + 1;
      );
      m = Mod((a_l[j/2]-a_l[j])/(b_l[j]-b_l[j/2]),N);
      return (m);
}









\\Pollard rho for discrete log for elliptic curve
rho_dl_ec(P,Q,fp,N)=
{
    local(e,p_l,a_l,b_l,P0,P1,Pj,Pjm1,flag=0,j,m);
    \\initialize elliptic curve over finite field
    e = ellinit([2,4],fp);
    \\initialize list to store P_j, a_i,b_i
    p_l = []; a_l = []; b_l = [];
    \\initialize the random point P0
    P0 = elladd(e, ellpow(e,P,3),ellpow(e,Q,5));
    \\compute P_1 first
    if(Mod(lift(P0[1]),3) == 0,
        P1 = elladd(e,ellpow(e,P,3+4),ellpow(e,Q,5+3));
        a_l = concat(a_l,7);b_l = concat(b_l,8);
      );
    if(Mod(lift(P0[1]),3) == 1,
        P1 = elladd(e,ellpow(e,P,3+9),ellpow(e,Q,5+7));
        a_l = concat(a_l,12);b_l = concat(b_l,12);
      );
    if(Mod(lift(P0[1]),3) == 2,
        P1 = elladd(e,ellpow(e,P,3+19),ellpow(e,Q,5+6));
        a_l = concat(a_l,22);b_l = concat(b_l,11);
      );
    p_l = concat(p_l,[P1]);
    \\iteratively compute from P2
    j = 2;
    while(flag == 0,
        Pjm1 = p_l[j-1];
        if(Mod(lift(Pjm1[1]),3) == 0,
            Pj = elladd(e,ellpow(e,P,a_l[j-1]+4),ellpow(e,Q,b_l[j-1]+3));
            a_l = concat(a_l,a_l[j-1]+4);b_l = concat(b_l,b_l[j-1]+3);
          );
        if(Mod(lift(Pjm1[1]),3) == 1,
            Pj = elladd(e,ellpow(e,P,a_l[j-1]+9),ellpow(e,Q,b_l[j-1]+7));
            a_l = concat(a_l,a_l[j-1]+9);b_l = concat(b_l,b_l[j-1]+7);
          );
        if(Mod(lift(Pjm1[1]),3) == 2,
            Pj = elladd(e,ellpow(e,P,a_l[j-1]+19),ellpow(e,Q,b_l[j-1]+6));
            a_l = concat(a_l,a_l[j-1]+19);b_l = concat(b_l,b_l[j-1]+6);
          );

        p_l = concat(p_l,[Pj]);

        if(Mod(j,2) == 0,
            k = j/2;
            \\Print the stored data : P_2j,P_j,a_2j,a_j,b_2j,b_j
            print("P_"j " is " lift(Pj) ", P_"k " is " lift(p_l[j/2]));
            print("a_"j " is " a_l[j] ", a_"k " is " a_l[j/2]);
            print("b_"j " is " b_l[j] ", b_"k " is " b_l[j/2]);
            print();
            \\check if X_2j = X_j for some j
            if(Pj == p_l[j/2],flag = 1;break(););
        );
        j = j + 1;
    );
    m = Mod((a_l[j/2]-a_l[j])/(b_l[j]-b_l[j/2]),N);
    return (m);
}












\\Pollard rho for factorization
rho_factor(x0,n)=
{
    local(x,p,q,i);
    p = gcd(x0,n);
    \\calculate x_1
    x = x0^2 + 1;
    i = 1;
    \\iterative calculate x_i
    while(p == 1,
      x = x^2 + 1;
      i = i + 1;
      \\compute gcd(x_2i,n)
      if(Mod(i,2)==0,p = gcd(x,n));
    );
    q = n/p;
    return([p,q]);
}
