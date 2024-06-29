#!/bin/bash

case "$1" in
  --date)
    date
    ;;
  --logs)
    num_files=100
    if [ -n "$2" ]; then
      num_files=$2
    fi
    for ((i=1; i<=num_files; i++)); do
      echo "log$i.txt" > "log$i.txt"
      echo "Nazwa skryptu: lab4.sh" >> "log$i.txt"
      date >> "log$i.txt"
    done
    ;;
  --help)
    echo "Użycie: lab4.sh [OPCJA]"
    echo "--date           Wyświetl dzisiejszą datę"
    echo "--logs [N]       Utwórz N plików log (domyślnie: 100)"
    echo "--help           Wyświetl tę widomość pomocy"
    ;;
  *)
    echo "Nieprawidłowa opcja. Użyj --help, aby uzyskać informacje o użyciu."
    ;;
esac
