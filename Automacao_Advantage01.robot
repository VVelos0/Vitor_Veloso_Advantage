*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivosLogin/caso_de_teste.robot





*** Variables ***


${BASE_URL}       https://www.advantageonlineshopping.com 
${ARQUIVO_JSON}               users.json
${URL}                    https://jsonplaceholder.typicode.com/posts/1








*** Keywords ***
Get Request Test
      Create Session   advantage    https://www.advantageonlineshopping.com 

      ${resp_servrest}=   GET On Session  advantage  /  expected_status=200
      ${resp_json}=     GET On Session  jsonplaceholder  /posts/1

      Should Be Equal As Strings          ${resp_servrest.reason}  OK
      Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident


GET Products /search
        Create Session    advantage          ${BASE_URL}
        ${resposta}=    GET On Session       advantage       ${BASE_URL}      
        Should Be Equal As Strings    ${resposta.status_code}    200
        Log To Console    Resposta: ${resposta.text}   
        Set Global Variable    ${resposta}




POST product /image 
    ${payload}=      Create Dictionary   
    ...           id=0
    ...    "imageColor"= "azul"     
    ...    "imageId"= "amarelo"     
    ...    "reason"= "vermelho"     
    ...    "success"= true 
  
    
         Create Session    advantage   ${BASE_URL}
         ${resposta}=      POST On Session    advantage   /image   json=${payload}
         Log To Console        resposta: ${resposta.content}    
         Set Global Variable      ${resposta}




Criar sessão na advantage
     ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=advantage    url=https://www.advantageonlineshopping.com  headers=${headers}


Validar Status Code "200"       
             Log    ${resposta.status_code}
             Log    ${resposta.json()}




Validar Code "${statuscode}"    
    ${resposta}=    Create Dictionary    status_code=200    






Validar Status Code     
              Create Session    my_session    ${URL}
    ${resposta}       Get Request   my_session    /
    Log               Status Code: ${resposta.status_code}
    Should Be Equal As Numbers    ${resposta.status_code}    200
    Log               JSON Body: ${resposta.json()}




Validar Status Code "${StatusCode}"
    Should Be True  ${resposta.status_code} == ${StatusCode}

