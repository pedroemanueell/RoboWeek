***Settings***
Documentation   Aqui teremos todas as palavras chaves de automoção dos projetos

***Keywords***
Dado que acesso a pagina principal
    Go To   ${base_url}

Quando submeto o meu email "${email}"
    Input Text      ${CAMPO_EMAIL}    ${email}
    Click Element   ${BOTAO_ENTRAR}

Então devo ser autenticado
    Wait Until Page Contains Element    ${DIV_DASH}

Então devo ver a mensagem "${expect_message}"
    Wait Until Element Contains     ${DIV_ALERT}     ${expect_message}   

# Cadastro de pratoss
Dado que "${produto}" é um dos meus pratos
    Set Test Variable   ${produto}

Quando faço o cadastro desse item
    Wait Until Element Is Visible       ${BOTAO_ADD}   5
    Click Element                       ${BOTAO_ADD}
    Choose File                         ${CAMPO_FOTO}     ${EXECDIR}/resources/images/${produto['foto']}
    Input Text                          ${CAMPO_NOME}     ${produto['nome']}
    Input Text                          ${CAMPO_TIPO_PRODUTO}    ${produto['tipo']}
    Input Text                          ${CAMPO_PRECO}    ${produto['preco']} 
    Wait Until Page Contains Element    ${CAMPO_FOTO}   5
    Click Element                       ${BOTAO_CADASTRAR}     

Então devo ver este prato no meu dashboard 
    Wait Until Element Contains         ${DIV_LISTA}      ${produto['nome']}