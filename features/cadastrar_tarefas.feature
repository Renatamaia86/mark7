#language: pt

@sprint2
Funcionalidade: Cadastrar tarefa
    Para que eu possa organizar minhas atividades
    Sendo um usuário cadastrado
    Posso cadastrar novas tarefas

    @autenticado @nova_tarefa @Logout
    Cenario: Nova Tarefa

        Dado que eu tenho uma tarefa com os seguintes atributos:
            | nome | Fazer Compras |
            | data | 25/06/2018    |
        E eu quero tagear esta tarefa com:
            | tag          |
            | compras      |
            | supermercado |
            | ketchup      |
        Quando faço o cadastro dessa tarefa
        Então devo ver esta tarefa com o status "Em andamento"
        E devo ver somente 1 tarefa com o nome cadastrado

    @autenticado @tarefa_duplicada @Logout
    Cenario: Tarefa não pode ser duplicada

        Dado que eu tenho uma tarefa com os seguintes atributos:
            | nome | Ler um livro de Go Lang |
            | data | 25/06/2018              |
        E eu quero tagear esta tarefa com:
            | tag     |
            | Go      |
            | estudar |
            | livro   |
            | hadcore |
        Mas eu já cadastrei esta tarefa e não tinha percebido
        Quando faço o cadastro dessa tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar cadastrar
        E devo ver somente 1 tarefa com o nome cadastrado