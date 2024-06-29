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
  --error|-e)
    num_files=100
    if [ -n "$2" ]; then
      num_files=$2
    fi
    mkdir -p errorx
    for ((i=1; i<=num_files; i++)); do
      echo "error$i/error$i.txt" > "errorx/error$i.txt"
      echo "Nazwa skryptu: $SCRIPT_NAME" >> "errorx/error$i.txt"
      date >> "errorx/error$i.txt"
    done
    ;;
  --init)
    git clone "$REPO_URL" cloned_repo
    export PATH=$PATH:$(pwd)/cloned_repo
    echo "Repozytorium sklonowane i zaktualizowano PATH."
    ;;
  --help|-h)
    echo "Użycie: $SCRIPT_NAME [OPCJA]"
    echo "--date, -d       Wyświetla dzisiejszą datę"
    echo "--logs, -l [N]   Tworzy N plików dziennika (domyślnie: 100)"
    echo "--error, -e [N]  Tworzy N plików błędów (domyślnie: 100)"
    echo "--init           Klonuje repozytorium i aktualizuje ścieżkę"
    echo "--help, -h       Wyświetla tę wiadomość pomocy"
    ;;
  *)
    echo "Nieprawidłowa opcja. Użyj --help, aby uzyskać informacje o użyciu."
    ;;
esac
