# **Projeto Base_School**

Esta análise tem como objetivo explorar os comandos do MySQL para trazer dados e informações relevantes sobre o nosso projeto.

```Sql
Create schema base_school;
SET NAMES utf8mb4;
USE base_school;
```
- Create schema onde será criada minha tabela base_school.

- SET NAMES UTF8MB4,define o conjunto de caracteres para suportar caracteres especiais em português.
 
- Use base_schools,seleciona o banco de dados base_school para uso.


## Criando as tabelas:
```Sql
create table base_school_alunos(
    id int auto_increment primary key,
    nome varchar(100),
    data_nascimento DATE,
    genero ENUM ('Masculino','Feminino'),
    endereco text,
    telefone varchar(20),
    email varchar(100),
    data_matricula  DATE,
    ativo boolean
)AUTO_INCREMENT=1;
```


- Id: Identificador único do aluno, gerado automaticamente.
- Nome: Nome completo do aluno (até 100 caracteres).
- Data_nascimento: Data de nascimento do aluno.
- Genero: Gênero do aluno, limitado às opções 'Masculino' ou 'Feminino'.
- Endereco: Endereço residencial do aluno.
- Telefone: Número de telefone do aluno.
- Email: Endereço de e-mail do aluno (até 100 caracteres).
- Data_matricula: Data de matrícula do aluno.
- Ativo: Campo booleano que indica se o aluno está ativo na escola.


```Sql
create table base_school_cursos(
    id int auto_increment primary key,
    nome varchar(100),
    descricao text,
    carga_horario int,
    valor decimal(10,2),
    data_inicio DATE,
    data_fim DATE,
    id_professor int
)AUTO_INCREMENT=1;
```
- Id: Um identificador único para cada curso, com incremento automático.
- Nome: O nome do curso (até 100 caracteres).
- Descricao: Uma descrição detalhada do curso.
- Carga_horario: A carga horária total do curso.
- Valor: O custo do curso, com precisão de até duas casas decimais.
- Data_inicio: A data de início do curso.
- Data_fim: A data de término do curso.
- Id_professor: Um identificador que referencia o professor responsável pelo curso.

```Sql
create table base_school_notas(
    id int auto_increment primary key,
    id_aluno int,
    id_curso int,
    nota decimal(5,2),
    data_avaliacao date
)auto_increment=1;
```
- Id: Identificador único da nota, gerado automaticamente.
- Id_aluno: Identificador do aluno que recebeu a nota.
- Id_curso: Identificador do curso ao qual a nota se refere.
- Nota: A nota obtida pelo aluno, com precisão de duas casas decimais.
- Data_avaliacao: A data em que a avaliação foi realizada.


```Sql
create table base_school_professoras(
    id int auto_increment primary key,
    nome varchar(100),
    formacao text,
    experiencia text,
    salario decimal(10,2),
    data_contratacao date,
    ativo boolean not null
)auto_increment=1;
```

- Id: Identificador único da professora, gerado automaticamente.
- Nome: Nome completo da professora (até 100 caracteres).
- Formacao: Formação acadêmica ou profissional da professora.
- Experiencia: Experiência profissional ou de ensino da professora.
- Salario: Salário da professora, com precisão de duas casas decimais.
- Data_contratacao: Data em que a professora foi contratada.
- Ativo: Campo booleano que indica se a professora está atualmente ativa.


## Inserindo dados na tabela: 


