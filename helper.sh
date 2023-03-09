#!/bin/bash

oot_supported_hash_1="cee6bc3c2a634b41728f2af8da54d9bf8cc14099"
oot_supported_hash_2="0227d7c0074f2d0ac935631990da8ec5914597b4"
mq_supported_hash_1="079b855b943d6ad8bd1eb026c0ed169ecbdac7da"
mq_supported_hash_2="50bebedad9e0f10746a52b07239e47fa6c284d03"

sleep 2

OoT_Rom_Check() {
  IFS=$'\n'
  OOT_FILE=$(zenity --file-selection --title="Please select a Ocarina of Time rom")
  OOT_HASH=$(sha1sum $OOT_FILE)
  if [[ $OOT_HASH == *$oot_supported_hash_1* ]]; then
    echo "OoT Hash #1 Match!"
    cp $OOT_FILE $1
    OOT_INSTALLED=true
  fi

  if [[ $OOT_HASH == *$oot_supported_hash_2 ]]; then
    echo "OoT Hash #2 Match!"
    cp $OOT_FILE $1
    OOT_INSTALLED=true
  fi

  if [[ $OOT_INSTALLED == true  ]]; then
    zenity --info --text="Ocarina of Time rom installed"
  else
    zenity --info --text="Selected Ocarina of Time rom is not supported."
  fi
}

Mq_Rom_Check() {
  IFS=$'\n'
  MQ_FILE=$(zenity --file-selection --title="Please select a Master Quest rom")
  MQ_HASH=$(sha1sum $MQ_FILE)
  if [[ $MQ_HASH == *$mq_supported_hash_1* ]]; then
    echo "MQ Hash #1 Match!"
    cp $MQ_FILE $1
    MQ_INSTALLED=true
  fi

  if [[ $MQ_HASH == *$mq_supported_hash_2* ]]; then
    echo "MQ Hash #2 Match!"
    cp $MQ_FILE $1
    MQ_INSTALLED=true
  fi

  if [[ $MQ_INSTALLED == true ]]; then
    zenity --info --text="Master Quest rom installed"
  else
    zenity --info --text="Selected Master Quest rom is not supported."
  fi
}

#Starts executing here
case $1 in

  "OoT")
    OoT_Rom_Check $2
    ;;

  "MQ")
    Mq_Rom_Check $2
    ;;

  "Both")
    OoT_Rom_Check $2
    Mq_Rom_Check $2
    ;;

  *)
    echo -n ""
    ;;
esac

