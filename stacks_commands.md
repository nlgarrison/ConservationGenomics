**STACKS commands:**
===
process_radtags
===
process_radtags -P -p $raw_read_directory -o $processed_sample_directory -b $barcode_file -e sbfI -r -q --adapter_1 GATCGGAAGAGCGGTTCAGCAGGAATGCCGAGACCGATCTCGTATGCCGTCTTCTGCTTG --adapter_2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT --adapter_mm 2

denovo_map - dry run
===
denovo_map.pl --samples $processed_sample_directory --popmap Mhemb90.pop -o $sample_directory --paired -T 32 -M 3 -n 2 -d

ustacks - example command
==========
ustacks -t gzfastq -f $processed_sample_directory/$sample_name -o $sample_directory -i $sampleIDnumber --name $sample_name -p 32 -M 3

cstacks - *using wild population map*
==========
/usr/local/genome/stacks2.1/bin/cstacks -P $sample_directory -M Mhemb90.pop -p 32 -n 2

sstacks
==========
sstacks -P $sample_directory -M Mhemb90.pop -p 32

tsv2bam
==========
tsv2bam -P $sample_directory -M Mhemb90.pop -t 32 -R $processed_sample_directory

gstacks
==========
gstacks -P $sample_directory -M Mhemb90.pop -t 32
