while true; do
echo "I am Infinite"
done

#----------------------------
I=20
while [[ I -gt 10 ]]; do
echo "I am finite till $I"
((I--))
done