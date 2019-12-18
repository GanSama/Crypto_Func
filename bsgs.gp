\\bsgs.gp
\\Ganyuan Cao
\\2019/3/30
\\Pari/GP

\\Baby-Step-Giant-Step for multiplicative group
bsgs_fp(g,h,p,N)=
{
    local(m,gi,sj,j=0,flag=0,list,log_list,index);
    \\initialize bound m
    m = ceil(sqrt(N));
    list = []; log_list=[];
    \\Baby-Step : compute g^i for 0 <= i < m iteratively
    for(i=0,m-1,
        gi = lift(Mod(g^i,p));
        list = concat(list,gi);
        log_list = concat(log_list,i);
    );
    \\sort the list
    list = vecsort(list);
    \\Giant-Step : compute h*g^(-mj) interatively and check if h*g^(-mj) = g^i for some i
    while(flag==0,
        sj = ((g^(-m))^j)*h;
        sj = lift(Mod(sj,p));
        for(k=1,length(list),
            \\check if h*g^(-mj) = g^i for some i
            if(sj==list[k],
                  flag=1; index=k;break();
              );
           );
          j = j + 1;
    );
    j = j-1;
    return (Mod(m*j+log_list[index],N));
}

\\Baby-Step-Giant-Step for elliptic curve
bsgs_ec(P,Q,fp,N)=
{
    local(e,m,iP,list,log_list,jS,j=0,flag,index);
    \\initialize the elliptic curve
    e = ellinit([2,4],11);
    \\initialize the bound m
    m = ceil(sqrt(N));
    list = []; log_list=[];
    \\Baby-Step : compute iP for 0 <= i < m iteratively
    for(i=0,m-1,
        iP = ellpow(e,P,i);
        list = concat(list,iP);
        log_list = concat(log_list,i);
    );
    \\Giant Step : Compute Q-jmP iteratively and check if Q-jmP = iP for some i
    while(flag==0,
        jmP = ellpow(e,P,j*m);
        jS = ellsub(e,Q,jmP);
        for(k=1,length(list),
            \\check if Q-jmP = iP for some i
            if(jS==list[k],flag=1; index=k; break();
              );
          );
          j = j + 1;
    );
    j = j-1;
    return (Mod(m*j+log_list[index],N));
}
