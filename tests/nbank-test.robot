*** Settings ***
Documentation           Suite de testes
Resource            ${EXECDIR}/resources/base.robot


Test Setup          Start Session
Test Teardown       End Session


*** Test Case ***
Validar saldo inicial em R$ 1000
    [Tags]      initial_balance
    Go To Home Page
    Valid Balance            R$ 1000

Validar transação PIX com valor permitido (R$ 100)
    [Tags]      pix_success
    ${dados}      Pix Transfer

    Go To Home Page
    Valid Balance                         R$ 1000
    Go To The PIX Tranfer
    Fill PIX Form                         ${dados}
    Submit Pix
    Valid Balance                         R$ 900
    Valid Extract                         ${dados}

Validar transação PIX com valor zerado (R$ 00)
    [Tags]      pix_zero
    ${dados}      Pix Zero

    Go To Home Page
    Valid Balance                         R$ 1000
    Go To The PIX Tranfer
    Fill PIX Form                         ${dados}
    Submit Pix
    Alert Message Should Be               Oops. Transferir ZERO é osso hein...

Validar transação PIX com valor negativo (R$ -1)
    [Tags]      pix_invalid
    ${dados}      Pix Invalid

    Go To Home Page
    Valid Balance                         R$ 1000
    Go To The PIX Tranfer
    Fill PIX Form                         ${dados}
    Submit Pix
    Alert Message Should Be               Oops. Valor para PIX incorreto...