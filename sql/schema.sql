
CREATE TABLE IF NOT EXISTS public.clientes
(
    id_cliente integer NOT NULL DEFAULT nextval('clientes_id_cliente_seq'::regclass),
    razao_social character varying(150) COLLATE pg_catalog."default" NOT NULL,
    nome_fantasia character varying(150) COLLATE pg_catalog."default",
    cnpj character varying(20) COLLATE pg_catalog."default" NOT NULL,
    segmento character varying(100) COLLATE pg_catalog."default",
    cidade character varying(100) COLLATE pg_catalog."default",
    estado character(2) COLLATE pg_catalog."default",
    status_cliente character varying(20) COLLATE pg_catalog."default" DEFAULT 'Ativo'::character varying,
    data_cadastro date DEFAULT CURRENT_DATE,
    CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente),
    CONSTRAINT clientes_cnpj_key UNIQUE (cnpj)
)

CREATE TABLE IF NOT EXISTS public.colaboradores
(
    id_colaborador integer NOT NULL DEFAULT nextval('colaboradores_id_colaborador_seq'::regclass),
    id_cliente integer NOT NULL,
    nome character varying(150) COLLATE pg_catalog."default" NOT NULL,
    cpf character varying(20) COLLATE pg_catalog."default",
    cargo character varying(100) COLLATE pg_catalog."default",
    setor character varying(100) COLLATE pg_catalog."default",
    data_admissao date,
    status_colaborador character varying(20) COLLATE pg_catalog."default" DEFAULT 'Ativo'::character varying,
    CONSTRAINT colaboradores_pkey PRIMARY KEY (id_colaborador),
    CONSTRAINT colaboradores_cpf_key UNIQUE (cpf),
    CONSTRAINT fk_colaborador_cliente FOREIGN KEY (id_cliente)
        REFERENCES public.clientes (id_cliente) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)

CREATE TABLE IF NOT EXISTS public.epis
(
    id_epi integer NOT NULL DEFAULT nextval('epis_id_epi_seq'::regclass),
    id_colaborador integer NOT NULL,
    id_tipo_epi integer NOT NULL,
    ca character varying(30) COLLATE pg_catalog."default",
    data_entrega date NOT NULL,
    data_validade date,
    quantidade integer DEFAULT 1,
    status_epi character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT epis_pkey PRIMARY KEY (id_epi),
    CONSTRAINT fk_epi_colaborador FOREIGN KEY (id_colaborador)
        REFERENCES public.colaboradores (id_colaborador) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_epi_tipo FOREIGN KEY (id_tipo_epi)
        REFERENCES public.dim_epis (id_tipo_epi) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)

CREATE TABLE IF NOT EXISTS public.inspecoes
(
    id_inspecao integer NOT NULL DEFAULT nextval('inspecoes_id_inspecao_seq'::regclass),
    id_cliente integer NOT NULL,
    id_resultado integer NOT NULL,
    data_inspecao date NOT NULL,
    tipo_inspecao character varying(100) COLLATE pg_catalog."default",
    local_inspecionado character varying(150) COLLATE pg_catalog."default",
    responsavel character varying(150) COLLATE pg_catalog."default",
    observacoes text COLLATE pg_catalog."default",
    CONSTRAINT inspecoes_pkey PRIMARY KEY (id_inspecao),
    CONSTRAINT fk_inspecao_cliente FOREIGN KEY (id_cliente)
        REFERENCES public.clientes (id_cliente) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_inspecao_resultado FOREIGN KEY (id_resultado)
        REFERENCES public.dim_resultado_inspecao (id_resultado) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)

CREATE TABLE IF NOT EXISTS public.nao_conformidades
(
    id_nao_conformidade integer NOT NULL DEFAULT nextval('nao_conformidades_id_nao_conformidade_seq'::regclass),
    id_inspecao integer NOT NULL,
    id_severidade integer NOT NULL,
    id_status_nc integer NOT NULL,
    descricao text COLLATE pg_catalog."default" NOT NULL,
    categoria character varying(100) COLLATE pg_catalog."default",
    prazo_correcao date,
    data_encerramento date,
    responsavel_correcao character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT nao_conformidades_pkey PRIMARY KEY (id_nao_conformidade),
    CONSTRAINT fk_nc_inspecao FOREIGN KEY (id_inspecao)
        REFERENCES public.inspecoes (id_inspecao) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_nc_severidade FOREIGN KEY (id_severidade)
        REFERENCES public.dim_severidade_nc (id_severidade) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_nc_status FOREIGN KEY (id_status_nc)
        REFERENCES public.dim_status_nc (id_status_nc) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)

CREATE TABLE IF NOT EXISTS public.treinamentos
(
    id_treinamento integer NOT NULL DEFAULT nextval('treinamentos_id_treinamento_seq'::regclass),
    id_colaborador integer NOT NULL,
    id_tipo_treinamento integer NOT NULL,
    data_realizacao date NOT NULL,
    data_validade date NOT NULL,
    status_treinamento character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT treinamentos_pkey PRIMARY KEY (id_treinamento),
    CONSTRAINT fk_treinamento_colaborador FOREIGN KEY (id_colaborador)
        REFERENCES public.colaboradores (id_colaborador) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_treinamento_tipo FOREIGN KEY (id_tipo_treinamento)
        REFERENCES public.dim_treinamentos (id_tipo_treinamento) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)
