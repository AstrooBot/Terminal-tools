javac $1.java 
if [ ! -d ./.classes ]; then
    mkdir ./.classes
fi
mv *.class ./.classes
cd ./.classes
java $1 