```Sql
INSERT INTO base_school_alunos(nome,data_nascimento,genero,endereco,telefone,email,data_matricula,ativo) VALUES 
('Maria Silva','2004-05-15','Feminino','Rua das Flores,123','(11) 98765-4321','maria@email.com','2023-01-10',1),
('João Santos','1982-09-20','Masculino','Av. Principal, 456','(11) 91234-5678','joao@email.com','2023-02-05',1),
('Ana Oliveira', '2003-02-28','Feminino',' Rua do Sol, 789', '(11) 92345-6789', 'ana@email.com', '2023-03-15',1),
('Pedro Souza',' 1985-11-10','Masculino','Travessa da Paz, 321','(11) 93456-7890','pedro@email.com','2023-04-20',1),
('Juliana Costa','2002-08-05','Feminino','Av. Central, 789','(11) 94567-8901','juliana@email.com','2023-05-25',1),
('Lucas Pereira','1980-04-12','Masculino','Rua da Esperança, 654','(11) 95678-9012','lucas@email.com','2023-06-30',0),
('Carla Lima','2004-10-30','Feminino','Rua da Amizade, 987','(11) 96789-0123','carla@email.com','2023-07-10',1),
('Marcos Mendes','1983-07-18','Masculino','Av. dos Sonhos,234','(11) 97890-1234','marcos@email.com','2023-08-15',1),
('Patrícia Gomes','2003-12-03','Feminino','Rua da Harmonia,567','(11) 98901-2345','patricia@email.com','2024-09-20',0),
('Rafael Oliveira','1985-03-25','Masculino', 'Av. da Liberdade, 890','(11) 99012-3456','rafael@email.com','2024-10-25',1);

INSERT INTO base_school_cursos(nome,descricao,carga_horario,valor,data_inicio,data_fim,id_professor) values
('Introdução à Programação em Python','Curso introdutório sobre os fundamentos da linguagem de programação Python',40,199.99,'2022-03-01','2022-04-10',1),
('Desenvolvimento Web com HTML CSS e JavaScript','Aprenda a construir páginas web dinâmicas utilizando HTML CSS e JavaScript',60,299.99,'2022-05-15','2022-07-05',2),
('Banco de Dados e SQL para Iniciantes','Domine os conceitos básicos de bancos de dados e a linguagem SQL.',80,399.99,'2022-08-20','2022-10-15',3),
('Desenvolvimento de Aplicativos Android com Kotlin','Aprenda a criar aplicativos Android utilizando a linguagem Kotlin.',100,499.99,'2022-11-01','2023-01-15',4),
('Introdução à Inteligência Artificial','Explore os conceitos fundamentais da inteligência artificial e suas aplicações.',20,99.99,'2023-02-20','2023-03-30',5),
('Machine Learning: Fundamentos e Prática','Conheça os princípios do machine learning e aplique em projetos práticos.',30,149.99,'2023-04-15','2023-05-30',6),
('Segurança da Informação e Ethical Hacking','Aprenda sobre segurança da informação e técnicas de ethical hacking.',50,249.99,'2023-06-10','2023-08-05',7),
('Desenvolvimento de Jogos com Unity','Crie seus próprios jogos utilizando a engine Unity.',40,199.99,'2023-09-20','2023-11-10',8),
('Big Data e Análise de Dados', 'Explore o mundo do big data e aprenda técnicas de análise de dados.',20,99.99,'2023-12-01','2024-01-30',9),
('Desenvolvimento de Aplicações com Docker e Kubernetes', 'Construa, implante e gerencie aplicações usando Docker e Kubernetes.',30,149.99,'2024-02-15','2024-04-05',10);

INSERT INTO base_school_notas(id_aluno,id_curso,nota,data_avaliacao) values
(1, 1, 8.5,'2023-04-10'),
(2, 4, 7.8,'2023-05-15'),
(3, 1, 9.2,'2023-06-20'),
(4, 7, 6.9,'2023-07-25'),
(5, 1, 8.3,'2023-08-30'),
(6, 0, 9.7,'2024-03-10'),
(7, 6, 8.0,'2024-04-15'),
(8, 2, 7.5,'2024-05-20'),
(9, 3, 9.0,'2024-06-25'),
(10, 9, 8.8,'2024-07-30');

insert into base_school_professoras (nome,formacao,experiencia,salario,data_contratacao,ativo) values
('Fernanda Oliveira','Mestrado em Ciência da Computação','10 anos de experiência como desenvolvedora e professora de Python.',3000.00,'2020-01-15', 1),
('Gustavo Santos','Doutorado em Desenvolvimento Web', 'Autor de diversos livros sobre HTML, CSS e JavaScript.',3500.00, '2019-05-20', 0),
('Patricia Lima','Graduação em Banco de Dados', 'Experiência em administração de sistemas de banco de dados.', 2500.00, '2021-03-10', 0),
('Ricardo Silva', 'Especialização em Inteligência Artificial', 'Pesquisador em projetos de inteligência artificial e machine learning.', 3200.00, '2018-11-05', 0),
('Juliana Mendes','Pós-graduação em Segurança da Informação',' Consultora em segurança da informação e ethical hacking.', 2800.00, '2022-02-18', 1),
('Carlos Souza','Mestrado em Desenvolvimento de Jogos', 'Desenvolvedor de jogos e instrutor de Unity.', 3100.00, '2017-09-30', 1),
('Luciana Fernandes', 'Graduação em Análise de Dados', 'Analista de dados e especialista em big data.', 2900.00, '2016-07-12', 1),
('Pedro Oliveira', 'Especialização em DevOps','Engenheiro de software focado em práticas DevOps.', 3300.00, '2015-04-25', 1),
('Mariana Costa', 'Doutorado em Computação em Nuvem', 'Pesquisadora em tecnologias de nuvem e virtualização.', 3400.00, '2014-02-08', 1),
('Roberto Almeida', 'Graduação em Sistemas de Informação',' Analista de segurança e especialista em Docker e Kubernetes.', 2700.00, '2019-09-15', 1);
```





