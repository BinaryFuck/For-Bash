#!/bin/bash
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}
echo "You are building on version: $version"

echo "Press 1(for Yes) to continue or press 0 for(no) to exit"
read versioncontinue

if [ $versioncontinue == "1" ]
then
  echo "Ok!"

  for filename in source/*
  do
    echo $filename

    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo "Not copying" $filename
    else
      echo "Copying" $filename
      cp $filename build/.
    fi

  done
  
else
  echo "Please come back when you are ready"
fi
cd build
echo "Currently in That directory follwing Files are:"
ls
echo "You are using version build: $version"
cd ../

