#!/bin/bash

#VARIÁVEIS
ARQ=$1
N1="1"
N2="0"
USER="root"

#VERIFICA O USUÁRIO
A0=`whoami`

#SE O USUÁRIO FOR DIFERENTE DO DEFINIDO NA VARIÁVEL USER, O PROGRAMA NÃO VAI RODAR.
if [ $A0 != $USER ];
then
        echo "Sinto muito, mas apenas o usuário root pode executar o arquivo."
        exit
fi

#LIMPA A TELA
clear

#LOOP
while [ $N1 != $N2 ];
do
        #HASH1
        P1=`sha512sum $ARQ | awk -F " " '{ print $1 }'`

        #TEMPORIZADOR
        sleep 1

        #HASH2
        P2=`sha512sum $ARQ | awk -F " " '{ print $1 }'`

        #VERIFICAÇÃO
        if [ $P1 != $P2 ];
        then
                #AVISO NA TELA
                echo "Arquivo $ARQ modificado."
        fi
done