Vamos realizar uma consulta para identificar os alunos que possuem uma média inferior à média geral da escola. O objetivo é identificar quais alunos estão abaixo da média, possibilitando a implementação de medidas que possam ajudar a melhorar o desempenho escolar no futuro.

###### Para identificarmos a média geral da escola:
```Sql
select 
	Round(avg(nota),2) as media_total
from base_school_notas;
```
- AVG(nota): Calcula a média das notas na coluna nota.
- ROUND(..., 2): Arredonda o resultado da média para duas casas decimais.
- AS media_total: Dá um alias (media_total) ao resultado da média para facilitar a leitura dos resultados.

###### Agora filtraremos os alunos que possuem média inferior a média geral da escola

```sql
SELECT 
    id_aluno,
    ROUND(AVG(nota), 2) AS media_total
FROM 
    base_school_notas
GROUP BY 
    id_aluno
HAVING 
    ROUND(AVG(nota), 2) < (
        SELECT 
            ROUND(AVG(nota), 2) AS media_total
        FROM 
            base_school_notas
    );
```

![Media alunos abaixo ](https://github.com/user-attachments/assets/ab3ab195-adc3-4874-a36c-364cebb61206)

 ###### Vamos calcular a média de idades do alunos da escola 

```sql
SELECT 
    ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())), 0) AS IDADE_MEDIA
FROM 
    base_school_alunos
WHERE 
    ativo = TRUE;
```
![media_notas](https://github.com/user-attachments/assets/ab3ab195-adc3-4874-a36c-364cebb61206)

- ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())), 0) AS IDADE_MEDIA: Calcula a média das idades dos alunos ativos e arredonda o resultado para o número inteiro mais próximo.
- TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()): Calcula a diferença em anos entre a data de nascimento e a data atual.
- WHERE ativo = TRUE: Filtra para incluir apenas os alunos que estão ativos.

##### Agora faremos uma consulta para saber quais cursos cada aluno cursa e quais suas notas em cada curso.

