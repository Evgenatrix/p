#!/bin/bash

# --- 1. Очистка экрана ---
clear

# --- 2. Константы и переменные ---

# Путь к папке для скачивания (обычно $HOME/Видео)
DOWNLOAD_DIR="$HOME/Видео"

# Формат скачивания видео (360p)
VIDEO_FORMAT="best[height<=360]" 

# НОВЫЕ ПЕРЕМЕННЫЕ ДЛЯ ДОПОЛНИТЕЛЬНЫХ МАТЕРИАЛОВ:

# 1. Скачивать ли превью (картинку) к видео? 
# Установите 'true' для скачивания, или 'false' для пропуска.
#DOWNLOAD_THUMBNAIL="true"

# 2. Скачивать ли субтитры?
# Установите 'true' для скачивания, или 'false' для пропуска.
#DOWNLOAD_SUBS="true"

# 3. Языки субтитров (через запятую, без пробелов).
# Например: "ru,en" или "ru,en,auto" для автоматических.
# Если DOWNLOAD_SUBS=false, эта переменная игнорируется.
#SUB_LANGS="ru,en,auto"


# Проверка и создание папки
if [ ! -d "$DOWNLOAD_DIR" ]; then
    echo "Папка '$DOWNLOAD_DIR' не найдена. Создаю..."
    mkdir -p "$DOWNLOAD_DIR"
fi

# --- 3. Запрос URL ---
read -p "ВВЕДИТЕ URL: " url_identifier

if [ -z "$url_identifier" ]; then
    echo "URL не был введен. Выход."
    exit 1
fi

# --- 4. Формирование опций yt-dlp ---

YT_DLP_OPTIONS=""

# Добавляем опцию скачивания превью
if [ "$DOWNLOAD_THUMBNAIL" = "true" ]; then
    YT_DLP_OPTIONS="$YT_DLP_OPTIONS --write-thumbnail --convert-thumbnails jpg"
    echo " > Превью будет скачано."
fi

# Добавляем опции скачивания субтитров
if [ "$DOWNLOAD_SUBS" = "true" ]; then
    # --write-subs: Включает скачивание субтитров
    # --subs-langs: Указывает языки субтитров
    # --sub-format: Предпочитаемый формат (vtt, srt и т.д.)
    YT_DLP_OPTIONS="$YT_DLP_OPTIONS --write-subs --subs-langs $SUB_LANGS --sub-format best"
    echo " > Субтитры ($SUB_LANGS) будут скачаны."
fi


# --- 5. Выполнение команды yt-dlp ---
echo "Начинаю скачивание видео с форматом: $VIDEO_FORMAT"
echo "Целевая папка: $DOWNLOAD_DIR"
echo "--------------------------------------------------------"

# Выполняем команду, подставляя собранные опции
yt-dlp -f "$VIDEO_FORMAT" \
       -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" \
       $YT_DLP_OPTIONS \
       "$url_identifier"

# --- 6. Завершение ---
if [ $? -eq 0 ]; then
    echo "--------------------------------------------------------"
    echo "✅ Скачивание завершено успешно! Видео и файлы находятся в папке: $DOWNLOAD_DIR"
else
    echo "--------------------------------------------------------"
    echo "❌ Произошла ошибка при скачивании."
fi
