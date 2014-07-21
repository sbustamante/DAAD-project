#==============================================================================
#	THE GASEOUS COSMIC WEB
#==============================================================================
# Sebastian Bustamante (Universidad de Antioquia), macsebas33@gmail.com

#Commit mesage to update in git repo
MSG = "Last commit"
#Name of tex file
FILE_TEX  = proposal
#Latex compiler
LATEX = pdflatex
#Viewer of pdf files
VIEWER = okular
#Latex editor
TEXEDIT = texmaker
#Current date
DATESTAMP=`date +'%Y-%m-%d'`
#Bench
BENCH = bench


pdflatex:	$(FILE_TEX).tex  
		$(LATEX) $(FILE_TEX).tex 
		bibtex ${FILE_TEX}
		$(LATEX) $(FILE_TEX).tex 
		$(LATEX) $(FILE_TEX).tex 
		#Backup of pdf file (one per day)
		mkdir -p time-machine/${DATESTAMP}
		cp ${FILE_TEX}.pdf time-machine/${DATESTAMP}/${FILE_TEX}.pdf

clean:
		rm -f $(FILE_TEX).aux
		rm -f $(FILE_TEX).out
		rm -f $(FILE_TEX).bbl
		rm -f $(FILE_TEX).log
		make -C bench/codes clean

view: 
		$(VIEWER) $(FILE_TEX).pdf &