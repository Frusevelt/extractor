#!/bin/bash

echo "Enter the exact archive location path:"
read orgarch

for arch in *.7z
do
  7z x $orgarch$arc
done
