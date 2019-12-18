\\lfsr.gp
\\Ganyuan Cao
\\2019/1/27
\\Pari/GP

\\Generate LFSR sequence with n bit
lfsr_gen(tap,init,n)=
{

	\\declare local variable	
	local(tap_length,curr_sum,exp_length,new_lfsr);
	
	new_lfsr = init;

	tap_length = length(tap);
	curr_sum = 0;
	
	exp_length = length(init) + 1; 

	\\iteratively fill the LFSR list
	while(exp_length <= n,
			
		\\calculate value at certain bit
		for(i=1,tap_length,
			curr_sum = curr_sum + tap[i] * new_lfsr[exp_length-(tap_length+1)+i];
		);

		if(Mod(curr_sum,2)== 0,
			new_lfsr  = concat(new_lfsr,[0]),
			new_lfsr  = concat(new_lfsr,[1])
		  );
		 
		 curr_sum = 0;
		
		 exp_length = exp_length + 1;
	);

	return (new_lfsr);
}


\\The function is used to find the determinant
lfsr_len(v,n)=
{
	local(mx,k,ls,d,flag);
	k = 1;
	flag = floor(length(v)/2);
	flag = min(n,flag);
	ls = matrix(flag,1);
	
	while(k <= flag,
		mx = matrix(k,k);
		for(i=1,k,
			for(j=1,k,
				mx[i,j] = v[i+j-1];
			);
		);

		d = matdet(mx);
		
		if(Mod(d,2) == 1,
			ls[k,1] = [k,1],
			ls[k,1] = [k,0]
		);
		
		k = k+1;

	);
	ls = mattranspose(ls);
	return (ls);
}


\\The function is used to calculate taps for lfsr
lfsr_taps(v,n)=
{
	local(mx,k,d,inv,vc,tap);
	mx = matrix(n,n);
	vc = matrix(n,1);

	for(i=1,n,
		for(j=1,n,
			mx[i,j] = v[i+j-1];
		);
	);
	d = matdet(mx);
	inv = matsolve(mx,matid(n));

	for(i=1,n,
		vc[i,1] = v[i+n];
	);

	tap = d*inv*vc;
	
	for(i=1,n,
		if(Mod(tap[i,1],2) == 1,
			tap[i,1]=1,
			tap[i,1]=0
		);
		
	);
	tap = mattranspose(tap);
	return (tap);
}