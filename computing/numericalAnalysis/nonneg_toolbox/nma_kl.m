function out = nma_kl(A, B0, opt)
%
% NNMA_KL : Lee&Seung's KL NMF algorithm.
% function out = nma_kl(A, B0, opt)
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
out.algo = 'KL-NNMA - Lee&Seung';
out.start_time = clock;

[m, n] = size(A);

% initialize C
if issparse(out.B)
  R = qr(out.B);
else
  R = triu(qr(out.B));
end
out.C = R \ (R' \ (out.B' * A));
out.C = out.C + R \ (R' \ (out.B' * (A - out.B * out.C)));
out.C(out.C < 0) = 0;

out.obj = kldiv(A, out.B * out.C);

for iter = 1 : opt.maxit
    if opt.verbose == 1 & mod(iter, 200) == 0
        fprintf('.');
    end	
    t1 = out.B * out.C;
    r  = A ./ t1;
    t2 = out.B' * r;
    t3 = (out.B' * ones(m, 1)) * ones(1, n);
    out.C  = out.C .* t2 ./ t3;
    
    t1 = out.B * out.C;
    r  = A ./ t1;
    t2 = r * out.C';
    t3 = ones(m, 1)* (out.C *ones(n, 1))';
    out.B  = out.B .* t2 ./ t3;

    if opt.verbose == 1 & mod(iter, 2000) == 0
        out.obj = kldiv(A, out.B * out.C);
        fprintf(' Iter %6d: obj = %e \n', iter, out.obj);
    end	
end

out.iter = iter;
out.time = etime(clock, out.start_time);
out.obj = kldiv(A, out.B * out.C);

function o = kldiv(A, B)
%
    [m, n]=size(A);
    o = 0;
    for i = 1 : m
        x = A(i, :);
        y = B(i, :);
        d = KLaBc(length(x), x, y);
        o = o + d;
    end
    
function fc = KLaBc(length, a, Bc)
    fc = 0;
    
    for i = 1 : length,
        if a(i) == 0
            fc = fc + Bc(i);
        elseif Bc(i) == 0
            fc = inf;
            break;
        else
            fc = fc + a(i) * (log(a(i) / Bc(i)) - 1) + Bc(i);
        end
    end

