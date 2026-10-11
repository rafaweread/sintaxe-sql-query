--ORACLE � OPERA��ES COM SYSDATE
SELECT EXTRACT(YEAR FROM TO_DATE('23/11/1978', 'DD/MM/YYYY')) AS ANO FROM DUAL;
SELECT EXTRACT(MONTH FROM TO_DATE('23/11/1978', 'DD/MM/YYYY')) AS MES FROM DUAL;
SELECT EXTRACT(DAY FROM TO_DATE('23/11/1978', 'DD/MM/YYYY')) AS DIA FROM DUAL;

--Dias corridos do ano
SELECT 'J� se passaram '||TO_CHAR(SYSDATE, 'DDD')|| ' dias do ano '||TO_CHAR(SYSDATE, 'YYYY') AS SSS FROM DUAL;

--Diminuir um m�s
SELECT ADD_MONTHS(SYSDATE,-1) FROM DUAL;

--Somar um m�s
SELECT ADD_MONTHS(SYSDATE,1) FROM DUAL;

--Ultimo dia do m�s
SELECT TRUNC(LAST_DAY(SYSDATE)) FROM DUAL;

--Somente o Ultimo dia do m�s
SELECT EXTRACT(DAY FROM LAST_DAY(SYSDATE)) FROM DUAL;  

--Primeiro dia do m�s
SELECT TRUNC(SYSDATE,'MONTH') FROM DUAL;

--Retorna o numero do trimestre
SELECT TO_CHAR(SYSDATE,'Q') AS NUM_TRIMESTRE FROM DUAL;

--Quantidade de m�ses, apartir de uma data
SELECT MONTHS_BETWEEN(SYSDATE,'01-JAN-2013') FROM DUAL;

--Arrendonda a quantidade de meses, para baixo
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,'01-JAN-2013')) FROM DUAL;

--Arrendonda a quantidade de meses, para cima
SELECT CEIL(MONTHS_BETWEEN(SYSDATE,'01-JAN-2013')) FROM DUAL;

--Arrendonda a quantidade de meses, com duas casas decimais
SELECT ROUND((MONTHS_BETWEEN(SYSDATE,'01-JAN-2013')),2) FROM DUAL;

--Primeiro dia do ano
SELECT TRUNC(SYSDATE,'year') FROM DUAL;

--Ultimo dia do ano
SELECT TRUNC(TO_DATE('01/01/2016', 'DD/MM/YYYY'),'year')-1 FROM DUAL;

--Data escrita por extenso
SELECT TO_CHAR(SYSDATE,'dd " DE " FMMONTH " DE " YYYY','nls_date_language=portuguese') FROM DUAL;

--M�s escrito por extenso
SELECT TO_CHAR(SYSDATE,'FMMONTH " DE " YYYY','nls_date_language=portuguese') FROM DUAL;

--Nome do m�s atual (corrente) por extenso
SELECT TO_CHAR(SYSDATE,'FMMonth','nls_date_language=portuguese') FROM DUAL;

--Calculo idade
SELECT ABS(FLOOR(FLOOR(MONTHS_BETWEEN('16/09/2014',SYSDATE))/12)) FROM DUAL;

--Nome do dia da semana por extenso
SELECT TO_CHAR(SYSDATE, 'Day', 'nls_date_language=portuguese') DIA_DA_SEMANA from dual;

--Somar uma hora
SELECT TO_CHAR(SYSDATE + 1/24,'DD/MM/YYYY HH24:MI:SS') AS UMA_HORA_MAIS FROM DUAL;

--Somar ou dimunuir 5 (?) minutos.
SELECT TO_CHAR(sysdate + 5/1440,'DD/MM/YYYY HH24:MI:SS') AS CINCO_MINUTOS_MAIS FROM DUAL;
--Observa��es: 5 � a quantidade de minutos, 1440 e o total de minutos que tem em um dia.

