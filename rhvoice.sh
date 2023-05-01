#! /bin/bash
# https://launchpad.net/~linvinus/+archive/ubuntu/rhvoice - репозиторий RHVoice для 32 бит
# http://mxl.mirror.root.lu/mx/repo/pool/main/f/foliate/ - пакеты Foliate от MX Linux и Antix
# RHVoice-test -p aleksandr  ***Достаточно этой строки в настройках Foliate.
# anna, aleksandr, sit
if [[ $FOLIATE_TTS_LANG_LOWER == 'ru' ]];
then
  RHVoice-test -p aleksandr -r 100 <&0 &
else
  RHVoice-test -p slt <&0 &
fi

trap 'kill $!; exit 0' INT
wait
