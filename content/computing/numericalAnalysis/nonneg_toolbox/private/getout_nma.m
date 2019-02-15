function out = getout_nma(B0)

% some init
    out.algo = '';
    out.obj = inf;
    out.time = '';
    out.iter = 0;
    out.rank = size(B0, 2);
    out.B = B0;
    out.C = '';
    out.start_time = '';
    
