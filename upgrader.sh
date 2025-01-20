read -p "¿Desea actualizar? y/n " key
if [ $key == 'y' ] 
then

	sudo dnf upgrade
fi
