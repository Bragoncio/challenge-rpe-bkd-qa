<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=250&color=00FA9A&text=RPE%20QA&descAlign=50&descAlignY=50&textBg=false&animation=twinkling&descSize=1&stroke=E6E6FA&section=header&reversal=false">
  <h1 align="center">Projeto de Automação Challenge RPE QA</h1>
</p> 

<p align="center">
  <a href="#-produto">Produto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-stack">Stack</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-estrutura">Estrutura</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-execução">Execução</a>
</p> 

<p align="center">
  <img alt="License" src="https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white">
  <img alt="License" src="https://img.shields.io/badge/Cucumber-23D96C?style=for-the-badge&logo=Cucumber&logoColor=FFFFFF">
  <img alt="License" src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">
</p>

<p align = "center">
<b> Participante Leonardo Braga Protasio </b>
</p>

## 💻 Produto

<p> Projeto de Automação desenvolvido para atender o desafio RPE QA.</p>

## ⚙ Stack

Esse projeto foi desenvolvido com as seguintes tecnologias:

|                                        |           Tecnologias            |
| :-------------------:                  |:--------------------------------:|
| [Ruby](https://www.ruby-lang.org/pt/)  | [Cucumber](https://cucumber.io/) |   

## 🎯 Objetivo

Esse projeto de automação tem como objetivo a execução de uma grande quantidade de casos de teste de maneira confiável e repetitiva em ambientes diversos. 
Isso proporciona uma capacidade aprimorada para dimensionar a execução de casos de teste. Além disso, busca-se aprimorar a qualidade global do software, 
uma vez que os testes automatizados oferecem uma cobertura mais abrangente, especialmente na verificação de reincidência de defeitos antigos que já foram corrigidos (testes de regressão).

## 🌌 Estrutura


Para organizar o projeto, ele foi dividido em várias pastas, cada uma destinada a funções específicas, proporcionando uma distribuição lógica e estruturada.

- ### **challenge-rpe-bkd-qa**
    - ***Clients***
        - Inclui os arquivos Ruby que contêm métodos para validar, manipular e lidar com dados.

    - ***Mocks***
        - Inclui arquivos Ruby que contêm os dados (payloads) necessários para realizar requisições.

    - ***Schemas***
        - Inclui arquivos JSON que estabelecem um padrão para validar as respostas das nossas requisições.

    - ***Specs***
        - Inclui os arquivos ".feature" que descrevem os cenários de teste em linguagem Gherkin.

    - ***Step_definitions***
        - Inclui os arquivos Ruby onde estão detalhados os passos (steps) correspondentes aos cenários de teste definidos.

    - ***Support***
        - Inclui os arquivos Ruby que especificam as configurações essenciais do projeto..


## ⏩ Execução

### Local

- Clone o repositório
- Baixe o Ruby - [Ruby](https://www.ruby-lang.org/pt/)
- Baixe a *Gem bundler*: ```gem install bundler```
- Executar o ```bundler install``` na raiz do projeto
- Executar o comando ```Cucumber``` para rodar os testes


