DIR=/projects/textmine/Data/gene-phene/probabilisitic_predictor/testset-predictions
RESULTS_DIR=/projects/textmine/Data/gene-phene/probabilisitic_predictor/10wise_splits

rm -rf $RESULTS_DIR 2> /dev/null
mkdir -p $RESULTS_DIR

for pred in `ls $DIR`
do
    echo "Processing $pred..."
    mkdir -p $RESULTS_DIR/$pred
    for file in `ls $DIR/$pred`
    do  
        #echo "From $DIR/$pred/$file to $RESULTS_DIR/$pred/$file"
        tail -n +3 $DIR/$pred/$file > $RESULTS_DIR/$pred/$file        
    done
done
