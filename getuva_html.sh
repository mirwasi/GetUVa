# UVa PDF Problemset downloader
# Filename: getuva_html.sh
# Requires: wget

# Author: Mir Wasi Ahmed
# Reference: gethtml.sh by Rohit Yadav <rohityadav AT gmail>
# https://groups.google.com/forum/#!topic/foss-itbhu/MEnI4gyoaLo

volume_range=$(seq 1 127); # Modify the range to suit your needs
mkdir -p htmls

for volume in $volume_range;
do
	for serial in $(seq 0 99);
	do
		problem_id=$((100 * $volume + $serial))
        if [[ ! -f ./htmls/$volume/$problem_id.html ]]; then		
    		wget -p --no-parent http://uva.onlinejudge.org/external/$volume/$problem_id.html
    	fi
	done

	mkdir -p ./htmls/$volume
    mv -n ./uva.onlinejudge.org/external/$volume/* ./htmls/$volume 2>/dev/null
done

# Clean up
rm -rf ./uva.onlinejudge.org/
