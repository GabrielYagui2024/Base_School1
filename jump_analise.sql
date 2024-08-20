-- Nos exemplos a seguir estarei usando a tabela base_school , referente a uma escola. 

/*
Antes da criação da tabela vamos usar os seguintes comandos :
- create schema onde será criada minha tabela base_school.
- SET NAMES uft8mb4 ,usado para permitir caracteres especiais do portugues(BR).
- Use base_school, para usar a tabela que acabou de ser criada.
*/
create schema base_School;
SET NAMES utf8mb4;
USE base_School;


/*Criando as tabelas */


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

create table base_school_notas(
	id int auto_increment primary key,
    id_aluno int,
    id_curso int,
    nota decimal(5,2),
    data_avaliacao date
)auto_increment=1;

create table base_school_professoras(
	id int auto_increment primary key,
    nome varchar(100),
    formacao text,
    experiencia text,
    salario decimal(10,2),
    data_contratacao date,
    ativo boolean not null
)auto_increment=1;




/*Inserindo dados na tabela*/

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

/* Agora faremos algumas consultas na tabela a seguir para entender um pouco da escola no geral*/

/* Aqui fazeremos uma consulta para descobrir os alunos que possuem a média menor que a média geral da escola.
Afim de saber quais alunos estão abaixo da média , podendo ajudar futuramente no aumento da média escolar*/

-- A consulta a seguir para calcularmos a média escolar
select 
	Round(avg(nota),2) as media_total
	from base_school_notas;
	
	
-- Na consulta abaixo apos calcularmos a média escolar , vamos ver quais alunos estão abaixo da média escolar.

select 
	id_aluno,
	Round(avg(nota),2) as media_total
from base_school_notas
 group by id_aluno
    having Round(avg(nota),2) < (select 
									Round(avg(nota),2) as media_total
                                    from base_school_notas
                                    );
-- Apos essas 2 consultas , conseguimos descobrir que 50% dos alunos estão com a média abaixo da média escolar.	



-- Vamos calcular a média de idades do alunos da escola 
	
	SELECT 
	ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())),0) AS IDADE_MEDIA
	FROM base_school_alunos
	WHERE ativo = TRUE;


/* Agora faremos um consulta a partir da tabela de professores para filtrarmos alguns dados*/

-- Vamos ver quantos professores atualmente ativos e inativos temos na escola 

SELECT 
   CASE
		WHEN ativo = 1 THEN 'ATIVO'
		ELSE 'INATIVO'
	END SITUACAO_PROFESSOR,
   count(*) as quantidade
FROM base_school_professoras
	group by ativo;
	

	
-- Agora calcularemos o salário máximo e minimo entre os professores ativos 
	SELECT 
	MAX(salario) AS salario_maximo,
    MIN(salario) AS salario_minimo
FROM base_school_professoras
	where ativo = 1;
	
-- Calcularemos a média dos salários dos professores ativos
SELECT 
	ROUND(AVG(salario)) AS 'media_salarial' 
FROM base_school_professoras
where ativo = 1 ;
;

-- Agora vamos calcular os professores ativos que tem o salário acima da média 

SELECT 
	nome, 
	salario
FROM base_school_professoras
	GROUP BY nome, salario
	HAVING salario > (SELECT 
							AVG(salario) 
					  FROM base_school_professoras
					  where ativo=1);
					  
					  
					  
-- Vamos consultar os cursos e os professores que lecionam no curso, juntamente com o salário de cada professor.				  
					  
	SELECT 
	p.nome AS professor,
    c.nome,
    CONCAT('R$ ', p.salario) AS salario_formatado
FROM base_school_professoras p
	LEFT JOIN base_school_cursos c 
		ON p.id = c.id_professor;
					  

-- Agora faremos uma consulta para saber quais cursos cada aluno cursa e quais suas notas em cada curso.

SELECT 
	a.nome AS aluno, 
	c.nome AS curso,
    n.nota
FROM base_school_alunos a
	LEFT JOIN base_school_notas n 
		ON a.id = n.id_aluno
	LEFT JOIN base_school_cursos c 
		ON n.id_curso = c.id;
		
-- Nesta consulta veremos quantos alunos estao matriculados em cada curso.

SELECT 
	a.nome AS aluno, 
	c.nome AS curso,
    n.nota
FROM base_school_alunos a
	LEFT JOIN base_school_notas n 
		ON a.id = n.id_aluno
	LEFT JOIN base_school_cursos c 
		ON n.id_curso = c.id;
		
		
/* Esse é meu primeiro projeto , fazendo algumas análises básicas em cima da tabela base_school , onde retrata uma escola.
Apos essas consultas conseguimos obter alguns resultados importantes para o entendimento da escola como um todo. São eles :

- Os alunos da escola tem uma média de idade de 30 anos, ou seja é uma escola frequentada pessoas mais velhas.

- A média da escola gira em torno de 8.37 , podemos considerar que a escola está com uma média de notas boa , mas ao mesmo tempo 
quando analisamos os alunos vemos que 50% dos alunos estão abaixo da média da escola. A escola pode melhorar a média de nota 
caso consiga entender e analisar quais motivos estão levando os alunos a ficarem abaixo da média.

- Em relação aos salários conseguimos notas que não temos uma discrepância muito grande em relação ao salários, a diferença maxima fica em R$ 1.000
- e vemos que a maioria dos professores estão com salários a cima de média, entre os professores ativos. */

