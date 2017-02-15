doc: report/eda.html
rds: data/9606/summary/gene_pubmed.rds

report/eda.html: report/eda.Rmd data/9606/summary/gene_pubmed.rds data/9606/pubmed/dc.pmid
	R ${R_OPTS} -e "rmarkdown::render('report/eda.Rmd')"
data/dc.pmid:
	script/searchDendriticCell.sh
data/9606/summary/gene_pubmed.rds: data/9606/summary/geneNames.txt \
                                   data/9606/summary/pubmedDate.txt \
                                   data/9606/summary/geneToPubmed.txt
	script/genRDS.R
data/9606/summary/geneNames.txt: data/9606/gene/geneList.txt
	script/genGeneNames.sh
data/9606/summary/pubmedDate.txt: data/9606/pubmed/gene.pmid data/9606/pubmed/gene.pmdate
	script/genPubmedDate.sh
data/9606/summary/geneToPubmed.txt: data/9606/pubmed/gene.pmid
	script/genGeneToPubmed.sh
data/9606/pubmed/gene.pmdate: data/9606/pubmed/gene.pmid
	script/getArticleInfo.sh
data/9606/pubmed/gene.pmid: data/9606/gene/geneList.txt
	script/linkGeneToPubmed.sh
data/9606/gene/geneList.txt:
	script/getGeneList.sh
