
for i in $@
do
    terminos+=($i)
done

if [ ${terminos[1]} == "+" ]
then 
    resultado=$((${terminos[0]} + ${terminos[2]}))
fi

if [ ${terminos[1]} == "-" ]
then 
    resultado=$((${terminos[0]} - ${terminos[2]}))
fi

if [ ${terminos[1]} == "/" ]
then 
    resultado=$((${terminos[0]} / ${terminos[2]}))
fi

if [ ${terminos[1]} == "x" ]
then 
	resultado=$((${terminos[0]} * ${terminos[2]}))
fi

echo $resultado

