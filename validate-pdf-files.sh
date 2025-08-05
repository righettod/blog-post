#!/bin/bash
# Ensure that PDF files are valid PDF.
# Dependencies: apt install file pdfgrep
counter=0
for bp in $(ls files/*.pdf)
do
	check=$(file "$bp" | grep -Fic "PDF document")
	if [ $check -ne 1 ]
	then
		echo "[!] File '$bp' is not a PDF file!"
		exit 1
	fi
	check=$(pdfgrep -i -c "dominique righetto" "$bp")
	if [ $check -ne 1 ]
	then
		echo "[!] File '$bp' do not contains a reference to me!"
		exit 2
	fi	
	counter=$((counter + 1))
done
echo "[V] $counter files are OK."
exit 0
