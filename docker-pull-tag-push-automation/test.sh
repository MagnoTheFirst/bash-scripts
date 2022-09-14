#TODO[] git pull, modify values.yaml and push it back to git must be implemented
echo "Start!"
while read p; do
  echo "$p"
  docker pull $p
  docker images | grep $p > test.txt
  
  image=$(awk 'NR == 2 {print $3}' test.txt); echo $image
  echo $image
  
  name=$(awk 'NR == 1 {print $1}' test.txt); echo $name  
  echo $name
  
  tag="docker tag $name test.artifactory.com/"
  tag+=$p
  tag+=":v"
  echo $tag

  datetime=$(date +%d%m%y)

  tag+=${datetime}
  $tag
  docker images
  #docker image rm -f $image
  #docker image rm -f $p
  #docker image rm -f $tag
done <images-to-pull.txt

#values= "$(cat images-to-pull.txt)"
#$values
#for p in ${values}
#  do
#    echo '--------'
#    echo "${p}"
#    echo '--------'
#  done
