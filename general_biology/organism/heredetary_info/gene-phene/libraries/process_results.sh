rm -rf results_probabilisiticpredictor 2> /dev/null
mkdir results_probabilisiticpredictor
for file in `ls results`
do
    tail -n +3 results/$file > results_probabilisiticpredictor/$file
done

cp -r results_probabilisiticpredictor /projects/textmine/Data/gene-phene/