```sql
SELECT 
    a.nome AS aluno, 
    c.nome AS curso,
    n.nota
FROM 
    base_school_alunos a
    LEFT JOIN base_school_notas n 
        ON a.id = n.id_aluno
    LEFT JOIN base_school_cursos c 
        ON n.id_curso = c.id;
```
- a.nome AS aluno: Seleciona o nome do aluno e o renomeia como aluno.
- c.nome AS curso: Seleciona o nome do curso e o renomeia como curso.
- n.nota: Seleciona a nota.
- LEFT JOIN base_school_notas n ON a.id = n.id_aluno:

  Realiza uma junção à esquerda com a tabela base_school_notas com base no id_aluno. Isso garante que todos os alunos sejam incluídos, mesmo que não tenham notas registradas.

- LEFT JOIN base_school_cursos c ON n.id_curso = c.id:

  Realiza uma junção à esquerda com a tabela base_school_cursos com base no id_curso. Isso garante que todas as notas associadas aos cursos sejam incluídas, mesmo que a tabela de cursos não tenha correspondência.



##### Nesta consulta veremos quantos alunos estao matriculados em cada curso.

```sql
SELECT 
    c.nome AS curso, 
    COUNT(n.id_aluno) AS numero_alunos
FROM 
    base_school_cursos c
    LEFT JOIN base_school_notas n 
        ON c.id = n.id_curso
GROUP BY 
    c.nome;
```

- c.nome AS curso: Seleciona o nome do curso e o renomeia como curso.
- COUNT(n.id_aluno) AS numero_alunos: Conta o número de alunos associados a cada curso e o renomeia como numero_alunos.
- FROM base_school_cursos c: Especifica a tabela de cursos, renomeando-a como c para uso posterior.
- LEFT JOIN base_school_notas n ON c.id = n.id_curso: Realiza uma junção à esquerda com a tabela de notas, garantindo que todos os cursos sejam incluídos, mesmo que não tenham alunos associados. A tabela de notas é renomeada como n.
- GROUP BY c.nome: Agrupa os resultados pelo nome do curso para calcular o número de alunos por curso.


Agora faremos um consulta a partir da tabela de professores para filtrarmos alguns dados.

###### Vamos ver a quantidade os professores ativo e inativos da escola
```sql
SELECT 
    CASE
        WHEN ativo = 1 THEN 'ATIVO'
        ELSE 'INATIVO'
    END AS SITUACAO_PROFESSOR,
    COUNT(*) AS quantidade
FROM 
    base_school_professoras
GROUP BY 
    ativo;
```
- CASE: Estrutura condicional que avalia o valor da coluna ativo e retorna 'ATIVO' se o valor for 1, e 'INATIVO' caso contrário.
- END AS SITUACAO_PROFESSOR: Renomeia o resultado da estrutura condicional como SITUACAO_PROFESSOR.
- COUNT(*) AS quantidade: Conta o número de registros em cada grupo e o renomeia como quantidade.
- FROM base_school_professoras: Especifica a tabela de onde os dados são extraídos.
- GROUP BY ativo: Agrupa os registros pela coluna ativo, permitindo calcular a contagem de registros para cada estado de ativo.


###### Agora calcularemos o salário máximo e minimo entre os professores ativos 

```sql
SELECT 
    MAX(salario) AS salario_maximo,
    MIN(salario) AS salario_minimo
FROM 
    base_school_professoras
WHERE 
    ativo = 1;
```

- MAX(salario) AS salario_maximo: Calcula o valor máximo da coluna salario e o renomeia como salario_maximo.
- MIN(salario) AS salario_minimo: Calcula o valor mínimo da coluna salario e o renomeia como salario_minimo.
- FROM base_school_professoras: Especifica a tabela de onde os dados são extraídos.
- WHERE ativo = 1: Filtra os registros para considerar apenas os professores ativos.

###### Calcularemos a média dos salários dos professores ativos

```sql
SELECT 
    ROUND(AVG(salario)) AS media_salarial
FROM 
    base_school_professoras
WHERE 
    ativo = 1;
```

ROUND(AVG(salario)) AS media_salarial: Calcula a média dos salários e arredonda o resultado para o número inteiro mais próximo. O resultado é renomeado como media_salarial.


