#!/bin/bash
for file in *.hsc
do
  mv "$file" "${file##*%}"
done
