#!/usr/bin/env bash

set -u

usage() {
    echo "Usage: $0 <Taxon identifier>"
}

# check parameter
if [ $# -eq 0 ] || [ -z "$(echo $1 | grep -x [0-9]*)" ]; then
    usage
    exit 1
else
    txid=$1
fi

script/getGeneList.sh $txid
script/getGeneInfo.sh $txid
script/genGeneNames.sh $txid
script/linkGeneToPubmed.sh $txid
script/collectPmid.sh $txid
script/genGeneToPubmed.sh $txid
script/getArticleInfo.sh $txid
script/genPubmedDate.sh $txid
script/genRDS.R $txid

export gene_pubmed=$(realpath data/$txid/summary/gene_pubmed.rds)
R ${R_OPTS} -e "rmarkdown::render('report/eda.Rmd', \
    output_file = 'eda.$txid.html')"
