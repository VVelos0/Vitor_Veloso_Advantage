***Settings*** 
Library      requestsLibrary
Library      String
Library      JSONLibrary
Library      Collections
Resource    Automacao_Advantage.robot

***Variables*** 
${BASE_URL}     https://www.advantageonlineshopping.com  
${URL}           https://jsonplaceholder.typicode.com/posts/1 
${ENDPOINT}                    /product

***Test Cases*** 
Caso de cenario 01: Validar GET products 
    Criar sessão na Advantage
    GET Products /search
    Validar Status Code 
Caso de cenario 02: Validar POST products 
    Criar sessão na Advantage 
    POST product /image 
    Validar Status Code 