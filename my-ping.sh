#!/bin/bash

set -e
# Ввод адреса для пинга
read -p "Введите IP адрес или доменное имя для пинга: " target
# Переменные для подсчета неудачных пингов
failed_count=0

 if [ -z "$ping_result" ]; then
        # Если пинг не прошел
        echo "Пинг неудачен"
        ((fail_count++))
    else
            if (( $(echo "$ping_result > 100" | bc -l) )); then
            echo "Время пинга превышает 100 мс: $ping_result мс"
        else
            echo "Пинг успешен: $ping_result мс"
            failed_count=0
        
        fi
    fi

    if [ $fail_count -ge 3 ]; then
        echo "Пинг не удается 3 раза подряд"
        exit 1
    fi

    sleep 1
done
