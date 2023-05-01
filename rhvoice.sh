#! /bin/bash
# https://launchpad.net/~linvinus/+archive/ubuntu/rhvoice - репозиторий RHVoice для 32 бит
# http://mxl.mirror.root.lu/mx/repo/pool/main/f/foliate/ - пакеты Foliate от MX Linux и Antix
# https://rhvoice.su/voices/ - Голоса для RHVoice
# Информация по конфигам RHVoice для Linux, Windows, Android
# /usr/share/RHVoice/voices - Папка с языками
# /etc/RHVoice/dicts/Russian/ - Папка для пользовательских словарей
#
# RHVoice-test -p aleksandr  ***Достаточно этой строки в настройках Foliate.
# anna, aleksandr, sit, mikhail, evgeniy-rus, artemiy и др.(имена голосов см. на rhvoice.su)
if [[ $FOLIATE_TTS_LANG_LOWER == 'ru' ]];
then
  RHVoice-test -p aleksandr -r 100 <&0 &
else
  RHVoice-test -p slt <&0 &
fi

trap 'kill $!; exit 0' INT
wait