--LISTA DE MESES
SELECT 
     ROWNUM AS MES_ID,
     TO_CHAR(TO_DATE( LEVEL,'mm'), 'MONTH', 'nls_date_language=portuguese') MES_NOME 
FROM DUAL
WHERE REGEXP_LIKE (2016,'^-?\d+(\.\d+)?$')
CONNECT BY LEVEL <=12
UNION ALL
SELECT 0 MES_ID, 'Dispon�vel se <b>ANO</b> estiver selecionado' MES_NOME FROM DUAL
WHERE NOT REGEXP_LIKE (2016,'^-?\d+(\.\d+)?$') OR 2016 IS NULL

---

SELECT FNC_GET_DIAS_UTEIS(SYSDATE, 1) AS OK FROM DUAL;

SELECT DISTINCT TO_CHAR(T.FICHAANUALANOPAGTO) AS ANO 
FROM ETURMALINA.TBFICHAANUAL T
WHERE $P{valor_bruto} = 'S'
----------------
UNION ALL
----------------
SELECT DISTINCT TO_CHAR(T.FICHAMENSALANOPAGTO) AS ANO 
FROM ETURMALINA.TBFICHAMENSAL T
WHERE $P{valor_bruto} = 'S'
----------------
UNION ALL
----------------
SELECT 'Dispon�vel se <b>Valor Bruto</b> for igual a <b>Sim</b>' ANO FROM DUAL
WHERE $P{valor_bruto} = 'N' OR $P{valor_bruto} IS NULL
ORDER BY 1 DESC


SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') AS DATA_E_HORA_INTEIRA,
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HORA_INTEIRA,
       TO_CHAR(SYSDATE, 'HH') AS HORA_H12,
       TO_CHAR(SYSDATE, 'WW') AS SEMANA,
       TO_CHAR(SYSDATE, 'W') AS SEMANA1,
       TO_CHAR(SYSDATE, 'IW') AS SEMANA2,
       TO_CHAR(SYSDATE, 'Day', 'nls_language =''BRAZILIAN PORTUGUESE''') AS NOME_DIA,
       TO_CHAR(SYSDATE, 'Month', 'nls_language =''BRAZILIAN PORTUGUESE''') AS NOME_MES,
       TO_CHAR(SYSDATE, 'YEAR', 'nls_language =''BRAZILIAN PORTUGUESE''') AS NOME_ANO,
       TO_CHAR(SYSDATE, 'DD', 'nls_date_language = PORTUGUESE') AS DIA,
       TO_CHAR(SYSDATE, 'MM', 'nls_date_language = PORTUGUESE') AS MES,
       TO_CHAR(SYSDATE, 'YYYY', 'nls_date_language = PORTUGUESE') AS ANO,
       TO_CHAR(SYSDATE, 'HH24') AS HORA_H24,
       TO_CHAR(SYSDATE, 'MI') AS MINUTO,
       TO_CHAR(SYSDATE, 'SS') AS SEGUNDO,
	   TO_CHAR(SYSDATE, 'DDD') AS QTD_DIAS,
       TO_CHAR(SYSDATE,('DAY, dd "de" FMMONTH "de" YYYY'),'nls_date_language = PORTUGUESE') AS DATA_LITERAL,
       TO_CHAR(SYSDATE,('DAY, dd "," FMMONTH "," YYYY'),'nls_date_language = AMERICAN') AS DATA_LITERAL_AMERICANA,
       TO_CHAR(SYSDATE,'yyyy-MON-dd, FMDAY','nls_date_language = AMERICAN') DATA_PADRAO_AMERICANO,
       TO_CHAR(SYSDATE,'FMDAY , dd/MM/yyyy','nls_date_language = PORTUGUESE') DATA_PADRAO_BRASIL,
       SESSIONTIMEZONE AS TIMEZONE_DA_SESSAO,
       CURRENT_DATE AS DATA_FORMATO_TIMEZONE
FROM   DUAL;

