#!
source $(dirname $0)/config.sh

if [ -z "$($docker images -f reference=$docker_image -q)" ] ;then # if not exist image
  $(dirname $0)/build.sh
fi

if [ ! -z "$($docker images -f reference=$docker_image -q)" ] ;then # if exist image
  if [ -z "$($docker ps -a -f name=$docker_container -q)" ] ;then # if not exist container
    echo Create $docker_container ...
    $docker create -p $run_port:80 --name $docker_container $docker_image
  fi
  if [ -z "$($docker ps -f name=$docker_container -q)" ] ;then # if not runing container
    echo Start $docker_container ...
    $docker start -ia $docker_container
  else
    echo Container $docker_container already running.
  fi
else
  echo Image $docker_image not created!
fi

