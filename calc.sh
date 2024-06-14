"""This script works as a simple calculator by operand two integer operands ex: ./calc.sh 1 + 1 
It's important that separates terms by a blanket space
"""
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

