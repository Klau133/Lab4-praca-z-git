#!/bin/bash
REPO_URL="https://github.com/Klau133/Lab4-praca-z-git.git"
SCRIPT_NAME=$(basename "$0")

case "$1" in
  --date|-d)
    date
    ;;
  --logs|-l)
    num_files=100
    if [ -n "$2" ]; then
      num_files=$2
    fi
    for ((i=1; i<=num_files; i++)); do
      echo "log$i.txt" > "log$i.txt"
      echo "Nazwa skryptu: $SCRIPT_NAME" >> "log$i.txt"
      date >> "log$i.txt"
    done
    ;;
  --init)
    git clone "$REPO_URL" cloned_repo
    export PATH=$PATH:$(pwd)/cloned_repo
    echo "Repozytorium sklonowane i zaktualizowano PATH."
    ;;
  --help|-h)
    echo "Użycie: lab4.sh [OPCJA]"
    echo "--date           Wyświetl dzisiejszą datę"
    echo "--logs [N]       Utwórz N plików log (domyślnie: 100)"
    echo "--help           Wyświetl tę widomość pomocy"
    ;;
  *)
    echo "Nieprawidłowa opcja. Użyj --help, aby uzyskać informacje o użyciu."
    ;;
esac
