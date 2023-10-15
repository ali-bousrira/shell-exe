fich_nom=number_connection-$(date +"%d-%m-%Y-%H:%M")
echo $(last | grep ali | wc -l) > "home/ali/shell-exe/job8/$fich_nom"
fich_nom_tar="$fich_nom.tar"
tar -cvf "home/ali/shell-exe/job8/$fich_nom_tar" "home/ali/shell-exe/job8/$fich_nom"
mv "home/ali/shell-exe/job8/$fich_nom_tar" "home/ali/shell-exe/job8/Backup"
rm "home/ali/shell-exe/job8/$fich_nom"
