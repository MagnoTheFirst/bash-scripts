echo "Start!"
yaml=$' <<EOF\n images:\n'

while read i; do
  image=$(awk 'NR == 1 {print $1}' image.txt); echo $image
  yaml+=$'name: '  
  yaml+=$image
  yaml+=$'\nEOF'
  echo -e $yaml>image-values.yaml
  	
done <image.txt
