#!/usr/bin/python3

# Get RRID and MESH from articles citing one of our tools on PMC

from bs4 import BeautifulSoup
import urllib.request
from joblib import Parallel, delayed
import time
import re
import requests

# REGEX COMPILATION FOR FASTER EXECUTION
regexPmid1 = re.compile('<pub-id pub-id-type="pmid">')
regexPmid2 = re.compile('</pub-id>')
regexDoi1 = re.compile('<ext-link ext-link-type="uri" xlink:href=".*">')
regexDoi2 = re.compile('</ext-link>')
regexPmc1 = re.compile('\[<article-id pub-id-type="pmid">')
regexPmc2 = re.compile('</article-id>\]')
regexMesh = re.compile('<DescriptorName UI=".*" MajorTopicYN="N">(.*)</DescriptorName>')

# NEED A CSV FILE FORMATTED AS: (RRID) \t (DOI OR PMID)
rawTotalIDsOmictools = open('totalIDsFIle.csv', 'r')

# CREATE A DICTIONARY WITH IDs / RRID FROM OMICTOOLS AND A LIST OD IDs ONLY
totalIDsOmictools = {}
IDsOmictools = []
for line in rawTotalIDsOmictools:
	d = re.findall('(.*)\t(.*)', line)	
	totalIDsOmictools[d[0][1]] = d[0][0]
	IDsOmictools.append(d[0][1])

# PRINT HEADER
print('rrid' + '\t' + 'AssociatedArticle' + '\t' + 'ArticleUsingTool' + '\t' + 'MESH')

# FUNCTION DEFINITION FOR PARALLELIZATION
def funcCited(PMCid):
	
	# (1) = FOR EVERY ID ON PMC, GET DATA
	req = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pmc&format=xml&id=PMC' + PMCid + '&format=xml'
	r  = urllib.request.Request(req)
	data = urllib.request.urlopen(r).read()
	soup = BeautifulSoup(data, 'html.parser')
	
	# GET ARTICLES IDs CITED BY (1)
	rawPmidCited = soup.find_all('pub-id', attrs={'pub-id-type': 'pmid'})
	rawDoiCited = soup.find_all('ext-link', attrs={'ext-link-type': 'uri'})
	
	# FORMAT THEM AND JOIN INTO ONE SINGLE LIST
	citedIDList = []
	for pmidCited in rawPmidCited:
		citedIDList.append(re.sub(regexPmid1, '', re.sub(regexPmid2, '', str(pmidCited))))
	for doiCited in rawDoiCited:
		if(re.search('doi', str(doiCited))):
			citedIDList.append(re.sub(regexDoi1, '', re.sub(regexDoi2, '', str(doiCited))))
	# citedID CONTAINS EVERY PMID OR DOI CITED BY (1)
	
	# IF MATCH citedID / IDsOmictools, GET ID(1), MESHS(1)
	for citedID in citedIDList:
		if(citedID in IDsOmictools):
			
			# FIND PMID FROM PMC ARTICLE
			pmidPMCid = re.sub(regexPmc1, '', re.sub(regexPmc2, '', str(soup.find_all('article-id', attrs={'pub-id-type': 'pmid'}))))
			
			# GET MESH TERM FROM eFETCH
			meshReq = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&format=xml&id=' + pmidPMCid
			rawMeshData = requests.get(meshReq)
			rawMeshList = re.findall(regexMesh, rawMeshData.text)
			
			# AND RETURN
			toPrint = totalIDsOmictools.get(citedID) + '\t' + citedID + '\t' + 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC' + PMCid + '/' + '\t' + ';'.join(rawMeshList)
			print(toPrint)
	
# PARALLEL EXECUTION
Parallel(n_jobs=-1)(delayed(funcCited)(str(i)) for i in range(4742230,4742231))



			