###### Agora vamos calcular os professores ativos que tem o salário acima da média 

```sql
SELECT 
    nome, 
    salario
FROM 
    base_school_professoras
GROUP BY 
    nome, salario
HAVING 
    salario > (
        SELECT 
            AVG(salario) 
        FROM 
            base_school_professoras
        WHERE 
            ativo = 1
    );
![Media_salarial](https://github.com/user-attachments/assets/c11168a7-e5a6-46e5-9478-31b22f5eb212)
```
- SELECT nome, salario: Seleciona as colunas nome e salario da tabela.
- GROUP BY nome, salario: Agrupa os registros pelas colunas nome e salario. 
- HAVING salario >: Filtra os grupos para incluir apenas aqueles em que o salário é maior do que a média calculada na subconsulta.

###### Subconsulta:
- SELECT AVG(salario): Calcula a média dos salários.
- WHERE ativo = 1: Filtra os registros para considerar apenas os professores ativos

###### Vamos consultar os cursos e os professores que lecionam no curso, juntamente com o salário de cada professor:

```sql
SELECT 
    p.nome AS professor,
    c.nome AS curso,
    CONCAT('R$ ', p.salario) AS salario_formatado
FROM 
    base_school_professoras p
    LEFT JOIN base_school_cursos c 
        ON p.id = c.id_professor;
```
![professor_materia_salario](https://github.com/user-attachments/assets/6039818e-14f2-483b-a686-6aada272df41)

- p.nome AS professor: Seleciona o nome do professor e o renomeia como professor.
- c.nome AS curso: Seleciona o nome do curso e o renomeia como curso.
- CONCAT('R$ ', p.salario) AS salario_formatado: Formata o salário adicionando o prefixo 'R$ ' e renomeia o resultado como salario_formatado.
- FROM base_school_professoras p: Especifica a tabela de professores, renomeando-a como p para uso posterior.
- LEFT JOIN base_school_cursos c ON p.id = c.id_professor:

  Realiza uma junção à esquerda com a tabela de cursos, garantindo que todos os professores sejam incluídos, mesmo que não estejam associados a nenhum curso. A tabela de cursos é renomeada como c

**Conclusão**

- Os alunos da escola tem uma média de idade de 30 anos, ou seja é uma escola frequentada pessoas mais velhas.
- A média da escola gira em torno de 8.37 , podemos considerar que a escola está com uma média de notas boa , mas ao mesmo tempo 
quando analisamos os alunos vemos que 50% dos alunos estão abaixo da média da escola. A escola pode melhorar a média de nota 
caso consiga entender e analisar quais motivos estão levando alguns alunos a ficarem abaixo da média.
- Em relação aos salários conseguimos notas que não temos uma discrepância muito grande em relação ao salários, a diferença maxima fica em R$ 1.000
 e vemos que a maioria dos professores estão com salários a cima de média, entre os professores ativos.

![alunos_notas](https://github.com/user-attachments/assets/4d1e8c50-9768-4c70-8112-c3e7b9da1b3f)
![curso_quantidade_aluno](https://github.com/user-attachments/assets/4855a91e-7bfa-4c59-8dd0-a4f5ffa538ef)
![maximo_minimo_salario](https://github.com/user-attachments/assets/3db9d2aa-5f08-4f9a-84d6-f303ec922804)
![Media_idade_alunos](https://github.com/user-attachments/assets/8086ff7b-16e1-4130-aa75-86576a7cd45a)
![media_notas](https://github.com/user-attachments/assets/df8cbf0a-9234-4197-87cf-edac10381978)


![Professores_situacao](https://github.com/user-attachments/assets/138ceae4-5f3b-49c3-8e1a-9e248cf811a7)
![situacao_ativo_inativo](https://github.com/user-attachments/assets/a6f94afc-d249-442f-b408-cc33b52c257a)
