USE clinica_medica;
SELECT * FROM agendamentos;
-- Exibir todos os pacientes cadastrados no bd
SELECT count(id) as "Total de Pacientes" from pacientes;

DESC medicos;
-- Cadastrando um novo medico
INSERT INTO medicos(nome,especialidade,crm,email)
VALUES ("Crispiano Orispildo","pediatria","CRM 44517",
"crispildo@gmail.com");

-- Exibir a quantidade de medicos pediatras
SELECT especialidade,count(id) from medicos
where especialidade = "pediatria";
-- Exibir a quantidade de medicos por especialidade
SELECT especialidade,count(id) as "Quantidade" from medicos
group by especialidade;

DESC agendamentos;

-- Exibir nome e idade dos pacientes
SELECT nome, YER(CURDATE()) - YEAR(data_nascimento) as "idade"
from pacientes;

-- EXIBIR A IDADE MÉDIA DOS PACIENTES
SELECT AVG(YEAR(CURDATE()) - YEAR(data_nascimento)) "idade média"
from pacientes;

-- QUANTIDADE DE CONSULTAR POR MÉDICO
SELECT medicos.nome, count(agendamentos.id) from medicos
left join agendamentos on medicos.id = agendamentos.medico_id
group by medicos.nome;

-- cadastrando nova consulta (agendamento) para um médico
INSERT INTO agendamentos(paciente_id,medico_id,data_hora,tipo_consulta, status)
VALUES (1,1,"2025-05-05 10:00","consulta de rotina","realizada");

-- EXIBIR O MÉDICO COM MAIS CONSULTAS
SELECT medicos.nome,COUNT(agendamentos.id) in tot_consultas from
 medicos join agendamentos on medicos.id = agendamentos.medico_id
and count(agendamentos.id) = MAX(count(agendamentos.id));