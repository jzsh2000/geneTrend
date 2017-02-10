data/pubmed/gene.pmdate: data/pubmed/gene.pmid
	script/getArticleInfo.sh
data/pubmed/gene.pmid: data/geneList.txt
	script/linkGeneToPubmed.sh
data/geneList.txt:
	script/getGeneList.sh
