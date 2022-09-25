#!/bin/bash

OLD_PROJECT_NAME="hexagonal-kotlin-template"
OLD_PROJECT_PACKAGE="com.demo"
OLD_DATABASE_NAME="hexagonal_kotlin_template_db"

EXECUTE=Y
echo "<<< ATENÇÃO! Este processo vai renomear diretórios e arquivos >>>"
echo "Deseja continuar? N/y"
read EXECUTE

if [[ $EXECUTE == "y" || $EXECUTE == "Y" ]]; then
  read -p "Digite o novo nome para o [PROJETO]: " NEW_PROJECT_NAME
  read -p "Digite o novo nome para o [PACKAGE]: " NEW_PROJECT_PACKAGE
else
  echo "Abortando execução..."
  exit 0
fi


NEW_NAMESPACE=$(echo $NEW_PROJECT_NAME | sed "s/-//g") # removes from "-" to ""
NEW_DATABASE_NAME=$(echo $NEW_PROJECT_NAME | sed "s/-/_/g")"_db" #changes - for _

DOT="."
SLASH="/"
NEW_FOLDER_NAME=$(echo "${NEW_PROJECT_PACKAGE//$DOT/$SLASH}")

echo "NEW_PROJECT_NAME = $NEW_PROJECT_NAME"
echo "NEW_PROJECT_PACKAGE = $NEW_PROJECT_PACKAGE"
echo "NEW_NAMESPACE = $NEW_NAMESPACE"
echo "NEW_DATABASE_NAME = $NEW_DATABASE_NAME"
echo "NEW_FOLDER_NAME = $NEW_FOLDER_NAME"

replace() {
 case "$OSTYPE" in
   darwin*) grep -rl --exclude-dir={build,out,.idea,.git} "$1" . | LC_ALL=C xargs sed -i "" -e "s/$1/$2/g" ;;

   *) grep -rl --exclude-dir={build,out,.idea,.git} "$1" . | xargs sed -i "s/$1/$2/g" ;;
 esac
}

### Docker, CI, gradle, ...
replace "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"

### Namespaces
replace "$OLD_PROJECT_PACKAGE" "$NEW_NAMESPACE"

### Database
replace "$OLD_DATABASE_NAME" "$NEW_DATABASE_NAME"

### Folders
git mv "src/main/kotlin/com/demo/$OLD_PROJECT_NAME" "src/main/kotlin/$NEW_FOLDER_NAME"
git mv "src/test/kotlin/com/demo/$OLD_PROJECT_NAME" "src/test/kotlin/$NEW_FOLDER_NAME"

# Remove this file
#echo "Project renamed! Removing this script..."
#git rm -f rename-project.sh
#rm rename-project.sh

echo "Done!"
