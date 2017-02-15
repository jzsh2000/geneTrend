doc: report/eda.html

report/eda.html: report/eda.Rmd data/pubmedDate.txt data/geneToPubmed.txt
	R ${R_OPTS} -e "rmarkdown::render('report/eda.Rmd')"
data/geneNames.txt: data/gene/geneList.txt
	script/genGeneNames.sh
data/pubmedDate.txt: data/pubmed/gene.pmid data/pubmed/gene.pmdate
	script/genPubmedDate.sh
data/geneToPubmed.txt: data/pubmed/gene.pmid
	script/genGeneToPubmed.sh
data/pubmed/gene.pmdate: data/pubmed/gene.pmid
	script/getArticleInfo.sh
data/pubmed/gene.pmid: data/gene/geneList.txt
	script/linkGeneToPubmed.sh
data/gene/geneList.txt:
	script/getGeneList.sh
