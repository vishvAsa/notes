function out = nma_ls(A, B0, opt)
%
% NNMA_LS : Lee&Seung's least squares NMF algorithm.
% function out = nma_ls(A, B0, opt)
%
% On output, 
% out.B and out.C are non-negative factors, out.obj is objective value
%
% On input, 
% A is the target matrix 
% B0 is the initial B.
%
% OPTIONS -- This structure contains important options that control how the
% optimization procedure runs. To obtain a default structure the user can
% use 'options = solopt'. Use 'help solopt' to get a description of
% what the individual options mean.
%
% See also: solopt
%
% Version 0.2 (c) 2009  Dongmin Kim 
% 

out = getout_nma(B0);
out.algo = 'NNMA - Lee&Seung';
out.start_time = clock;

% initialize C
if issparse(out.B)
    R = qr(out.B);
else
    R = triu(qr(out.B));
end
out.C = R \ (R' \ (out.B' * A));
out.C = out.C + R \ (R' \ (out.B' * (A - out.B * out.C)));
out.C(out.C < 0) = 0;

P = out.B * out.C;

for iter = 1 : opt.maxit
    if opt.verbose == 1 & mod(iter, 200) == 0
        fprintf('.');
    end	
  
    nr = A * out.C';
    dr = P * out.C';
    
    out.B = out.B .* nr ./ (dr + opt.pad);
    
    P = out.B * out.C;
    nr = out.B' * A;
    dr = out.B' * P;
    
    out.C = out.C .* nr ./ (dr + opt.pad);
    
    if opt.verbose == 1 & mod(iter, 200) == 0
        out.obj = norm(A - out.B * out.C, 'fro');
        fprintf(' Iter %6d: obj = %e \n', iter, out.obj);
    end	
end
fprintf('\n');

out.iter = iter;
out.time = etime(clock, out.start_time);
out.obj = norm(A - P, 'fro');
