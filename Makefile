doc: report/eda.html
rds: data/summary/gene_pubmed.rds

report/eda.html: report/eda.Rmd data/summary/gene_pubmed.rds data/pubmed/dc.pmid
	R ${R_OPTS} -e "rmarkdown::render('report/eda.Rmd')"
data/summary/gene_pubmed.rds: data/summary/geneNames.txt \
                              data/summary/pubmedDate.txt \
                              data/summary/geneToPubmed.txt
	script/genRDS.R
data/summary/geneNames.txt: data/gene/geneList.txt
	script/genGeneNames.sh
data/summary/pubmedDate.txt: data/pubmed/gene.pmid data/pubmed/gene.pmdate
	script/genPubmedDate.sh
data/summary/geneToPubmed.txt: data/pubmed/gene.pmid
	script/genGeneToPubmed.sh
data/pubmed/gene.pmdate: data/pubmed/gene.pmid
	script/getArticleInfo.sh
data/pubmed/dc.pmid:
	script/searchDendriticCell.sh
data/pubmed/gene.pmid: data/gene/geneList.txt
	script/linkGeneToPubmed.sh
data/gene/geneList.txt:
	script/getGeneList.sh
