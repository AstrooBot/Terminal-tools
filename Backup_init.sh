echo "Recuerda estar ubicado en la carpeta del archivo"
read -p "Introduzca el nombre del archivo a realizar copia de seguridad: " file

if [ ! -d ~/Personal_Backup ]; then
    echo "Creando carpeta de backup..."
    mkdir ~/Personal_Backup
fi

cp $file ~/Personal_Backup 2>> ~/Personal_Backup/backup_error.log
error=$(cat ~/Personal_Backup/backup_error.log)
if [[ -z $error ]]; then
    echo $PWD/$file >> ~/Personal_Backup/backup_address.log
    printf "Copia de seguridad realizada\nSe almacenó en ~/Personal_Backup"
else
    echo "Error al realizar la copia de seguridad"
fi
rm ~/Personal_Backup/backup_error.log
