# UVa PDF Problemset downloader
# Filename: getuva_pdf.sh
# Requires: wget

# Author: Mir Wasi Ahmed
# Reference: getpdf.sh by Rohit Yadav <rohityadav AT gmail>
# https://groups.google.com/forum/#!topic/foss-itbhu/MEnI4gyoaLo

volume_range=$(seq 1 127); # Modify the range to suit your needs
mkdir -p pdfs

for volume in $volume_range;
do
	for serial in $(seq 0 99);
	do
		problem_id=$((100 * $volume + $serial))
			if [[ ! -f ./pdfs/$volume/$problem_id.pdf ]]; then    
				wget http://uva.onlinejudge.org/external/$volume/$problem_id.pdf
			fi
	done

	mkdir -p ./pdfs/$volume
	mv -n $volume*.pdf ./pdfs/$volume 2>/dev/null
done

