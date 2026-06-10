

CREATE OR REPLACE VIEW public.vw_epis
 AS
 SELECT e.id_epi,
    cli.id_cliente,
    c.id_colaborador,
    c.nome,
    cli.nome_fantasia,
    de.nome_epi,
    de.categoria,
    e.data_entrega,
    e.data_validade,
    e.status_epi
   FROM epis e
     JOIN colaboradores c ON e.id_colaborador = c.id_colaborador
     JOIN clientes cli ON c.id_cliente = cli.id_cliente
     JOIN dim_epis de ON e.id_tipo_epi = de.id_tipo_epi;



CREATE OR REPLACE VIEW public.vw_inspecoes
 AS
 SELECT i.id_inspecao,
    cli.id_cliente,
    cli.nome_fantasia,
    dri.resultado,
    i.data_inspecao,
    i.tipo_inspecao,
    i.local_inspecionado
   FROM inspecoes i
     JOIN clientes cli ON i.id_cliente = cli.id_cliente
     JOIN dim_resultado_inspecao dri ON i.id_resultado = dri.id_resultado;



CREATE OR REPLACE VIEW public.vw_nao_conformidades
 AS
 SELECT nc.id_nao_conformidade,
    cli.id_cliente,
    cli.nome_fantasia,
    ds.severidade,
    dst.status_nc,
    nc.categoria,
    nc.prazo_correcao,
    nc.data_encerramento
   FROM nao_conformidades nc
     JOIN inspecoes i ON nc.id_inspecao = i.id_inspecao
     JOIN clientes cli ON i.id_cliente = cli.id_cliente
     JOIN dim_severidade_nc ds ON nc.id_severidade = ds.id_severidade
     JOIN dim_status_nc dst ON nc.id_status_nc = dst.id_status_nc;



CREATE OR REPLACE VIEW public.vw_treinamentos
 AS
 SELECT t.id_treinamento,
    cli.id_cliente,
    c.id_colaborador,
    c.nome,
    cli.nome_fantasia,
    dt.codigo AS treinamento,
    t.data_realizacao,
    t.data_validade,
    t.status_treinamento
   FROM treinamentos t
     JOIN colaboradores c ON t.id_colaborador = c.id_colaborador
     JOIN clientes cli ON c.id_cliente = cli.id_cliente
     JOIN dim_treinamentos dt ON t.id_tipo_treinamento = dt.id_tipo_treinamento;


