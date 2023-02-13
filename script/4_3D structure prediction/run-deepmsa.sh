#!/bin/sh
### ./run-deepmsa.sh PF02677 example/PF02677.merged.fasta example/workdir example/results
### do not share one workdir for different jobs!!!

############## set directory here
deepmsadir='/nfs/amino-home/zhengwei/DeepMSA/programs/DeepMSA_bigmetagenome'
twostep_msa='/nfs/amino-home/zhng/local_library/Pfam_MSA_KangNing/Pfam_MSA'
seq_dir='/nfs/amino-home/zhng/local_library/Pfam_MSA_KangNing/Pfam_seq'
hhblitsdb=/nfs/amino-home/zhng/local_library/uniclust30_2017_04/uniclust30_2017_04
jackhmmerdb=/nfs/amino-home/zhng/local_library/uniref90_04042018/uniref90.fasta

export HHLIB=$deepmsadir

################# input parameters
PfamName=$1   #### PFxxxx without fasta
dbfasta=$2    # lake gut soil ferm merged fasta for a Pfam
workdir=$3    #### a tmp working data directory, put copy all file here
datadir=$4    #### where the final data stores, make it diff from $twostep_msa!!!

dbfasta=$(realpath $dbfasta)
workdir=$(realpath $workdir)
datadir=$(realpath $datadir)

#echo $workdir
mkdir -p $workdir
mkdir -p $datadir
################# start here 
cd $workdir
############copy files
cp $seq_dir/$PfamName".fasta"    ./seq.fasta
cp $twostep_msa/$PfamName.hhbaln ./seq.hhbaln
cp $twostep_msa/$PfamName.hhba3m ./seq.hhba3m
cp $twostep_msa/$PfamName.jacaln ./seq.jacaln
cp $twostep_msa/$PfamName.jaca3m ./seq.jaca3m
cp $dbfasta                      ./hms.db
##### creat ssi for merged hms.db
$deepmsadir/bin/esl-sfetch --index hms.db

#### continue deepmsa stage3 search in hms.db

mkdir -p ./tmp_msa_dir
rm -rf ./tmp_msa_dir/*
echo "run deep msa..."

$deepmsadir/scripts/build_MSA3.py ./seq.fasta -ncpu=1 -hhblitsdb=$hhblitsdb -jackhmmerdb=$jackhmmerdb -hmmsearchdb=hms.db -tmpdir=tmp_msa_dir

cp seq.hmsaln          $datadir/$PfamName.hmsaln
cp seq.hmsa3m          $datadir/$PfamName.hmsa3m
cp seq.aln             $datadir/$PfamName.deepaln
cp seq.a3m             $datadir/$PfamName.deepa3m
cp seq.nofilter.aln    $datadir/$PfamName.nofilter.deepaln 
cp seq.nofilter.a3m    $datadir/$PfamName.nofilter.deepa3m

rm -rf $workdir/*
