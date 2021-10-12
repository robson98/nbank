*** Settings ***
Documentation           Arquivo Base para gerenciamento dos testes
Library         Browser
Library         String

Resource        actions.robot
Library         ${EXECDIR}/resources/factories/test_data.py


*** Keywords ***
Start Session
    New Browser     chromium    headless=False
    New Page        https://nbank.vercel.app/
    
End Session
    Take Screenshot