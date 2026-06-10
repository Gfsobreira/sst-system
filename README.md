sst-system

SST System - Dashboard Executivo de Segurança e Saúde do Trabalho

Visão Geral
O SST System é uma solução analítica desenvolvida para apoiar a gestão de Segurança e Saúde do Trabalho (SST), consolidando indicadores operacionais e gerenciais em um ambiente único de análise.

- O projeto integra para monitoramento de:
Treinamentos obrigatórios
Controle de EPIs
Inspeções de Segurança
Não Conformidades
Indicadores de Risco SST

- Objetivo: Fornecer aos gestores uma visão consolidada da conformidade SST da organização, permitindo identificar riscos, acompanhar indicadores críticos e apoiar a tomada de decisão baseada em dados.

- Tecnologias Utilizadas: PostgreSQL e Power BI

- Modelagem: Modelo Relacional, Views SQL para consolidação dos dados e Medidas DAX

- Estrutura do Banco
Tabelas Principais
clientes
colaboradores
treinamentos
epis
inspecoes
nao_conformidades

- Views Analíticas
vw_treinamentos
vw_epis
vw_inspecoes
vw_nao_conformidades

- Indicadores Desenvolvidos
Treinamentos
  Total de Treinamentos
  Treinamentos Vigentes
  Treinamentos Vencidos
  Treinamentos a Vencer
  Percentual de Conformidade

EPIs
  Total de EPIs
  EPIs Válidos
  EPIs Vencidos
  EPIs a Vencer
  Percentual de Conformidade

Inspeções
  Total de Inspeções
  Inspeções Conformes
  Inspeções Não Conformes
  Índice de Qualidade das Inspeções

Não Conformidades
  Total de NCs
  NCs Abertas
  NCs Em Andamento
  NCs Atrasadas
  NCs Críticas
  Índice de Risco SST

Painel Gerencial
  Índice SST Global
  Maturidade SST por Pilar
  Ranking de Risco SST por Cliente

- Estrutura do Dashboard
Página 1 - Visão Executiva SST
Visão consolidada dos principais indicadores da operação.

Página 2 - Gestão de Treinamentos
Monitoramento de treinamentos obrigatórios e conformidade.

Página 3 - Gestão de EPIs
Controle de validade, vencimentos e conformidade dos equipamentos.

Página 4 - Gestão de Inspeções
Acompanhamento dos resultados das inspeções de segurança.

Página 5 - Gestão de Não Conformidades
Gestão de criticidade, status e riscos operacionais.

Página 6 - Painel Gerencial SST
Visão executiva consolidada para apoio à tomada de decisão.

 Principais Insights Gerados
  Identificação dos clientes com maior exposição ao risco SST.
  Monitoramento da conformidade por pilar operacional.
  Controle de vencimentos de treinamentos e EPIs.
  Acompanhamento da evolução das não conformidades.
  Priorização de ações corretivas com base em criticidade.

- Autor: Gabriel Sobreira

Projeto desenvolvido para fins de estudo, portfólio e demonstração de competências em SQL, PostgreSQL, Power BI, Modelagem de Dados e Business Intelligence.

