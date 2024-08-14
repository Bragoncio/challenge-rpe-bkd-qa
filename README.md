<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=250&color=00FA9A&text=RPE%20QA&descAlign=50&descAlignY=50&textBg=false&animation=twinkling&descSize=1&stroke=E6E6FA&section=header&reversal=false">
</p> 

<h1 align="center">🚀 Projeto de Automação Challenge RPE QA Backend</h1>

<p align="center">
  <a href="#-produto">💻 Produto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-stack">⚙ Stack</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-estrutura">🌌 Estrutura</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-execução">⏩ Execução</a>
</p>

<p align="center">
  <img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white">
  <img alt="Cucumber" src="https://img.shields.io/badge/Cucumber-23D96C?style=for-the-badge&logo=Cucumber&logoColor=FFFFFF">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">
</p>

<p align="center">
  <b>👤 Participante: Leonardo Braga Protasio</b>
</p>

---

## 💻 Produto

<p align="justify">
Este projeto de automação foi desenvolvido para atender ao desafio RPE QA, com foco na automação de testes de qualidade para sistemas backend.
</p>

---

## ⚙ Stack

Este projeto foi construído utilizando as seguintes tecnologias:

| **Tecnologia**   | **Descrição**                       |
| ---------------- | ----------------------------------- |
| [Ruby](https://www.ruby-lang.org/pt/)  | Linguagem de programação usada para desenvolvimento do projeto. |
| [Cucumber](https://cucumber.io/)  | Ferramenta que suporta o desenvolvimento dirigido por comportamento (BDD) com Ruby. |

---

## 🎯 Objetivo

<p align="justify">
O objetivo deste projeto de automação é executar uma grande quantidade de casos de teste de maneira confiável e repetitiva em diversos ambientes. Além disso, busca-se aprimorar a qualidade global do software, proporcionando uma cobertura mais abrangente, especialmente em testes de regressão para verificar a reincidência de defeitos anteriormente corrigidos.
</p>

---

## 🌌 Estrutura

Para organizar o projeto, ele foi dividido em várias pastas, cada uma destinada a funções específicas, proporcionando uma distribuição lógica e estruturada:

- ### **challenge-rpe-bkd-qa**
    - **Clients**
      - Contém arquivos Ruby que definem métodos para validar, manipular e lidar com dados.
    - **Mocks**
      - Contém arquivos Ruby que armazenam os dados (payloads) necessários para realizar requisições.
    - **Schemas**
      - Contém arquivos JSON que estabelecem padrões para validar as respostas das requisições.
    - **Specs**
      - Contém os arquivos ".feature" que descrevem os cenários de teste em linguagem Gherkin.
    - **Step_definitions**
      - Contém arquivos Ruby onde estão detalhados os passos (steps) correspondentes aos cenários de teste.
    - **Support**
      - Contém arquivos Ruby que especificam as configurações essenciais do projeto.

---
## ⏩ Execução

### Local

- Clone o repositório
- Baixe o Ruby - [Ruby](https://www.ruby-lang.org/pt/)
- Baixe a *Gem bundler*: ```gem install bundler```
- Executar o ```bundler install``` na raiz do projeto
- Executar o comando ```Cucumber``` para rodar os testes


