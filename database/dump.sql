--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2020-03-21 20:46:03 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 220 (class 1255 OID 19000)
-- Name: check_limite_produtos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_limite_produtos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN

	/* Se adicionou um produto inativo ou alterou um produto para inativo, não precisa fazer nada */
        IF NOT(NEW.ativo)  THEN
           RETURN NEW;
        END IF;
        
        /* Verificar se há sobreposição com agendamentos existentes */
        IF  (SELECT (select emp.limite_produto
		from pessoas_empresa emp
		where id = NEW.EMPRESA_ID) < (select count(*)
		from pedidos_produto
		WHERE empresa_id = NEW.EMPRESA_ID
		AND ativo='t'))
        THEN
            RAISE EXCEPTION 'O limite de produtos ativos disponibilizados para a sua empresa foi ultrapassado!';
        END IF;
        RETURN NEW;
    END;
$$;


ALTER FUNCTION public.check_limite_produtos() OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 18999)
-- Name: teste(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.teste() RETURNS integer
    LANGUAGE plpgsql
    AS $$
    BEGIN
        
        /* Verificar se há sobreposição com agendamentos existentes */
        IF  (SELECT (select emp.limite_produto
		from pessoas_empresa emp
		where id = 1) < (select count(*)
		from pedidos_produto
		WHERE empresa_id = 1
		AND ativo='t'))
        THEN
            RETURN 1;
        END IF;
        RETURN 2;
    END;
$$;


ALTER FUNCTION public.teste() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 18654)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 18652)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 190 (class 1259 OID 18664)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 18662)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 186 (class 1259 OID 18646)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 18644)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 192 (class 1259 OID 18672)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 18682)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 18680)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 191 (class 1259 OID 18670)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 196 (class 1259 OID 18690)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 18688)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 198 (class 1259 OID 18750)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 18748)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 184 (class 1259 OID 18636)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 18634)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 182 (class 1259 OID 18625)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 18623)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 216 (class 1259 OID 18939)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18783)
-- Name: outros_cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outros_cidade (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.outros_cidade OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 18781)
-- Name: outros_cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outros_cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outros_cidade_id_seq OWNER TO postgres;

--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 199
-- Name: outros_cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outros_cidade_id_seq OWNED BY public.outros_cidade.id;


--
-- TOC entry 207 (class 1259 OID 18842)
-- Name: pedidos_categoriaproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_categoriaproduto (
    id integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.pedidos_categoriaproduto OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18840)
-- Name: pedidos_categoriaproduto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_categoriaproduto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_categoriaproduto_id_seq OWNER TO postgres;

--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 206
-- Name: pedidos_categoriaproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_categoriaproduto_id_seq OWNED BY public.pedidos_categoriaproduto.id;


--
-- TOC entry 213 (class 1259 OID 18869)
-- Name: pedidos_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_endereco (
    id integer NOT NULL,
    endereco character varying(50) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(50),
    descricao character varying(50) NOT NULL,
    cidade_id integer NOT NULL,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pedidos_endereco OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18867)
-- Name: pedidos_endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_endereco_id_seq OWNER TO postgres;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 212
-- Name: pedidos_endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_endereco_id_seq OWNED BY public.pedidos_endereco.id;


--
-- TOC entry 209 (class 1259 OID 18850)
-- Name: pedidos_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_pedido (
    id integer NOT NULL,
    status_id integer NOT NULL,
    data timestamp with time zone NOT NULL,
    valor_total double precision NOT NULL,
    horario_entrega character varying(30) NOT NULL,
    observacao_cliente text,
    observacao_funcionario text,
    cliente_id integer NOT NULL,
    empresa_id integer NOT NULL,
    funcionario_id integer
);


ALTER TABLE public.pedidos_pedido OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18848)
-- Name: pedidos_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 208
-- Name: pedidos_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_pedido_id_seq OWNED BY public.pedidos_pedido.id;


--
-- TOC entry 215 (class 1259 OID 18877)
-- Name: pedidos_pedidoproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_pedidoproduto (
    id integer NOT NULL,
    quantidade integer NOT NULL,
    valor_unitario double precision NOT NULL,
    valor_total double precision NOT NULL,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE public.pedidos_pedidoproduto OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18875)
-- Name: pedidos_pedidoproduto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_pedidoproduto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_pedidoproduto_id_seq OWNER TO postgres;

--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 214
-- Name: pedidos_pedidoproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_pedidoproduto_id_seq OWNED BY public.pedidos_pedidoproduto.id;


--
-- TOC entry 211 (class 1259 OID 18861)
-- Name: pedidos_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_produto (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    valor double precision NOT NULL,
    imagem character varying(100),
    categoria_id integer NOT NULL,
    empresa_id integer NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE public.pedidos_produto OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18859)
-- Name: pedidos_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_produto_id_seq OWNER TO postgres;

--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedidos_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_produto_id_seq OWNED BY public.pedidos_produto.id;


--
-- TOC entry 218 (class 1259 OID 18959)
-- Name: pedidos_statuspedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_statuspedido (
    id integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.pedidos_statuspedido OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18957)
-- Name: pedidos_statuspedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_statuspedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_statuspedido_id_seq OWNER TO postgres;

--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 217
-- Name: pedidos_statuspedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_statuspedido_id_seq OWNED BY public.pedidos_statuspedido.id;


--
-- TOC entry 202 (class 1259 OID 18791)
-- Name: pessoas_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas_cliente (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    telefone bigint NOT NULL,
    sexo integer NOT NULL
);


