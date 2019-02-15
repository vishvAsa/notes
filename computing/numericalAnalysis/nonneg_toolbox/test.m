function out = test
    opt = solopt;
    load HST_tensor.mat 
    load materials.mat
    load swim_img.mat 
    load tensor_parafac.mat  
    load tensor_tucker.mat
    % B0= rand(size(A,1), min(size(A,2) - 1, 5));

    B0 = rand(size(A));
    
%     Flaw???: No facility to input size of matreces B and C.. 
    
    m=800;
    A1 = rand(m);
    B1_0  = rand(size(A1, 1), 5);
    opt.maxit = 40;
%     out = testNmaAls(A,B0,opt,A1,B1_0);
%     pause;
%     out =     test_nma_ls(A,B0,opt,A1,B1_0)
%     pause;
    opt.fn_maxit = 5;
%     out =     test_fnmai(A,B0,opt,A1,B1_0)
    pause;
    out =     test_fnmae(A,B0,opt,A1,B1_0)
%     pause;
%     out =     test_nls(A)
%     pause;

function out = testNmaAls(A,B0,opt,A1,B1_0)
%     out = nma_als(A,B0,opt)
    % Test data: A from sample file, B0 random, opt default.
    % Result: Took long time; return sol filled with NaN.

    out = nma_als(A1,B1_0,opt)
    % Test data: A1 rand(m), .
    % Result: worked for m=40, 400, 800.

function out = test_nma_ls(A,B0,opt,A1,B1_0)
%     out = nma_ls(A,B0,opt)
    % Test data: A from sample file, B0 random, opt default.
    % Result: return sol filled with NaN.
    % 
    out = nma_ls(A1,B1_0,opt)
    % Test data: A1 rand(m), .
    % Result: worked for m=40, 400, 800.

function out = test_fnmai(A,B0,opt,A1,B1_0)
%     out = fnmai(A,B0,opt);
    % Test data: A from sample file, B0 random, opt default.
    % Result: return sol filled with NaN.

    out = fnmai(A1,B1_0,opt);
    % Test data: A1 rand(m), .
    % Result: worked for m=40, 400, 800 (very slow).
     
function out = test_fnmae(A,B0,opt,A1,B1_0)
%     opt.fn_maxit = 1;
%     out = fnmae(A,B0,opt);
    % Test data: A from sample file, B0 random, opt default.
    % Result: Ran for a long time, over 3 iterations even though I set opt.FN_MAXIT = 1;.
    % it resulted in obj=NaN, B, C filled with NaN.

    out = fnmae(A1,B1_0,opt);
    % Test data: A1 rand(m), .
    % Result: worked for m=40, 400, 800 (very slow).

    
function out = test_fnmta(A,B0,opt,A1,B1_0)
    % Testing fnmta
    out = fnmta(A,B0,opt);
    % 

function out = test_nls(A)
    b = rand(size(A, 1), 1);
    x = A\b;
    x0 = rand(size(A, 2), 1);
    out = solnls(A, b, x0, opt)
    norm(out.x - x)/norm(x)
    % Test data: A from sample file, b random, x0 random, opt default.
    % Result: A solution with a large residue.

    out = bbkl(A, b, x0, opt)
    norm(out.x - x)/norm(x)
    % Test data: A from sample file, b random, x0 random, opt default.
    % Result: A solution with a large error.

