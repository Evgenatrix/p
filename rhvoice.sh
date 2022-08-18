#! /bin/bash
# RHVoice-test -p aleksandr -dostatoxhno etoj stroki v nastroikah Foliate
# anna, aleksandr, sit
if [[ $FOLIATE_TTS_LANG_LOWER == 'ru' ]];
then
  RHVoice-test -p aleksandr -r 100 <&0 &
else
  RHVoice-test -p slt <&0 &
fi

trap 'kill $!; exit 0' INT
wait