ALTER TABLE public.pessoas_cliente OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18789)
-- Name: pessoas_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoas_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoas_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 201
-- Name: pessoas_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoas_cliente_id_seq OWNED BY public.pessoas_cliente.id;


--
-- TOC entry 204 (class 1259 OID 18801)
-- Name: pessoas_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas_empresa (
    id integer NOT NULL,
    nome_fantasia character varying(30) NOT NULL,
    imagem character varying(100) NOT NULL,
    limite_produto integer NOT NULL,
    cidade_id integer NOT NULL
);


ALTER TABLE public.pessoas_empresa OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18799)
-- Name: pessoas_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoas_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoas_empresa_id_seq OWNER TO postgres;

--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 203
-- Name: pessoas_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoas_empresa_id_seq OWNED BY public.pessoas_empresa.id;


--
-- TOC entry 205 (class 1259 OID 18807)
-- Name: pessoas_funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas_funcionario (
    user_ptr_id integer NOT NULL,
    nome character varying(50) NOT NULL,
    empresa_id integer NOT NULL
);


ALTER TABLE public.pessoas_funcionario OWNER TO postgres;

--
-- TOC entry 2141 (class 2604 OID 18657)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 18667)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 18649)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 18675)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 18685)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 18693)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 18753)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 18639)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 18628)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 18786)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outros_cidade ALTER COLUMN id SET DEFAULT nextval('public.outros_cidade_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 18845)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_categoriaproduto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_categoriaproduto_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 18872)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco ALTER COLUMN id SET DEFAULT nextval('public.pedidos_endereco_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 18853)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido ALTER COLUMN id SET DEFAULT nextval('public.pedidos_pedido_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 18880)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_pedidoproduto_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 18864)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_produto_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 18962)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statuspedido ALTER COLUMN id SET DEFAULT nextval('public.pedidos_statuspedido_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 18794)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente ALTER COLUMN id SET DEFAULT nextval('public.pessoas_cliente_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 18804)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa ALTER COLUMN id SET DEFAULT nextval('public.pessoas_empresa_id_seq'::regclass);


--
-- TOC entry 2384 (class 0 OID 18654)
-- Dependencies: 188
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group VALUES (1, 'Funcionário Empresa');


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- TOC entry 2386 (class 0 OID 18664)
-- Dependencies: 190
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_permissions VALUES (1, 1, 64);
INSERT INTO public.auth_group_permissions VALUES (2, 1, 61);
INSERT INTO public.auth_group_permissions VALUES (3, 1, 62);
INSERT INTO public.auth_group_permissions VALUES (4, 1, 63);


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 4, true);


