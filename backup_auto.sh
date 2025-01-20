if [ -d ~/Personal_Backup ]; then
    cd ~/Personal_Backup
    list=$(cat ./backup_address.log)
    for i in $list 
    do
        cp $i ~/Personal_Backup 2>> ~/Personal_Backup/backup_error.log
        error=$(cat ~/Personal_Backup/backup_error.log)
            if [ -z $error ]; then
                printf "Copia de seguridad realizada con exito"
            else
                echo "Error al realizar la copia de seguridad"
            fi
            
            echo "La base de datos ha sido actualizada"
            rm ~/Personal_Backup/backup_error.log
    done

else 
    echo "No se encontro la carpeta"
fi

