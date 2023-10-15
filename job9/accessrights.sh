path=$(dirname "$0")
sovmod=$(cat "$path/sovmod")
dermod=$(date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S')

if [[ "$sovmod" != "$dermod" ]]; then
    while IFS="," read -r id prenom nom mdp role; do
        username=$(echo "$prenom.$nom" | tr '[:upper:]' '[:lower:]')

        [ ${#username} -lt 3 ] && continue

        nrole=$(echo "$role" | tr -d '\r' | cat -t)
        sudo useradd "$username"
        echo "$username:$mdp" | sudo chpasswd
        [ "$nrole" = "Admin" ] && sudo usermod -aG sudo "$username" || sudo usermod -aG users "$username"
        echo "did $username"
    done < <(tail -n +2 "$path/Shell_Userlist.csv" | tr -d " " && echo "")

 date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S' > "$path/sovmod"
fi