--
-- TOC entry 2382 (class 0 OID 18646)
-- Dependencies: 186
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add user', 2, 'add_user');
INSERT INTO public.auth_permission VALUES (6, 'Can change user', 2, 'change_user');
INSERT INTO public.auth_permission VALUES (7, 'Can delete user', 2, 'delete_user');
INSERT INTO public.auth_permission VALUES (8, 'Can view user', 2, 'view_user');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 4, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 4, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 4, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 4, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add permission', 3, 'add_permission');
INSERT INTO public.auth_permission VALUES (14, 'Can change permission', 3, 'change_permission');
INSERT INTO public.auth_permission VALUES (15, 'Can delete permission', 3, 'delete_permission');
INSERT INTO public.auth_permission VALUES (16, 'Can view permission', 3, 'view_permission');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add Cliente', 7, 'add_cliente');
INSERT INTO public.auth_permission VALUES (26, 'Can change Cliente', 7, 'change_cliente');
INSERT INTO public.auth_permission VALUES (27, 'Can delete Cliente', 7, 'delete_cliente');
INSERT INTO public.auth_permission VALUES (28, 'Can view Cliente', 7, 'view_cliente');
INSERT INTO public.auth_permission VALUES (29, 'Can add Funcionário', 8, 'add_funcionario');
INSERT INTO public.auth_permission VALUES (30, 'Can change Funcionário', 8, 'change_funcionario');
INSERT INTO public.auth_permission VALUES (31, 'Can delete Funcionário', 8, 'delete_funcionario');
INSERT INTO public.auth_permission VALUES (32, 'Can view Funcionário', 8, 'view_funcionario');
INSERT INTO public.auth_permission VALUES (33, 'Can add Empresa', 9, 'add_empresa');
INSERT INTO public.auth_permission VALUES (34, 'Can change Empresa', 9, 'change_empresa');
INSERT INTO public.auth_permission VALUES (35, 'Can delete Empresa', 9, 'delete_empresa');
INSERT INTO public.auth_permission VALUES (36, 'Can view Empresa', 9, 'view_empresa');
INSERT INTO public.auth_permission VALUES (37, 'Can add Cidade', 10, 'add_cidade');
INSERT INTO public.auth_permission VALUES (38, 'Can change Cidade', 10, 'change_cidade');
INSERT INTO public.auth_permission VALUES (39, 'Can delete Cidade', 10, 'delete_cidade');
INSERT INTO public.auth_permission VALUES (40, 'Can view Cidade', 10, 'view_cidade');
INSERT INTO public.auth_permission VALUES (41, 'Can add Pedido', 15, 'add_pedido');
INSERT INTO public.auth_permission VALUES (42, 'Can change Pedido', 15, 'change_pedido');
INSERT INTO public.auth_permission VALUES (43, 'Can delete Pedido', 15, 'delete_pedido');
INSERT INTO public.auth_permission VALUES (44, 'Can view Pedido', 15, 'view_pedido');
INSERT INTO public.auth_permission VALUES (45, 'Can add endereco', 11, 'add_endereco');
INSERT INTO public.auth_permission VALUES (46, 'Can change endereco', 11, 'change_endereco');
INSERT INTO public.auth_permission VALUES (47, 'Can delete endereco', 11, 'delete_endereco');
INSERT INTO public.auth_permission VALUES (48, 'Can view endereco', 11, 'view_endereco');
INSERT INTO public.auth_permission VALUES (49, 'Can add Categoria de Produtos', 12, 'add_categoriaproduto');
INSERT INTO public.auth_permission VALUES (50, 'Can change Categoria de Produtos', 12, 'change_categoriaproduto');
INSERT INTO public.auth_permission VALUES (51, 'Can delete Categoria de Produtos', 12, 'delete_categoriaproduto');
INSERT INTO public.auth_permission VALUES (52, 'Can view Categoria de Produtos', 12, 'view_categoriaproduto');
INSERT INTO public.auth_permission VALUES (53, 'Can add Produtos do pedido', 14, 'add_pedidoproduto');
INSERT INTO public.auth_permission VALUES (54, 'Can change Produtos do pedido', 14, 'change_pedidoproduto');
INSERT INTO public.auth_permission VALUES (55, 'Can delete Produtos do pedido', 14, 'delete_pedidoproduto');
INSERT INTO public.auth_permission VALUES (56, 'Can view Produtos do pedido', 14, 'view_pedidoproduto');
INSERT INTO public.auth_permission VALUES (57, 'Can add Produto', 13, 'add_produto');
INSERT INTO public.auth_permission VALUES (58, 'Can change Produto', 13, 'change_produto');
INSERT INTO public.auth_permission VALUES (59, 'Can delete Produto', 13, 'delete_produto');
INSERT INTO public.auth_permission VALUES (60, 'Can view Produto', 13, 'view_produto');
INSERT INTO public.auth_permission VALUES (61, 'Can add Produto da empresa', 16, 'add_produtoempresa');
INSERT INTO public.auth_permission VALUES (62, 'Can change Produto da empresa', 16, 'change_produtoempresa');
INSERT INTO public.auth_permission VALUES (63, 'Can delete Produto da empresa', 16, 'delete_produtoempresa');
INSERT INTO public.auth_permission VALUES (64, 'Can view Produto da empresa', 16, 'view_produtoempresa');
INSERT INTO public.auth_permission VALUES (65, 'Can add Situação do Pedidos', 17, 'add_statuspedido');
INSERT INTO public.auth_permission VALUES (66, 'Can change Situação do Pedidos', 17, 'change_statuspedido');
INSERT INTO public.auth_permission VALUES (67, 'Can delete Situação do Pedidos', 17, 'delete_statuspedido');
INSERT INTO public.auth_permission VALUES (68, 'Can view Situação do Pedidos', 17, 'view_statuspedido');


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- TOC entry 2388 (class 0 OID 18672)
-- Dependencies: 192
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$150000$LOgtUZgrnB7f$SaNz7Z5UH7Tk22a8/uQa3QLOLTU6KuLRevR9aTtmeRg=', '2020-03-21 20:43:05.902091-03', true, 'admin', '', '', 'edimarmanica@gmail.com', true, true, '2020-03-21 12:05:48.781038-03');
INSERT INTO public.auth_user VALUES (2, 'pbkdf2_sha256$150000$SLJxbbkbQMuG$wFhalrCPo8iy5AfS6b6uxfICib/s2JXpRNvN3wLiuvc=', '2020-03-21 20:43:42.26216-03', false, 'ana', '', '', '', true, true, '2020-03-21 12:08:26-03');
INSERT INTO public.auth_user VALUES (3, 'pbkdf2_sha256$150000$5u5AgEYkuIA4$B3qza8lLr10ij4Qqpw32rtDgPbgRg8XTO2uUbu9PtAc=', '2020-03-21 20:44:58.411278-03', false, 'maria', '', '', '', true, true, '2020-03-21 20:34:59-03');