SELECT SYSDATE DATA_ATUAL,
	ADD_MONTHS(SYSDATE,-1) MENOS_UM_MES,
	ADD_MONTHS(SYSDATE,1) MAIS_UM_MES,
	LAST_DAY(SYSDATE) ULTIMO_DIA_MES,
	TRUNC(SYSDATE,'MONTH') PRIMEIRO_DIA_MES,
	MONTHS_BETWEEN(SYSDATE,'01-JAN-2001') QTD_MES,
	FLOOR(MONTHS_BETWEEN(SYSDATE,'01-JAN-2001')) ARREDONDA_ABAIXO,
	CEIL(MONTHS_BETWEEN(SYSDATE,'01-JAN-2001')) ARREDONDA_ACIMA,
	ABS(MONTHS_BETWEEN(SYSDATE,'01-JAN-2001')) VALOR_ABSOLUTO,
	ROUND((MONTHS_BETWEEN(SYSDATE,'01-JAN-2001')),2) ARREDONDA,
	TRUNC(SYSDATE,'year') PRIMEIRO_DIA_ANO,
	to_char(SYSDATE,'dd " DE " FMMONTH " DE " YYYY','nls_date_language=portuguese') DIAMES_EXTENSO,
	to_char(SYSDATE,'FMMONTH " DE " YYYY','nls_date_language=portuguese') MES_EXTENSO,
	TO_CHAR(SYSDATE,'HH24:MI') HORA_MINUTO,
	to_char(sysdate,'FMMonth','nls_date_language=portuguese') mes_corrente,
	to_date(lpad(to_char(1234),4,'0'),'hh24mi') dias_data,
	Floor(floor(months_between(SYSDATE,SYSDATE)) / 12) IDADE,
	decode(TO_NUMBER(TO_CHAR(SYSDATE,'D')),2,'segunda-feira',3,'ter�a-feira',4,'quarta-feira',
	5,'quinta-feira',6,'sexta-feira',7,'sabado',1,'domingo') dia_da_semana
FROM DUAL

select 
	round(to_number(to_date(SYSDATE,'DD/MM/RRRR') - to_date('23/11/1978','DD/MM/RRRR')))||' Dia(s) '||
	round(((to_number(to_date(SYSDATE,'DD/MM/RRRR') - to_date('23/11/1978','DD/MM/RRRR')) * 1440) -1440)/60)||' Hora(s) '||
	round((to_number(to_date(SYSDATE,'DD/MM/RRRR') - to_date('23/11/1978','DD/MM/RRRR')) * 1440) -1440)||' Minuto(s) '
from dual
------------------------------------------------

SELECT 	data_hora, 
		descricao 
FROM `compromisso` 
WHERE YEAR(data_hora) = $ano 
AND MONTH(data_hora) = $mes 
AND DAY(data_hora) = $dia

where dataexemplo >= last_day(to_date(sysdate))
------------------------------------------------

$F{DATA_MOV} == 1 ? "JANEIRO" :
$F{DATA_MOV} == 2 ? "FEVEREIRO" :
$F{DATA_MOV} == 3 ? "MAR�O" :
$F{DATA_MOV} == 4 ? "ABRIL" :
$F{DATA_MOV} == 5 ? "MAIO" :
$F{DATA_MOV} == 6 ? "JUNHO" :
$F{DATA_MOV} == 7 ? "JULHO" :
$F{DATA_MOV} == 8 ? "AGOSTO" :
$F{DATA_MOV} == 9 ? "SETEMBRO" :
$F{DATA_MOV} == 10 ? "OUTUBRO" :
$F{DATA_MOV} == 11 ? "NOVEMBRO" :
$F{DATA_MOV} == 12 ? "DEZEMBRO" :
$F{DATA_MOV} == "[]"

============================================================

TO_NUMBER(CC.CCTANO || LPAD(CC.CCTMES, 2, 0)) AS REFERENCIA,

----------------------------------------------