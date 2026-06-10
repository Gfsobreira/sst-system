
SELECT
    status_treinamento,
    COUNT(*)
FROM vw_treinamentos
GROUP BY status_treinamento;

SELECT
    status_epi,
    COUNT(*)
FROM vw_epis
GROUP BY status_epi;

SELECT
    resultado,
    COUNT(*)
FROM vw_inspecoes
GROUP BY resultado;

SELECT
    severidade,
    COUNT(*)
FROM vw_nao_conformidades
GROUP BY severidade;

SELECT
    status_nc,
    COUNT(*)
FROM vw_nao_conformidades
GROUP BY status_nc;