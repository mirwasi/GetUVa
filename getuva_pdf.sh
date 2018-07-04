# UVa PDF Problemset downloader
# Filename: getuva_pdf.sh
# Requires: wget

# Author: Mir Wasi Ahmed
# Reference: getpdf.sh by Rohit Yadav <rohityadav AT gmail>
# https://groups.google.com/forum/#!topic/foss-itbhu/MEnI4gyoaLo

# Modify the range to suit your needs
arrA=$(seq 1 17)
arrB=$(seq 100 129)
volume_range="$arrA $arrB"

mkdir -p pdfs

for volume in $volume_range;
do
	for serial in $(seq 0 99);
	do
		problem_id=$((100 * $volume + $serial))
			if [[ ! -f ./pdfs/$volume/$problem_id.pdf ]] && [[ ! -f ./$problem_id.pdf ]]; then    
				wget --no-check-certificate http://uva.onlinejudge.org/external/$volume/$problem_id.pdf
			fi
	done

	mkdir -p ./pdfs/$volume
	mv -n $volume*.pdf ./pdfs/$volume 2>/dev/null
done