--
-- TOC entry 2390 (class 0 OID 18682)
-- Dependencies: 194
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user_groups VALUES (2, 2, 1);
INSERT INTO public.auth_user_groups VALUES (3, 3, 1);


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- TOC entry 2392 (class 0 OID 18690)
-- Dependencies: 196
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2394 (class 0 OID 18750)
-- Dependencies: 198
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log VALUES (1, '2020-03-21 12:06:05.954219-03', '1', 'Ibirubá', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (2, '2020-03-21 12:07:48.462246-03', '1', 'João', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (3, '2020-03-21 12:08:06.852324-03', '1', 'Cotribá - Ibirubá', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (4, '2020-03-21 12:08:26.042984-03', '2', 'Jorge', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (5, '2020-03-21 12:08:36.999412-03', '1', 'Alimentícios', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (6, '2020-03-21 12:08:53.503066-03', '1', 'Arroz', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (7, '2020-03-21 12:09:02.079337-03', '2', 'Feijão', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (8, '2020-03-21 12:10:38.328742-03', '1', '2020-03-21 12:09:14-03:00 : João', 1, '[{"added": {}}, {"added": {"object": "Endereco object (1)", "name": "endereco"}}, {"added": {"object": "Arroz", "name": "Produtos do pedido"}}, {"added": {"object": "Feij\u00e3o", "name": "Produtos do pedido"}}]', 15, 1);
INSERT INTO public.django_admin_log VALUES (9, '2020-03-21 16:55:58.217288-03', '2', 'jorge', 2, '[{"changed": {"fields": ["password"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (10, '2020-03-21 16:56:44.452287-03', '1', 'Funcionário Empresa', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (11, '2020-03-21 16:57:15.739535-03', '1', 'Funcionário Empresa', 2, '[{"changed": {"fields": ["permissions"]}}]', 4, 1);
INSERT INTO public.django_admin_log VALUES (12, '2020-03-21 16:58:14.754252-03', '2', 'jorge', 2, '[{"changed": {"fields": ["groups"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (13, '2020-03-21 16:59:00.491668-03', '3', 'Arroz Tio João', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (14, '2020-03-21 17:00:14.350266-03', '4', 'Feijão', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (15, '2020-03-21 17:01:06.083312-03', '3', 'Arroz Tio João', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (16, '2020-03-21 17:02:56.469055-03', '4', 'Feijão', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (17, '2020-03-21 17:03:14.291489-03', '5', 'Feijão Cotribá', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (18, '2020-03-21 17:03:28.820442-03', '5', 'Feijão Cotribá', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (19, '2020-03-21 17:12:50.019918-03', '6', 'Feijão Cotribá', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (20, '2020-03-21 17:13:08.222981-03', '7', 'Arroz Cotribá', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (21, '2020-03-21 17:13:25.355333-03', '7', 'Arroz Cotribá', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (22, '2020-03-21 17:16:41.871769-03', '8', 'Arroz Cotribá', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (23, '2020-03-21 17:18:54.041873-03', '8', 'Arroz Cotribá', 3, '', 13, 1);
INSERT INTO public.django_admin_log VALUES (24, '2020-03-21 17:21:19.954719-03', '1', '2020-03-21 15:09:14+00:00 : João', 3, '', 15, 1);
INSERT INTO public.django_admin_log VALUES (25, '2020-03-21 17:21:58.01917-03', '1', 'Arroz', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (26, '2020-03-21 17:24:09.501998-03', '2', 'Feijão', 3, '', 16, 2);
INSERT INTO public.django_admin_log VALUES (27, '2020-03-21 17:24:29.710067-03', '9', 'Arroz Cotribá', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (28, '2020-03-21 17:35:25.454517-03', '1', 'Aguardando Atendimento', 1, '[{"added": {}}]', 17, 1);
INSERT INTO public.django_admin_log VALUES (29, '2020-03-21 17:35:34.61585-03', '2', 'Em atendimento', 1, '[{"added": {}}]', 17, 1);
INSERT INTO public.django_admin_log VALUES (30, '2020-03-21 17:35:44.37839-03', '3', 'Aguardando Entrega', 1, '[{"added": {}}]', 17, 1);
INSERT INTO public.django_admin_log VALUES (31, '2020-03-21 17:35:51.242592-03', '4', 'Entregue', 1, '[{"added": {}}]', 17, 1);
INSERT INTO public.django_admin_log VALUES (32, '2020-03-21 17:35:56.839927-03', '5', 'Cancelado', 1, '[{"added": {}}]', 17, 1);
INSERT INTO public.django_admin_log VALUES (33, '2020-03-21 17:38:49.230342-03', '2', '2020-03-21 17:38:22-03:00 : João', 1, '[{"added": {}}, {"added": {"object": "Rua J\u00falio Rosa", "name": "endereco"}}, {"added": {"object": "Arroz Cotrib\u00e1", "name": "Produtos do pedido"}}]', 15, 1);
INSERT INTO public.django_admin_log VALUES (34, '2020-03-21 18:36:57.995434-03', '1', 'Cotribá - Ibirubá', 2, '[{"changed": {"fields": ["limite_produto"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (35, '2020-03-21 18:37:55.485601-03', '2', 'Coopeagri - Ibirubá', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (36, '2020-03-21 18:38:06.091486-03', '1', 'Cotribá - Ibirubá', 2, '[{"changed": {"fields": ["imagem"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (37, '2020-03-21 18:38:30.115221-03', '2', 'Coopeagri - Ibirubá', 2, '[{"changed": {"fields": ["limite_produto"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (38, '2020-03-21 18:39:21.791139-03', '10', 'Massa Cotribá', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (39, '2020-03-21 18:56:48.779658-03', 'None', 'Pipoca', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (40, '2020-03-21 18:58:22.241182-03', '6', 'Feijão Cotribá', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (41, '2020-03-21 18:58:42.939077-03', '9', 'Arroz Cotribá', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (42, '2020-03-21 19:03:31.835398-03', 'None', 'Teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (43, '2020-03-21 19:04:03.45179-03', 'None', 'teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (44, '2020-03-21 19:07:17.945083-03', 'None', 'Teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (45, '2020-03-21 19:10:35.818653-03', 'None', 'Teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (46, '2020-03-21 19:13:17.584634-03', 'None', 'Teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (47, '2020-03-21 20:14:34.54169-03', '1', 'Cotribá - Ibirubá', 2, '[{"changed": {"fields": ["limite_produto"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (48, '2020-03-21 20:19:55.842464-03', '1', 'Cotribá - Ibirubá', 2, '[{"changed": {"fields": ["limite_produto"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (49, '2020-03-21 20:20:50.62216-03', '11', 'Arroz Coopeagri', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (50, '2020-03-21 20:20:59.627299-03', '9', 'Arroz Cotribá', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (51, '2020-03-21 20:21:10.73474-03', '12', 'Teste', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (52, '2020-03-21 20:24:29.794469-03', '9', 'Arroz Cotribá', 2, '[{"changed": {"fields": ["ativo"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (53, '2020-03-21 20:24:36.630354-03', '9', 'Arroz Cotribá', 2, '[{"changed": {"fields": ["ativo"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (54, '2020-03-21 20:27:00.218206-03', '9', 'Arroz Cotribá', 2, '[{"changed": {"fields": ["ativo"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (55, '2020-03-21 20:27:45.262975-03', '15', 'asdsad', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (56, '2020-03-21 20:27:59.240762-03', '16', 'Novo', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (57, '2020-03-21 20:28:10.122561-03', '15', 'asdsad', 3, '', 13, 1);
INSERT INTO public.django_admin_log VALUES (58, '2020-03-21 20:28:10.127065-03', '16', 'Novo', 3, '', 13, 1);
INSERT INTO public.django_admin_log VALUES (59, '2020-03-21 20:28:10.130382-03', '12', 'Teste', 3, '', 13, 1);
INSERT INTO public.django_admin_log VALUES (60, '2020-03-21 20:32:11.438642-03', '2', 'Ana', 2, '[{"changed": {"fields": ["nome", "username"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (61, '2020-03-21 20:34:59.460814-03', '3', 'Maria', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (62, '2020-03-21 20:35:38.854483-03', '2', 'ana', 2, '[{"changed": {"fields": ["groups"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (63, '2020-03-21 20:35:49.825856-03', '3', 'maria', 2, '[]', 2, 1);
INSERT INTO public.django_admin_log VALUES (64, '2020-03-21 20:35:58.069348-03', '2', 'ana', 2, '[]', 2, 1);
INSERT INTO public.django_admin_log VALUES (65, '2020-03-21 20:36:30.253007-03', '2', 'Higiene e Limpeza', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (66, '2020-03-21 20:37:46.620368-03', '9', 'Arroz', 2, '[{"changed": {"fields": ["descricao", "ativo"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (67, '2020-03-21 20:38:00.174514-03', '11', 'Dúzia de ovos', 2, '[{"changed": {"fields": ["descricao"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (68, '2020-03-21 20:38:09.153532-03', '6', 'Feijão', 2, '[{"changed": {"fields": ["descricao"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (69, '2020-03-21 20:38:30.23952-03', '10', 'Papel Higiênico c/ 12', 2, '[{"changed": {"fields": ["descricao", "categoria", "valor"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (70, '2020-03-21 20:38:36.944606-03', '10', 'Papel Higiênico c/ 12', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (71, '2020-03-21 20:38:45.523041-03', '6', 'Feijão', 2, '[{"changed": {"fields": ["ativo"]}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (72, '2020-03-21 20:38:50.755026-03', '11', 'Dúzia de ovos', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (73, '2020-03-21 20:38:55.152641-03', '9', 'Arroz', 2, '[]', 13, 1);
INSERT INTO public.django_admin_log VALUES (74, '2020-03-21 20:39:33.473931-03', '2', 'ana', 2, '[{"changed": {"fields": ["password"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (75, '2020-03-21 20:39:39.016528-03', '2', 'ana', 2, '[]', 2, 1);
INSERT INTO public.django_admin_log VALUES (76, '2020-03-21 20:41:35.57681-03', '3', 'maria', 2, '[{"changed": {"fields": ["password"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (77, '2020-03-21 20:42:37.952971-03', '2', 'ana', 2, '[{"changed": {"fields": ["password"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (78, '2020-03-21 20:42:42.88632-03', '2', 'ana', 2, '[]', 2, 1);
INSERT INTO public.django_admin_log VALUES (79, '2020-03-21 20:43:24.748045-03', '2', 'ana', 2, '[{"changed": {"fields": ["groups"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (80, '2020-03-21 20:43:32.899893-03', '3', 'maria', 2, '[{"changed": {"fields": ["groups"]}}]', 2, 1);
INSERT INTO public.django_admin_log VALUES (81, '2020-03-21 20:44:15.301069-03', '17', 'Leite', 1, '[{"added": {}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (82, '2020-03-21 20:44:22.66305-03', '17', 'Leite', 2, '[{"changed": {"fields": ["ativo"]}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (83, '2020-03-21 20:44:44.870649-03', '17', 'Leite', 2, '[{"changed": {"fields": ["ativo"]}}]', 16, 2);
INSERT INTO public.django_admin_log VALUES (84, '2020-03-21 20:45:16.132017-03', '18', 'Alface', 1, '[{"added": {}}]', 16, 3);
INSERT INTO public.django_admin_log VALUES (85, '2020-03-21 20:45:24.109818-03', '18', 'Alface', 2, '[]', 16, 3);


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 85, true);


--
-- TOC entry 2380 (class 0 OID 18636)
-- Dependencies: 184
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'pessoas', 'cliente');
INSERT INTO public.django_content_type VALUES (8, 'pessoas', 'funcionario');
INSERT INTO public.django_content_type VALUES (9, 'pessoas', 'empresa');
INSERT INTO public.django_content_type VALUES (10, 'outros', 'cidade');
INSERT INTO public.django_content_type VALUES (11, 'pedidos', 'endereco');
INSERT INTO public.django_content_type VALUES (12, 'pedidos', 'categoriaproduto');
INSERT INTO public.django_content_type VALUES (13, 'pedidos', 'produto');
INSERT INTO public.django_content_type VALUES (14, 'pedidos', 'pedidoproduto');
INSERT INTO public.django_content_type VALUES (15, 'pedidos', 'pedido');
INSERT INTO public.django_content_type VALUES (16, 'pedidos_empresa', 'produtoempresa');
INSERT INTO public.django_content_type VALUES (17, 'pedidos', 'statuspedido');


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 2378 (class 0 OID 18625)
-- Dependencies: 182
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2020-03-21 12:02:52.899991-03');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2020-03-21 12:02:52.981503-03');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2020-03-21 12:02:53.083189-03');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-03-21 12:02:53.122397-03');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-21 12:02:53.140323-03');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-03-21 12:02:53.17732-03');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-03-21 12:02:53.189046-03');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-03-21 12:02:53.207511-03');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-03-21 12:02:53.23003-03');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-03-21 12:02:53.247808-03');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-03-21 12:02:53.251192-03');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-21 12:02:53.275697-03');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-03-21 12:02:53.30257-03');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-21 12:02:53.320002-03');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-03-21 12:02:53.34072-03');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-03-21 12:02:53.357378-03');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_auto_20200321_1033', '2020-03-21 12:02:53.377345-03');
INSERT INTO public.django_migrations VALUES (18, 'outros', '0001_initial', '2020-03-21 12:02:53.388893-03');
INSERT INTO public.django_migrations VALUES (19, 'pessoas', '0001_initial', '2020-03-21 12:02:53.440563-03');
INSERT INTO public.django_migrations VALUES (20, 'pessoas', '0002_empresa_cidade', '2020-03-21 12:02:53.48636-03');
INSERT INTO public.django_migrations VALUES (21, 'pessoas', '0003_cliente_sexo', '2020-03-21 12:02:53.517989-03');
INSERT INTO public.django_migrations VALUES (22, 'pedidos', '0001_initial', '2020-03-21 12:02:53.654756-03');
INSERT INTO public.django_migrations VALUES (23, 'pedidos', '0002_auto_20200321_1200', '2020-03-21 12:02:53.736989-03');
INSERT INTO public.django_migrations VALUES (24, 'sessions', '0001_initial', '2020-03-21 12:02:53.753059-03');
INSERT INTO public.django_migrations VALUES (25, 'pessoas', '0004_auto_20200321_1207', '2020-03-21 12:07:36.381454-03');
INSERT INTO public.django_migrations VALUES (26, 'pedidos', '0003_auto_20200321_1210', '2020-03-21 12:10:55.796059-03');
INSERT INTO public.django_migrations VALUES (27, 'pedidos_empresa', '0001_initial', '2020-03-21 16:52:44.456499-03');
INSERT INTO public.django_migrations VALUES (28, 'pedidos', '0004_auto_20200321_1711', '2020-03-21 17:11:53.330347-03');
INSERT INTO public.django_migrations VALUES (29, 'pedidos', '0005_auto_20200321_1734', '2020-03-21 17:34:27.006292-03');
INSERT INTO public.django_migrations VALUES (30, 'pedidos', '0006_auto_20200321_1737', '2020-03-21 17:37:15.585207-03');
INSERT INTO public.django_migrations VALUES (31, 'pedidos', '0007_auto_20200321_1743', '2020-03-21 17:44:00.09208-03');


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- TOC entry 2412 (class 0 OID 18939)
-- Dependencies: 216
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2396 (class 0 OID 18783)
-- Dependencies: 200
-- Data for Name: outros_cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.outros_cidade VALUES (1, 'Ibirubá');


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 199
-- Name: outros_cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outros_cidade_id_seq', 1, true);


--
-- TOC entry 2403 (class 0 OID 18842)
-- Dependencies: 207
-- Data for Name: pedidos_categoriaproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_categoriaproduto VALUES (1, 'Alimentícios');
INSERT INTO public.pedidos_categoriaproduto VALUES (2, 'Higiene e Limpeza');


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 206
-- Name: pedidos_categoriaproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_categoriaproduto_id_seq', 2, true);


--
-- TOC entry 2409 (class 0 OID 18869)
-- Dependencies: 213
-- Data for Name: pedidos_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_endereco VALUES (2, 'Rua Júlio Rosa', 1245, NULL, 'teste', 1, 2);


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 212
-- Name: pedidos_endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_endereco_id_seq', 2, true);


--
-- TOC entry 2405 (class 0 OID 18850)
-- Dependencies: 209
-- Data for Name: pedidos_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_pedido VALUES (2, 1, '2020-03-21 17:38:22-03', 12, 'Qualquer horário de tarde', 'sfd', 'sdf', 1, 1, NULL);


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 208
-- Name: pedidos_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_pedido_id_seq', 2, true);


--
-- TOC entry 2411 (class 0 OID 18877)
-- Dependencies: 215
-- Data for Name: pedidos_pedidoproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_pedidoproduto VALUES (3, 1, 14, 14, 2, 9);


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 214
-- Name: pedidos_pedidoproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_pedidoproduto_id_seq', 3, true);


--
-- TOC entry 2407 (class 0 OID 18861)
-- Dependencies: 211
-- Data for Name: pedidos_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_produto VALUES (10, 'Papel Higiênico c/ 12', 12.9000000000000004, '', 2, 1, true);
INSERT INTO public.pedidos_produto VALUES (6, 'Feijão', 10, 'produtos/feijao.jpeg', 1, 1, false);
INSERT INTO public.pedidos_produto VALUES (11, 'Dúzia de ovos', 2, '', 1, 2, true);
INSERT INTO public.pedidos_produto VALUES (9, 'Arroz', 12, '', 1, 1, true);
INSERT INTO public.pedidos_produto VALUES (17, 'Leite', 2.45000000000000018, '', 1, 1, false);
INSERT INTO public.pedidos_produto VALUES (18, 'Alface', 3, '', 1, 2, true);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedidos_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_produto_id_seq', 18, true);


--
-- TOC entry 2414 (class 0 OID 18959)
-- Dependencies: 218
-- Data for Name: pedidos_statuspedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_statuspedido VALUES (1, 'Aguardando Atendimento');
INSERT INTO public.pedidos_statuspedido VALUES (2, 'Em atendimento');
INSERT INTO public.pedidos_statuspedido VALUES (3, 'Aguardando Entrega');
INSERT INTO public.pedidos_statuspedido VALUES (4, 'Entregue');
INSERT INTO public.pedidos_statuspedido VALUES (5, 'Cancelado');


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 217
-- Name: pedidos_statuspedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_statuspedido_id_seq', 5, true);


--
-- TOC entry 2398 (class 0 OID 18791)
-- Dependencies: 202
-- Data for Name: pessoas_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_cliente VALUES (1, 'João', 54991552721, 0);


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 201
-- Name: pessoas_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoas_cliente_id_seq', 1, true);


--
-- TOC entry 2400 (class 0 OID 18801)
-- Dependencies: 204
-- Data for Name: pessoas_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_empresa VALUES (2, 'Coopeagri', 'empresas/coopeagri.png', 3, 1);
INSERT INTO public.pessoas_empresa VALUES (1, 'Cotribá', 'empresas/cotriba.png', 3, 1);


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 203
-- Name: pessoas_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoas_empresa_id_seq', 2, true);


--
-- TOC entry 2401 (class 0 OID 18807)
-- Dependencies: 205
-- Data for Name: pessoas_funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_funcionario VALUES (2, 'Ana', 1);
INSERT INTO public.pessoas_funcionario VALUES (3, 'Maria', 2);


--
-- TOC entry 2170 (class 2606 OID 18779)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2175 (class 2606 OID 18716)
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2178 (class 2606 OID 18669)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 18659)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 18702)
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2167 (class 2606 OID 18651)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 18687)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2189 (class 2606 OID 18731)
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2180 (class 2606 OID 18677)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 18695)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2195 (class 2606 OID 18745)
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2183 (class 2606 OID 18773)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2198 (class 2606 OID 18759)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 18643)
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2162 (class 2606 OID 18641)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 18633)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2236 (class 2606 OID 18946)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2201 (class 2606 OID 18788)
-- Name: outros_cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outros_cidade
    ADD CONSTRAINT outros_cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2213 (class 2606 OID 18847)
-- Name: pedidos_categoriaproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_categoriaproduto
    ADD CONSTRAINT pedidos_categoriaproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2227 (class 2606 OID 18874)
-- Name: pedidos_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 18858)
-- Name: pedidos_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2230 (class 2606 OID 18936)
-- Name: pedidos_pedidoproduto_pedido_id_produto_id_b539101f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pedido_id_produto_id_b539101f_uniq UNIQUE (pedido_id, produto_id);


--
-- TOC entry 2232 (class 2606 OID 18882)
-- Name: pedidos_pedidoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2223 (class 2606 OID 18866)
-- Name: pedidos_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2239 (class 2606 OID 18964)
-- Name: pedidos_statuspedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statuspedido
    ADD CONSTRAINT pedidos_statuspedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2203 (class 2606 OID 18796)
-- Name: pessoas_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente
    ADD CONSTRAINT pessoas_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2205 (class 2606 OID 18951)
-- Name: pessoas_cliente_telefone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente
    ADD CONSTRAINT pessoas_cliente_telefone_key UNIQUE (telefone);


--
-- TOC entry 2208 (class 2606 OID 18806)
-- Name: pessoas_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa
    ADD CONSTRAINT pessoas_empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 18811)
-- Name: pessoas_funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_pkey PRIMARY KEY (user_ptr_id);


--
-- TOC entry 2168 (class 1259 OID 18780)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2173 (class 1259 OID 18717)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2176 (class 1259 OID 18718)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2163 (class 1259 OID 18703)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2184 (class 1259 OID 18733)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2187 (class 1259 OID 18732)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2190 (class 1259 OID 18747)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2193 (class 1259 OID 18746)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2181 (class 1259 OID 18774)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2196 (class 1259 OID 18770)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2199 (class 1259 OID 18771)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2234 (class 1259 OID 18948)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2237 (class 1259 OID 18947)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2224 (class 1259 OID 18923)
-- Name: pedidos_endereco_cidade_id_d411cb38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_endereco_cidade_id_d411cb38 ON public.pedidos_endereco USING btree (cidade_id);


--
-- TOC entry 2225 (class 1259 OID 18924)
-- Name: pedidos_endereco_pedido_id_1f69ee37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_endereco_pedido_id_1f69ee37 ON public.pedidos_endereco USING btree (pedido_id);


--
-- TOC entry 2214 (class 1259 OID 18898)
-- Name: pedidos_pedido_cliente_id_84f4fc73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_cliente_id_84f4fc73 ON public.pedidos_pedido USING btree (cliente_id);


--
-- TOC entry 2215 (class 1259 OID 18899)
-- Name: pedidos_pedido_empresa_id_88ea251a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_empresa_id_88ea251a ON public.pedidos_pedido USING btree (empresa_id);


--
-- TOC entry 2216 (class 1259 OID 18900)
-- Name: pedidos_pedido_funcionario_id_8154228a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_funcionario_id_8154228a ON public.pedidos_pedido USING btree (funcionario_id);


--
-- TOC entry 2219 (class 1259 OID 18970)
-- Name: pedidos_pedido_status_id_84f6c512; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_status_id_84f6c512 ON public.pedidos_pedido USING btree (status_id);


--
-- TOC entry 2228 (class 1259 OID 18937)
-- Name: pedidos_pedidoproduto_pedido_id_ab5340e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedidoproduto_pedido_id_ab5340e1 ON public.pedidos_pedidoproduto USING btree (pedido_id);


--
-- TOC entry 2233 (class 1259 OID 18938)
-- Name: pedidos_pedidoproduto_produto_id_d564b867; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedidoproduto_produto_id_d564b867 ON public.pedidos_pedidoproduto USING btree (produto_id);


--
-- TOC entry 2220 (class 1259 OID 18911)
-- Name: pedidos_produto_categoria_id_13275e73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_produto_categoria_id_13275e73 ON public.pedidos_produto USING btree (categoria_id);


--
-- TOC entry 2221 (class 1259 OID 18912)
-- Name: pedidos_produto_empresa_id_eddee74b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_produto_empresa_id_eddee74b ON public.pedidos_produto USING btree (empresa_id);


--
-- TOC entry 2206 (class 1259 OID 18828)
-- Name: pessoas_empresa_cidade_id_40bb748c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pessoas_empresa_cidade_id_40bb748c ON public.pessoas_empresa USING btree (cidade_id);


--
-- TOC entry 2209 (class 1259 OID 18822)
-- Name: pessoas_funcionario_empresa_id_7e9d8835; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pessoas_funcionario_empresa_id_7e9d8835 ON public.pessoas_funcionario USING btree (empresa_id);


--
-- TOC entry 2262 (class 2620 OID 19002)
-- Name: trg_limite_produto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_limite_produto AFTER INSERT OR UPDATE ON public.pedidos_produto FOR EACH ROW EXECUTE PROCEDURE public.check_limite_produtos();


--
-- TOC entry 2242 (class 2606 OID 18710)
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2241 (class 2606 OID 18705)
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2240 (class 2606 OID 18696)
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2244 (class 2606 OID 18725)
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2243 (class 2606 OID 18720)
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2246 (class 2606 OID 18739)
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2245 (class 2606 OID 18734)
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2247 (class 2606 OID 18760)
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2248 (class 2606 OID 18765)
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2258 (class 2606 OID 18913)
-- Name: pedidos_endereco_cidade_id_d411cb38_fk_outros_cidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_cidade_id_d411cb38_fk_outros_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.outros_cidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2259 (class 2606 OID 18965)
-- Name: pedidos_endereco_pedido_id_1f69ee37_fk_pedidos_pedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_pedido_id_1f69ee37_fk_pedidos_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedidos_pedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2252 (class 2606 OID 18883)
-- Name: pedidos_pedido_cliente_id_84f4fc73_fk_pessoas_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_cliente_id_84f4fc73_fk_pessoas_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.pessoas_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2253 (class 2606 OID 18888)
-- Name: pedidos_pedido_empresa_id_88ea251a_fk_pessoas_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_empresa_id_88ea251a_fk_pessoas_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.pessoas_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2255 (class 2606 OID 18994)
-- Name: pedidos_pedido_funcionario_id_8154228a_fk_pessoas_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_funcionario_id_8154228a_fk_pessoas_f FOREIGN KEY (funcionario_id) REFERENCES public.pessoas_funcionario(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2254 (class 2606 OID 18982)
-- Name: pedidos_pedido_status_id_84f6c512_fk_pedidos_statuspedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_status_id_84f6c512_fk_pedidos_statuspedido_id FOREIGN KEY (status_id) REFERENCES public.pedidos_statuspedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2261 (class 2606 OID 18976)
-- Name: pedidos_pedidoproduto_pedido_id_ab5340e1_fk_pedidos_pedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pedido_id_ab5340e1_fk_pedidos_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedidos_pedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2260 (class 2606 OID 18930)
-- Name: pedidos_pedidoproduto_produto_id_d564b867_fk_pedidos_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_produto_id_d564b867_fk_pedidos_produto_id FOREIGN KEY (produto_id) REFERENCES public.pedidos_produto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2256 (class 2606 OID 18901)
-- Name: pedidos_produto_categoria_id_13275e73_fk_pedidos_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_categoria_id_13275e73_fk_pedidos_c FOREIGN KEY (categoria_id) REFERENCES public.pedidos_categoriaproduto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2257 (class 2606 OID 18906)
-- Name: pedidos_produto_empresa_id_eddee74b_fk_pessoas_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_empresa_id_eddee74b_fk_pessoas_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.pessoas_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2249 (class 2606 OID 18829)
-- Name: pessoas_empresa_cidade_id_40bb748c_fk_outros_cidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa
    ADD CONSTRAINT pessoas_empresa_cidade_id_40bb748c_fk_outros_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.outros_cidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2251 (class 2606 OID 18817)
-- Name: pessoas_funcionario_empresa_id_7e9d8835_fk_pessoas_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_empresa_id_7e9d8835_fk_pessoas_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.pessoas_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2250 (class 2606 OID 18812)
-- Name: pessoas_funcionario_user_ptr_id_950559db_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_user_ptr_id_950559db_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-03-21 20:46:03 -03

--
-- PostgreSQL database dump complete
--

