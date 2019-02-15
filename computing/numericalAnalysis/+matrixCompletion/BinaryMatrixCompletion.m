classdef BinaryMatrixCompletion
properties(Static = true)
    LOG_FILE = '/u/vvasuki/vishvas/work/numericalAnalysis/+matrixCompletion/results.txt';
end
methods(Static = true)
function [M] = getExample(numRows, numCols, density, rank)
    socialNet = graph.SocialNet.getArtificialSocNet(rank, numRows, numCols, density);
    M = socialNet.userGroup;
end

function [Approx] = nuclearL1Completion(KnownEntries, rank, wtNuc, wtL1, wtExpPower)
    [numRows, numCols] = size(KnownEntries);
    cvx_begin
        variable Approx(numRows, numCols);
%          minimize wtNuc*norm_nuc(Approx) + wtL1*sum(sum(abs(Approx))) + (1 - wtL1 - wtNuc)*(sum(sum(exp(wtExpPower*abs(Approx.*KnownEntries - KnownEntries)))) + norm((Approx.*(~KnownEntries)), 'fro'));
%          Without L1 penalty
%          minimize wtNuc*norm_nuc(Approx) + (1 - wtL1 - wtNuc)*(sum(sum(exp(wtExpPower*abs(Approx.*KnownEntries - KnownEntries)))) + norm((Approx.*(~KnownEntries)), 'fro'));
        minimize wtNuc*norm_nuc(Approx) + (1 - wtL1 - wtNuc)*(sum(sum(pow_pos(wtExpPower*abs(Approx - KnownEntries), 10))));
    cvx_end
end

function testApproximation(Training, targetEntries, Approx)
    r = rank(full(Approx), 0.05);
    aucApprox = statistics.ClassificationEvaluation.getAUCApprox(targetEntries, Approx(:), Inf);
    [U S V] = svds(Training, r);
    SVDApprox = U*S*V';
    aucSVDApprox = statistics.ClassificationEvaluation.getAUCApprox(targetEntries, SVDApprox(:), Inf);
    aucRandom = statistics.ClassificationEvaluation.getAUCApprox(targetEntries, zeros(size(targetEntries)), Inf);
    f = fopen(matrixCompletion.BinaryMatrixCompletion.LOG_FILE, 'a');
    fprintf(f, 'aucApprox: %d aucSVDApprox: %d aucRandom: %d \n', aucApprox, aucSVDApprox, aucRandom);
    fprintf(f, 'rank(Approx): %d density(Approx): %d \n', r, MatrixFunctions.getDensity(Approx));
    fprintf(f, 'rank(Approx): %d density(Approx): %d \n', r, MatrixFunctions.getDensity(Approx));
    fclose(f);
    fprintf(1, 'aucApprox: %d aucSVDApprox: %d aucRandom: %d \n', aucApprox, aucSVDApprox, aucRandom);
    fprintf(1, 'rank(Approx): %d density(Approx): %d \n', r, MatrixFunctions.getDensity(Approx));
end

function experiment()
    numRows = 200;
    numCols = 20;
    density = 0.12;
    wtNuc = 0.9;
    wtL1 = 0;
    wtExpPower = 10;
    rank = 10;
    fracTestEntries = 0.1;
    
    f = fopen(matrixCompletion.BinaryMatrixCompletion.LOG_FILE, 'a');
    fprintf(f, 'numRows: %d, numCols: %d, rank: %d, density: %d, wtNuc: %d, wtL1: %d, wtExpPower: %d \n', numRows, numCols, rank, density, wtNuc, wtL1, wtExpPower);
    fclose(f);
    
    [KnownEntries] = matrixCompletion.BinaryMatrixCompletion.getExample(numRows, numCols, density, rank);
    [Training, targetEntries] = linkPrediction.Predictor.removeRandomEdges(KnownEntries, 1-density);

    [Approx] = matrixCompletion.BinaryMatrixCompletion.nuclearL1Completion(Training, rank, wtNuc, wtL1, wtExpPower);
    matrixCompletion.BinaryMatrixCompletion.testApproximation(Training, targetEntries, Approx);
    
    keyboard
end
end
end