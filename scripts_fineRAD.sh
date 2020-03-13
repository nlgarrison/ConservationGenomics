### series of commands to convert stacks haplotype data for fineRADstructure pipeline and generate co-ancestry plots.
python ../Stacks2fineRAD.py -i cmodp350filt.haplotypes.tsv -n 10 -m 30
Rscript ../sampleLD.R -s 1 -n 500 cmodp350filt.haplotypes.tsv.fineRADpainter.lociFilt.txt CmodP3m50_reordered.txt
../RADpainter paint CmodP3m50_reordered.txt
../finestructure -x 100000 -y 100000 -z 1000 CmodP3m50_reordered_chunks.out CmodP3m50_chunks.mcmc.xml
../finestructure -m T -x 10000 CmodP3m50_reordered_chunks.out CmodP3m50_chunks.mcmc.xml CmodP3m50_chunks.mcmcTree.xml
Rscript ../fineRADstructurePlot.R

### filter WithCaptive input to include only captive individuals
cat populations.haplotypes.tsv | cut -f 1,2,41-59 > caponly.haplotypes.tsv

python ../Stacks2fineRAD.py -i caponly.haplotypes.tsv -n 4 -m 30
Rscript ../sampleLD.R -s 1 -n 500 caponly.haplotypes.tsv.fineRADpainter.lociFilt.txt caponly_reordered.txt
../RADpainter paint caponly_reordered.txt
../finestructure -x 100000 -y 100000 -z 1000 caponly_reordered_chunks.out caponly_chunks.mcmc.xml
../finestructure -m T -x 10000 caponly_reordered_chunks.out caponly_chunks.mcmc.xml caponly_chunks.mcmcTree.xml
Rscript ../fineRADstructurePlot_captiveonly.R
