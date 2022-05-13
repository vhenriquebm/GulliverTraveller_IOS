
<h1> Projeto Gulliver Traveller para IOS </h1>

Essa é uma versão do website Gulliver Traveller que desenvolvi para faculdade em IOS. 

# Fluxo de cadastro do usuário

1. Desenvolvi 3 controllers para que o usuário possa cadastrar os seus dados. sendo essas telas: cadastro, adicionar endereço e confirmação. 
2. Adicionei operadores condicionais nas TextFields que somente irão habilitar o botão se o usuário atender os requisitos do sistema.
3. Todos os dados das controllers cadastro e endereço são enviados através do método prepare for segue e através de armazenamento em váriaveis até a tela
de confirmação.
4. Após receber esses dados o controller esta integrado com o framework FireBase, logo criamos uma instancia e mandamos todos esses dados
para o nosso back - end.

# Login

1. Para que fosse possível efetuar a autenticação do usuário estamos trabalhando com o FireBase Auth.


