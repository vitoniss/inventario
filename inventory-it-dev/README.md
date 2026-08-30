# Inventory IT

Sistema web desenvolvido para auxiliar no controle e rastreamento de equipamentos de TI, permitindo cadastrar laboratórios e associar equipamentos aos locais onde estão alocados.

## Sobre o projeto

O projeto foi desenvolvido como atividade prática utilizando Java, Servlets, JPA, Hibernate, JSP e Bootstrap.

A aplicação possui um banco de dados H2 em memória para armazenar os laboratórios e equipamentos cadastrados.

## Funcionalidades

* Cadastro de laboratórios;
* Listagem de laboratórios cadastrados;
* Cadastro de equipamentos;
* Seleção do laboratório onde o equipamento está alocado;
* Listagem dos equipamentos cadastrados;
* Exibição do laboratório e bloco de cada equipamento.

## Tecnologias utilizadas

* Java
* Jakarta Servlets
* JSP
* JSTL
* JPA
* Hibernate
* H2 Database
* Bootstrap 5
* Maven
* Apache Tomcat 11

## Estrutura do projeto

```text
inventory-it/
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   └── br/com/inventory/
        │       ├── dao/
        │       │   ├── JPAUtil.java
        │       │   ├── LaboratorioDAO.java
        │       │   └── EquipamentoDAO.java
        │       │
        │       ├── modelo/
        │       │   ├── Laboratorio.java
        │       │   └── Equipamento.java
        │       │
        │       └── servlet/
        │           ├── LaboratorioServlet.java
        │           └── EquipamentoServlet.java
        │
        ├── resources/
        │   └── META-INF/
        │       └── persistence.xml
        │
        └── webapp/
            ├── index.jsp
            ├── laboratorios.jsp
            ├── equipamentos.jsp
            └── novo-equipamento.jsp
```

## Funcionamento

O sistema permite primeiro cadastrar os laboratórios da instituição.

Depois, no cadastro de um equipamento, o usuário informa o número de série e o tipo do equipamento e seleciona um dos laboratórios cadastrados.

O equipamento possui um relacionamento `ManyToOne` com a entidade `Laboratorio`, fazendo com que cada equipamento fique associado a um laboratório.

Quando um equipamento é cadastrado, o sistema recebe o ID do laboratório selecionado, busca o laboratório no banco de dados e realiza a associação antes de salvar o equipamento.

Na listagem de equipamentos, são exibidos o número de série, o tipo, o laboratório e o bloco onde o equipamento está alocado.

## Como executar

### Pré-requisitos

* JDK 17 ou superior;
* Maven;
* Apache Tomcat 11.

### Compilação

Na pasta do projeto, execute:

```bash
mvn clean package
```

Após a compilação, será gerado o arquivo `.war` dentro da pasta `target`.

### Deploy no Tomcat

Copie o arquivo `.war` gerado para a pasta:

```text
TOMCAT_HOME/webapps/
```

Inicie o Tomcat e acesse:

```text
http://localhost:8080/inventory-it/
```

## Banco de dados

O projeto utiliza o H2 Database configurado através do JPA/Hibernate.

O banco é utilizado em memória durante a execução da aplicação.

## Desenvolvido para

Projeto acadêmico desenvolvido como atividade prática de desenvolvimento web utilizando Java e Jakarta EE.
