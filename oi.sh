#!/bin/bash
DIRETORIO=${1:-''}
DIRETORIO_DESTINO=${2:-''}

#Otimiza arquivos jpeg e png de uma determinada pasta ( primeiro parametro ) 
#e salva os otimizados em uma segunda pasta ( segundo parametro )
#uso: ./otim.sh images/ images/new/

for i in $( ls $DIRETORIO );
do
	echo $i;
	
	case $(file -b --mime-type $DIRETORIO$i) in
		"image/jpeg") jpegtran -copy none -optimize -outfile $DIRETORIO_DESTINO$i $DIRETORIO$i;;
		"image/png") pngcrush -rem alla -reduce -brute $DIRETORIO$i $DIRETORIO_DESTINO$i;;
		*) echo "   Esse arquivo não sofrerá nada, pois não é suportado.";;
	esac
done
