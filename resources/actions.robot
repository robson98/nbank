*** Settings ***
Documentation           Ações customizadas do nBank

*** Keywords ***
Go To Home Page
    Get Title       equal       nBank by QAninja
    
    Log     Checkpoint para home

    Wait For Elements State     css=.carousel       visible     5
    

Valid Balance
    [Arguments]         ${balance}
    Wait For Elements State     
    ...                         css=.navbar-item >> text= Olá Papito, seu saldo é ${balance}    visible     5


Go To The PIX Tranfer
    Click       text=Fazer PIX

    Log     Checkpoint tela do PIX

    Wait For Elements State     
    ...                         css=.modal-card-title >> text=PIX   visible     5  


Fill PIX Form
    [Arguments]         ${dados}

    Select Options By       css=.field select       text    ${dados}[bank]

    Fill Text           id=chave-pix                          ${dados}[key]
    Fill Text           css=input[placeholder="Valor"]        ${dados}[value]


Submit Pix
    Click               css=button >> text=Enviar PIX


Alert Message Should Be
    [Arguments]         ${message}

    ${element}      Set Variable        css=.media-content

    Wait For Elements State         ${element}       visible     5
    Get Text                        ${element}       equal       ${message}


Valid Extract
    [Arguments]     ${dados}

    ${element}      Set Variable        xpath=//td[contains(text(), "${dados}[key]")]/.. 

    Wait For Elements State         ${element}      visible     5

    Get Text        ${element}      contains        ${dados}[key]
    Get Text        ${element}      contains        ${dados}[account_pix]
