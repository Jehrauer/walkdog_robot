*** Settings ***
Documentation        Suite de testes da Home Page

Library    Browser

*** Test Cases ***
Home Page deve estar online
    New Browser    browser=chromium    headless=False    ## CHAMANDO O NAVEGADOR
    New Page    https://walkdog.vercel.app    ## ABRINDO O SITE
    
  ## PROCURANDO E SELECIONANDO O TEXTO QUE QUEREMOS VALIDAR ##
    ## Criar uma variavel {Text} com o texto obtido do elemento <h1> usando Get Text
    ${Text}=    Get Text    selector=h1    
    ## O comando Log no Robot Framework é utilizado para imprimir mensagens no console durante a execução do teste
    Log    O texto obtido é: ${Text}
    ## Estamos usando Should Be Equal As Strings para comparar o texto obtido (${texto}) com o texto esperado ("Texto Esperado")
    ## Se os textos não forem iguais, o teste falhará
    Should Be Equal As Strings    ${Text}    Cuidado e diversão em cada passo 
           
    Take Screenshot    ### GRAVAR A EVIDENCIA ###