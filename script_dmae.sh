#! /bin/bash
# Script para realizar o Download das declarações de quitação de débito anual do DMAE!
baixa_declaracoes(){
    baseUrl="https://scainternet.procempa.com.br/scainternet/segundaViaQuitacaoPrint.do"
    anoInicio=2011
    anoFim=2021
    ramal=""
    if [ ! -d declaracoes ]
    then
        mkdir declaracoes
    fi

    while [ $anoInicio -le $anoFim ]
    do
        echo "Baixando ano $anoInicio do ramal $ramal"
        $(wget -o declaracoes/declaracao_anual_dmae_$ramal_$anoInicio.pdf $baseUrl?criterioIdentificacaoRamal=$ramal\&ano=$anoInicio)
        ((anoInicio++))
    done
}

baixa_declaracoes 2>erro_script_dmae.log
if [ $? -eq 0 ]
then
    echo "Declarações salvas com sucesso!"
else
    echo "Houve um falha!"
fi

    