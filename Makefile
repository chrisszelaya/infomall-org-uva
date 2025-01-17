all: hugo rsync chmod

.PHONY: pubs

hugo:
	hugo

clean:
	rm -rf uva

cp: 
	scp -r uva rivanna:www/infomall

rsync: 
	rsync -rv uva rivanna:www/infomall

chmod:
	ssh rivanna "cd www/infomall/uva; sh ../../permissions.sh"

pubs:
	# open https://docs.google.com/document/d/1M61ieHlwHs96ZL3fZCtQ_zAbgH69vnPWn2S6C1eCGqY/edit?usp=sharing
	# open https://docs.google.com/document/d/1KaJTAwEOI7fnJof24V5awyLpKhxTp7xDRoidBsOPG3M/edit?usp=sharing

	# https://docs.google.com/document/d/1wStlbgWLbfOJsCHHZgU75dbK7urfh_CakNN-7_GAd70/edit
	# gdown 1M61ieHlwHs96ZL3fZCtQ_zAbgH69vnPWn2S6C1eCGqY
	# gdown 1KaJTAwEOI7fnJof24V5awyLpKhxTp7xDRoidBsOPG3M

	# put the html zip files in folder pubs
	cd pubs; unzip -o "Publications Page.zip"
	cd pubs; unzip -o "Presentations Page.zip"
	cd pubs; mv PresentationsPage.html presentations.html
	cd pubs; mv PublicationsPage.html publications.html

	#cp pubs/*.html content/en/docs/references
	#cp pubs/*.html content/en/docs/references
	cd pubs; chmod a+x *.html
	scp pubs/publications.html rivanna:www/infomall/pubs/index.html
	scp pubs/presentations.html rivanna:www/infomall/presentations/index.html
	scp pubs/memories.html rivanna:www/infomall/memories/index.html
	# ssh rivanna "cd www/infomall/pubs; sh ../../permissions.sh"

serve:
	hugo serve

view:
	open http://localhost:1313/uva/
