#!/bin/bash"
echo Enter the source folder Specify the path
read files
echo Enter the destination folder for text Specify the path
read dest_text
echo Enter the destination folder for png Specify the path
read dest_png
echo Enter the destination folder for pdf Specify the path
read dest_pdf
echo Enter the destination folder for mp3 Specify the path
read dest_mp3
echo Enter the destination folder for jpeg Specify the path
read dest_jpeg

for file in $files/*
do
  file_type=`file --mime-type -b $file`

  text_file="application/vnd.oasis.opendocument.text"
  png_file="image/png"
  pdf_file="application/pdf"
  mp3_file="audio/mpeg"
  jpeg_file="image/jpeg"

  if [ "$file_type" = "$text_file" ]; then
	
	file_name=`basename $file`
	mv $file $dest_text/$file_name."txt" 

  elif [ "$file_type" = "$png_file" ]; then

	file_name=`basename $file`
	mv $file $dest_png/$file_name."png"

  elif [ "$file_type" = "$pdf_file" ]; then

	file_name=`basename $file`
    mv $file $dest_pdf/$file_name."pdf"

  elif [ "$file_type" = "$mp3_file" ]; then

	file_name=`basename $file`
    mv $file $dest_mp3/$file_name."mp3"

  elif [ "$file_type" = "$jpeg_file" ]; then

	file_name=`basename $file`
    mv $file  $dest_jpeg/$file_name."jpeg"

  else
	echo "Some other file"

  fi
done

