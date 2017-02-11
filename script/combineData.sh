#!/usr/bin/env bash

paste data/pubmed/gene.pmid data/pubmed/gene.pmdate > data/pubmedDate.txt
grep -r '' data/pubmed/? \
    | sed -e 's#^.*/##' -e 's#.pmid:# #' \
    | sort -k1n -k2n \
    | tr ' ' '\t' > data/geneToPubmed.txt
