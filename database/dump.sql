--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2020-04-05 18:47:59 -03

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
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 20114)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 20112)
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
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 190 (class 1259 OID 20124)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 20122)
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
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 186 (class 1259 OID 20106)
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
-- TOC entry 185 (class 1259 OID 20104)
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
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 192 (class 1259 OID 20132)
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
-- TOC entry 194 (class 1259 OID 20142)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 20140)
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
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 191 (class 1259 OID 20130)
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
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 196 (class 1259 OID 20150)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 20148)
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
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 198 (class 1259 OID 20210)
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
-- TOC entry 197 (class 1259 OID 20208)
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
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 184 (class 1259 OID 20096)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 20094)
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
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 182 (class 1259 OID 20085)
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
-- TOC entry 181 (class 1259 OID 20083)
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
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 220 (class 1259 OID 20407)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20243)
-- Name: outros_cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outros_cidade (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.outros_cidade OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20241)
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
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 199
-- Name: outros_cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outros_cidade_id_seq OWNED BY public.outros_cidade.id;


--
-- TOC entry 207 (class 1259 OID 20294)
-- Name: pedidos_categoriaproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_categoriaproduto (
    id integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.pedidos_categoriaproduto OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 20292)
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
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 206
-- Name: pedidos_categoriaproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_categoriaproduto_id_seq OWNED BY public.pedidos_categoriaproduto.id;


--
-- TOC entry 209 (class 1259 OID 20302)
-- Name: pedidos_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_endereco (
    id integer NOT NULL,
    endereco character varying(50) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(50),
    cidade_id integer NOT NULL,
    pedido_id integer NOT NULL,
    referencia character varying(50)
);


ALTER TABLE public.pedidos_endereco OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 20300)
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
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 208
-- Name: pedidos_endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_endereco_id_seq OWNED BY public.pedidos_endereco.id;


--
-- TOC entry 211 (class 1259 OID 20310)
-- Name: pedidos_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_pedido (
    id integer NOT NULL,
    data timestamp with time zone NOT NULL,
    horario_entrega character varying(30) NOT NULL,
    observacao_cliente text,
    observacao_funcionario text,
    impresso boolean NOT NULL,
    pdf_gerado boolean NOT NULL,
    cliente_id integer NOT NULL,
    empresa_id integer NOT NULL,
    funcionario_id integer,
    status_id integer NOT NULL
);


ALTER TABLE public.pedidos_pedido OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 20308)
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
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedidos_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_pedido_id_seq OWNED BY public.pedidos_pedido.id;


--
-- TOC entry 219 (class 1259 OID 20345)
-- Name: pedidos_pedidoproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_pedidoproduto (
    id integer NOT NULL,
    quantidade character varying(30) NOT NULL,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE public.pedidos_pedidoproduto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 20343)
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
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 218
-- Name: pedidos_pedidoproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_pedidoproduto_id_seq OWNED BY public.pedidos_pedidoproduto.id;


--
-- TOC entry 217 (class 1259 OID 20337)
-- Name: pedidos_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_produto (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    imagem character varying(100),
    categoria_id integer,
    situacao_id integer NOT NULL
);


ALTER TABLE public.pedidos_produto OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 20335)
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
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_produto_id_seq OWNED BY public.pedidos_produto.id;


--
-- TOC entry 213 (class 1259 OID 20321)
-- Name: pedidos_statuspedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_statuspedido (
    id integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.pedidos_statuspedido OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 20319)
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
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 212
-- Name: pedidos_statuspedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_statuspedido_id_seq OWNED BY public.pedidos_statuspedido.id;


--
-- TOC entry 215 (class 1259 OID 20329)
-- Name: pedidos_statusproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_statusproduto (
    id integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.pedidos_statusproduto OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 20327)
-- Name: pedidos_statusproduto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_statusproduto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_statusproduto_id_seq OWNER TO postgres;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 214
-- Name: pedidos_statusproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_statusproduto_id_seq OWNED BY public.pedidos_statusproduto.id;


--
-- TOC entry 202 (class 1259 OID 20251)
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
-- TOC entry 201 (class 1259 OID 20249)
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
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 201
-- Name: pessoas_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoas_cliente_id_seq OWNED BY public.pessoas_cliente.id;


--
-- TOC entry 204 (class 1259 OID 20261)
-- Name: pessoas_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas_empresa (
    id integer NOT NULL,
    nome_fantasia character varying(30) NOT NULL,
    imagem character varying(100) NOT NULL,
    cidade_id integer NOT NULL
);


ALTER TABLE public.pessoas_empresa OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20259)
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
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 203
-- Name: pessoas_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoas_empresa_id_seq OWNED BY public.pessoas_empresa.id;


--
-- TOC entry 205 (class 1259 OID 20267)
-- Name: pessoas_funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas_funcionario (
    user_ptr_id integer NOT NULL,
    nome character varying(50) NOT NULL,
    hash text,
    empresa_id integer NOT NULL
);


ALTER TABLE public.pessoas_funcionario OWNER TO postgres;

--
-- TOC entry 2146 (class 2604 OID 20117)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 20127)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 20109)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 20135)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 20145)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 20153)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 20213)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 20099)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 20088)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 20246)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outros_cidade ALTER COLUMN id SET DEFAULT nextval('public.outros_cidade_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 20297)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_categoriaproduto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_categoriaproduto_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 20305)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco ALTER COLUMN id SET DEFAULT nextval('public.pedidos_endereco_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 20313)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido ALTER COLUMN id SET DEFAULT nextval('public.pedidos_pedido_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 20348)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_pedidoproduto_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 20340)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_produto_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 20324)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statuspedido ALTER COLUMN id SET DEFAULT nextval('public.pedidos_statuspedido_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 20332)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statusproduto ALTER COLUMN id SET DEFAULT nextval('public.pedidos_statusproduto_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 20254)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente ALTER COLUMN id SET DEFAULT nextval('public.pessoas_cliente_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 20264)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa ALTER COLUMN id SET DEFAULT nextval('public.pessoas_empresa_id_seq'::regclass);


--
-- TOC entry 2391 (class 0 OID 20114)
-- Dependencies: 188
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group VALUES (1, 'Funcionário Empresa');


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- TOC entry 2393 (class 0 OID 20124)
-- Dependencies: 190
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_permissions VALUES (1, 1, 73);
INSERT INTO public.auth_group_permissions VALUES (2, 1, 74);
INSERT INTO public.auth_group_permissions VALUES (3, 1, 64);
INSERT INTO public.auth_group_permissions VALUES (4, 1, 45);
INSERT INTO public.auth_group_permissions VALUES (5, 1, 46);
INSERT INTO public.auth_group_permissions VALUES (6, 1, 47);
INSERT INTO public.auth_group_permissions VALUES (7, 1, 48);
INSERT INTO public.auth_group_permissions VALUES (8, 1, 61);
INSERT INTO public.auth_group_permissions VALUES (9, 1, 62);


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 9, true);


--
-- TOC entry 2389 (class 0 OID 20106)
-- Dependencies: 186
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (6, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (7, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (8, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (9, 'Can add permission', 4, 'add_permission');
INSERT INTO public.auth_permission VALUES (10, 'Can change permission', 4, 'change_permission');
INSERT INTO public.auth_permission VALUES (11, 'Can delete permission', 4, 'delete_permission');
INSERT INTO public.auth_permission VALUES (12, 'Can view permission', 4, 'view_permission');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 2, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 2, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 2, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 2, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add Empresa', 8, 'add_empresa');
INSERT INTO public.auth_permission VALUES (26, 'Can change Empresa', 8, 'change_empresa');
INSERT INTO public.auth_permission VALUES (27, 'Can delete Empresa', 8, 'delete_empresa');
INSERT INTO public.auth_permission VALUES (28, 'Can view Empresa', 8, 'view_empresa');
INSERT INTO public.auth_permission VALUES (29, 'Can add Funcionário', 7, 'add_funcionario');
INSERT INTO public.auth_permission VALUES (30, 'Can change Funcionário', 7, 'change_funcionario');
INSERT INTO public.auth_permission VALUES (31, 'Can delete Funcionário', 7, 'delete_funcionario');
INSERT INTO public.auth_permission VALUES (32, 'Can view Funcionário', 7, 'view_funcionario');
INSERT INTO public.auth_permission VALUES (33, 'Can add Cliente', 9, 'add_cliente');
INSERT INTO public.auth_permission VALUES (34, 'Can change Cliente', 9, 'change_cliente');
INSERT INTO public.auth_permission VALUES (35, 'Can delete Cliente', 9, 'delete_cliente');
INSERT INTO public.auth_permission VALUES (36, 'Can view Cliente', 9, 'view_cliente');
INSERT INTO public.auth_permission VALUES (37, 'Can add Cidade', 10, 'add_cidade');
INSERT INTO public.auth_permission VALUES (38, 'Can change Cidade', 10, 'change_cidade');
INSERT INTO public.auth_permission VALUES (39, 'Can delete Cidade', 10, 'delete_cidade');
INSERT INTO public.auth_permission VALUES (40, 'Can view Cidade', 10, 'view_cidade');
INSERT INTO public.auth_permission VALUES (41, 'Can add Categoria de Produtos', 13, 'add_categoriaproduto');
INSERT INTO public.auth_permission VALUES (42, 'Can change Categoria de Produtos', 13, 'change_categoriaproduto');
INSERT INTO public.auth_permission VALUES (43, 'Can delete Categoria de Produtos', 13, 'delete_categoriaproduto');
INSERT INTO public.auth_permission VALUES (44, 'Can view Categoria de Produtos', 13, 'view_categoriaproduto');
INSERT INTO public.auth_permission VALUES (45, 'Can add Produtos do pedido', 17, 'add_pedidoproduto');
INSERT INTO public.auth_permission VALUES (46, 'Can change Produtos do pedido', 17, 'change_pedidoproduto');
INSERT INTO public.auth_permission VALUES (47, 'Can delete Produtos do pedido', 17, 'delete_pedidoproduto');
INSERT INTO public.auth_permission VALUES (48, 'Can view Produtos do pedido', 17, 'view_pedidoproduto');
INSERT INTO public.auth_permission VALUES (49, 'Can add Produto', 15, 'add_produto');
INSERT INTO public.auth_permission VALUES (50, 'Can change Produto', 15, 'change_produto');
INSERT INTO public.auth_permission VALUES (51, 'Can delete Produto', 15, 'delete_produto');
INSERT INTO public.auth_permission VALUES (52, 'Can view Produto', 15, 'view_produto');
INSERT INTO public.auth_permission VALUES (53, 'Can add Situação dos Pedidos', 12, 'add_statuspedido');
INSERT INTO public.auth_permission VALUES (54, 'Can change Situação dos Pedidos', 12, 'change_statuspedido');
INSERT INTO public.auth_permission VALUES (55, 'Can delete Situação dos Pedidos', 12, 'delete_statuspedido');
INSERT INTO public.auth_permission VALUES (56, 'Can view Situação dos Pedidos', 12, 'view_statuspedido');
INSERT INTO public.auth_permission VALUES (57, 'Can add Situação dos Produtos', 14, 'add_statusproduto');
INSERT INTO public.auth_permission VALUES (58, 'Can change Situação dos Produtos', 14, 'change_statusproduto');
INSERT INTO public.auth_permission VALUES (59, 'Can delete Situação dos Produtos', 14, 'delete_statusproduto');
INSERT INTO public.auth_permission VALUES (60, 'Can view Situação dos Produtos', 14, 'view_statusproduto');
INSERT INTO public.auth_permission VALUES (61, 'Can add endereco', 11, 'add_endereco');
INSERT INTO public.auth_permission VALUES (62, 'Can change endereco', 11, 'change_endereco');
INSERT INTO public.auth_permission VALUES (63, 'Can delete endereco', 11, 'delete_endereco');
INSERT INTO public.auth_permission VALUES (64, 'Can view endereco', 11, 'view_endereco');
INSERT INTO public.auth_permission VALUES (65, 'Can add Pedido', 16, 'add_pedido');
INSERT INTO public.auth_permission VALUES (66, 'Can change Pedido', 16, 'change_pedido');
INSERT INTO public.auth_permission VALUES (67, 'Can delete Pedido', 16, 'delete_pedido');
INSERT INTO public.auth_permission VALUES (68, 'Can view Pedido', 16, 'view_pedido');
INSERT INTO public.auth_permission VALUES (69, 'Can add Produto da empresa', 18, 'add_produtoempresa');
INSERT INTO public.auth_permission VALUES (70, 'Can change Produto da empresa', 18, 'change_produtoempresa');
INSERT INTO public.auth_permission VALUES (71, 'Can delete Produto da empresa', 18, 'delete_produtoempresa');
INSERT INTO public.auth_permission VALUES (72, 'Can view Produto da empresa', 18, 'view_produtoempresa');
INSERT INTO public.auth_permission VALUES (73, 'Can add Pedido da empresa', 19, 'add_pedidoempresa');
INSERT INTO public.auth_permission VALUES (74, 'Can change Pedido da empresa', 19, 'change_pedidoempresa');
INSERT INTO public.auth_permission VALUES (75, 'Can delete Pedido da empresa', 19, 'delete_pedidoempresa');
INSERT INTO public.auth_permission VALUES (76, 'Can view Pedido da empresa', 19, 'view_pedidoempresa');


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- TOC entry 2395 (class 0 OID 20132)
-- Dependencies: 192
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user VALUES (3, 'pbkdf2_sha256$150000$SxxiluGCb1hy$SUOgrtrnwsyLKhwJjA55R19eGhp897JE6SWmUGZLRd4=', NULL, false, 'maria', '', '', '', true, true, '2020-03-29 18:25:34.609813-03');
INSERT INTO public.auth_user VALUES (2, 'pbkdf2_sha256$150000$MD3VNyKp59YN$NgqPcmylbBr7Fdv4UxxFdtqS5ERzlmWyDfrb/Soy0P8=', '2020-03-29 18:44:19.761473-03', false, 'ana', '', '', '', true, true, '2020-03-29 18:25:17.740468-03');
INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$150000$GAQlsN4OTLzC$FqiJkekE+qkTgPVsvZaw0J+6AkG+ed5idTlMqQ0ExMI=', '2020-04-05 18:43:44.062134-03', true, 'admin', '', '', 'admin@gmail.com', true, true, '2020-03-29 18:15:30.744723-03');


--
-- TOC entry 2397 (class 0 OID 20142)
-- Dependencies: 194
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user_groups VALUES (1, 2, 1);
INSERT INTO public.auth_user_groups VALUES (2, 3, 1);


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- TOC entry 2399 (class 0 OID 20150)
-- Dependencies: 196
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2401 (class 0 OID 20210)
-- Dependencies: 198
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log VALUES (1, '2020-03-29 18:16:53.760387-03', '1', 'Cadastrado pelo usuário', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (2, '2020-03-29 18:17:02.129081-03', '2', 'Aprovado', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (3, '2020-03-29 18:17:06.298041-03', '3', 'Rejeitado', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (4, '2020-03-29 18:17:43.868139-03', '1', 'Aguardando Atendimento', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (5, '2020-03-29 18:17:49.487026-03', '2', 'Em atendimento', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (6, '2020-03-29 18:17:55.429156-03', '3', 'Aguardando Entrega', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (7, '2020-03-29 18:18:00.830025-03', '4', 'Entregue', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (8, '2020-03-29 18:18:05.601592-03', '5', 'Cancelado', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (9, '2020-03-29 18:18:18.605237-03', '1', 'Higiene e Limpeza', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (10, '2020-03-29 18:18:22.831451-03', '2', 'Alimentícios', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log VALUES (11, '2020-03-29 18:19:41.100821-03', '1', 'Arroz Blue Ville 2kg', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log VALUES (12, '2020-03-29 18:20:41.567094-03', '2', 'QBoa 1 litro', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log VALUES (13, '2020-03-29 18:21:09.826678-03', '1', 'Ibirubá', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (14, '2020-03-29 18:24:05.847615-03', '1', 'Cotribá - Ibirubá', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (15, '2020-03-29 18:24:42.105145-03', '2', 'Coopeagri - Ibirubá', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (16, '2020-03-29 18:25:18.166639-03', '2', 'ana', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (17, '2020-03-29 18:25:34.975561-03', '3', 'Maria', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (18, '2020-03-29 18:25:50.270924-03', '2', 'ana', 2, '[{"changed": {"fields": ["password"]}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (19, '2020-03-29 18:26:01.895128-03', '3', 'Maria', 2, '[{"changed": {"fields": ["password"]}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (20, '2020-03-29 18:26:21.371331-03', '1', 'João', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (21, '2020-03-29 18:33:52.971212-03', '1', 'Funcionário Empresa', 1, '[{"added": {}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (22, '2020-03-29 18:34:15.65095-03', '1', 'Funcionário Empresa', 2, '[{"changed": {"fields": ["permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (23, '2020-03-29 18:39:40.234724-03', '1', '2020-03-29 18:39:19-03:00 : João', 1, '[{"added": {}}, {"added": {"name": "endereco", "object": "Rua J\u00falio Rosa"}}, {"added": {"name": "Produtos do pedido", "object": "Arroz Blue Ville 2kg"}}, {"added": {"name": "Produtos do pedido", "object": "QBoa 1 litro"}}]', 16, 1);
INSERT INTO public.django_admin_log VALUES (24, '2020-03-29 18:39:49.528939-03', '1', '2020-03-29 18:39:19-03:00 : João', 2, '[]', 16, 1);
INSERT INTO public.django_admin_log VALUES (25, '2020-03-29 18:40:13.801902-03', '2', '2020-03-29 18:39:59-03:00 : João', 1, '[{"added": {}}, {"added": {"name": "endereco", "object": "Rua J\u00falio Rosa"}}, {"added": {"name": "Produtos do pedido", "object": "QBoa 1 litro"}}]', 16, 1);
INSERT INTO public.django_admin_log VALUES (26, '2020-03-29 18:41:56.130199-03', '2', 'ana', 2, '[{"changed": {"fields": ["password", "groups"]}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (27, '2020-03-29 18:42:02.507239-03', '3', 'Maria', 2, '[{"changed": {"fields": ["password", "groups"]}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (28, '2020-03-29 18:44:13.060728-03', '1', 'Funcionário Empresa', 2, '[{"changed": {"fields": ["permissions"]}}]', 3, 1);
INSERT INTO public.django_admin_log VALUES (29, '2020-03-29 18:44:56.200554-03', '3', '2020-03-29 18:44:43-03:00 : João', 1, '[{"added": {}}, {"added": {"name": "endereco", "object": "Rua J\u00falio Rosa"}}, {"added": {"name": "Produtos do pedido", "object": "Arroz Blue Ville 2kg"}}]', 19, 2);


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- TOC entry 2387 (class 0 OID 20096)
-- Dependencies: 184
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'pessoas', 'funcionario');
INSERT INTO public.django_content_type VALUES (8, 'pessoas', 'empresa');
INSERT INTO public.django_content_type VALUES (9, 'pessoas', 'cliente');
INSERT INTO public.django_content_type VALUES (10, 'outros', 'cidade');
INSERT INTO public.django_content_type VALUES (11, 'pedidos', 'endereco');
INSERT INTO public.django_content_type VALUES (12, 'pedidos', 'statuspedido');
INSERT INTO public.django_content_type VALUES (13, 'pedidos', 'categoriaproduto');
INSERT INTO public.django_content_type VALUES (14, 'pedidos', 'statusproduto');
INSERT INTO public.django_content_type VALUES (15, 'pedidos', 'produto');
INSERT INTO public.django_content_type VALUES (16, 'pedidos', 'pedido');
INSERT INTO public.django_content_type VALUES (17, 'pedidos', 'pedidoproduto');
INSERT INTO public.django_content_type VALUES (18, 'pedidos_empresa', 'produtoempresa');
INSERT INTO public.django_content_type VALUES (19, 'pedidos_empresa', 'pedidoempresa');


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- TOC entry 2385 (class 0 OID 20085)
-- Dependencies: 182
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2020-03-29 18:15:07.471671-03');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2020-03-29 18:15:07.562352-03');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2020-03-29 18:15:07.669404-03');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-03-29 18:15:07.703882-03');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-29 18:15:07.722769-03');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-03-29 18:15:07.76337-03');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-03-29 18:15:07.77574-03');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-03-29 18:15:07.798708-03');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-03-29 18:15:07.816821-03');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-03-29 18:15:07.84154-03');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-03-29 18:15:07.846546-03');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-29 18:15:07.871956-03');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-03-29 18:15:07.897025-03');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-29 18:15:07.916213-03');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-03-29 18:15:07.939675-03');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-03-29 18:15:07.964026-03');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_auto_20200321_1033', '2020-03-29 18:15:07.981601-03');
INSERT INTO public.django_migrations VALUES (18, 'auth', '0013_auto_20200329_1748', '2020-03-29 18:15:08.001574-03');
INSERT INTO public.django_migrations VALUES (19, 'outros', '0001_initial', '2020-03-29 18:15:08.013277-03');
INSERT INTO public.django_migrations VALUES (20, 'pessoas', '0001_initial', '2020-03-29 18:15:08.078878-03');
INSERT INTO public.django_migrations VALUES (21, 'pedidos', '0001_initial', '2020-03-29 18:15:08.185995-03');
INSERT INTO public.django_migrations VALUES (22, 'pedidos', '0002_auto_20200329_1814', '2020-03-29 18:15:08.390564-03');
INSERT INTO public.django_migrations VALUES (23, 'pedidos_empresa', '0001_initial', '2020-03-29 18:15:08.434687-03');
INSERT INTO public.django_migrations VALUES (24, 'sessions', '0001_initial', '2020-03-29 18:15:08.453265-03');
INSERT INTO public.django_migrations VALUES (25, 'pedidos', '0003_produto_situacao', '2020-03-29 18:16:07.250687-03');
INSERT INTO public.django_migrations VALUES (26, 'pedidos', '0004_auto_20200329_1819', '2020-03-29 18:19:11.024115-03');
INSERT INTO public.django_migrations VALUES (27, 'pessoas', '0002_remove_empresa_limite_produto', '2020-03-29 18:23:18.177644-03');
INSERT INTO public.django_migrations VALUES (28, 'pedidos_empresa', '0002_auto_20200329_1833', '2020-03-29 18:33:38.155579-03');
INSERT INTO public.django_migrations VALUES (29, 'pedidos', '0005_auto_20200329_1837', '2020-03-29 18:37:34.969255-03');
INSERT INTO public.django_migrations VALUES (30, 'pedidos', '0006_auto_20200329_1838', '2020-03-29 18:39:00.315659-03');


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- TOC entry 2423 (class 0 OID 20407)
-- Dependencies: 220
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session VALUES ('optpj71iqu5cg2fxol8ybrrjrmoaowfq', 'ZGYwODYzYmE5ZWM0MTIxM2Q2ZDU5OTgwMTljNjQxMDM3YWMzZTRjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyMDU4YmY4ZmJkZjhhYzcyZmRhNjFkZjFiMzY5ZTIyNDU2ZGY4ZDA3In0=', '2020-04-19 18:43:44.077097-03');


--
-- TOC entry 2403 (class 0 OID 20243)
-- Dependencies: 200
-- Data for Name: outros_cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.outros_cidade VALUES (1, 'Ibirubá');


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 199
-- Name: outros_cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outros_cidade_id_seq', 1, true);


--
-- TOC entry 2410 (class 0 OID 20294)
-- Dependencies: 207
-- Data for Name: pedidos_categoriaproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_categoriaproduto VALUES (1, 'Higiene e Limpeza');
INSERT INTO public.pedidos_categoriaproduto VALUES (2, 'Alimentícios');


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 206
-- Name: pedidos_categoriaproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_categoriaproduto_id_seq', 2, true);


--
-- TOC entry 2412 (class 0 OID 20302)
-- Dependencies: 209
-- Data for Name: pedidos_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_endereco VALUES (1, 'Rua Júlio Rosa', 1245, NULL, 1, 1, NULL);
INSERT INTO public.pedidos_endereco VALUES (2, 'Rua Júlio Rosa', 1245, NULL, 1, 2, NULL);
INSERT INTO public.pedidos_endereco VALUES (3, 'Rua Júlio Rosa', 1245, NULL, 1, 3, NULL);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 208
-- Name: pedidos_endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_endereco_id_seq', 3, true);


--
-- TOC entry 2414 (class 0 OID 20310)
-- Dependencies: 211
-- Data for Name: pedidos_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_pedido VALUES (1, '2020-03-29 18:39:19-03', 'Qualquer horário de tarde', '', '', false, false, 1, 2, NULL, 1);
INSERT INTO public.pedidos_pedido VALUES (2, '2020-03-29 18:39:59-03', 'Qualquer horário de tarde', '', '', false, false, 1, 1, NULL, 3);
INSERT INTO public.pedidos_pedido VALUES (3, '2020-03-29 18:44:43-03', 'Qualquer horário de tarde', '', '', false, false, 1, 2, NULL, 2);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedidos_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_pedido_id_seq', 3, true);


--
-- TOC entry 2422 (class 0 OID 20345)
-- Dependencies: 219
-- Data for Name: pedidos_pedidoproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_pedidoproduto VALUES (1, '2', 1, 1);
INSERT INTO public.pedidos_pedidoproduto VALUES (2, '1 caixa', 1, 2);
INSERT INTO public.pedidos_pedidoproduto VALUES (3, '1', 2, 2);
INSERT INTO public.pedidos_pedidoproduto VALUES (4, '1', 3, 1);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 218
-- Name: pedidos_pedidoproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_pedidoproduto_id_seq', 4, true);


--
-- TOC entry 2420 (class 0 OID 20337)
-- Dependencies: 217
-- Data for Name: pedidos_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_produto VALUES (1, 'Arroz Blue Ville 2kg', '', 2, 1);
INSERT INTO public.pedidos_produto VALUES (2, 'QBoa 1 litro', '', 1, 2);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_produto_id_seq', 2, true);


--
-- TOC entry 2416 (class 0 OID 20321)
-- Dependencies: 213
-- Data for Name: pedidos_statuspedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_statuspedido VALUES (1, 'Aguardando Atendimento');
INSERT INTO public.pedidos_statuspedido VALUES (2, 'Em atendimento');
INSERT INTO public.pedidos_statuspedido VALUES (3, 'Aguardando Entrega');
INSERT INTO public.pedidos_statuspedido VALUES (4, 'Entregue');
INSERT INTO public.pedidos_statuspedido VALUES (5, 'Cancelado');


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 212
-- Name: pedidos_statuspedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_statuspedido_id_seq', 5, true);


--
-- TOC entry 2418 (class 0 OID 20329)
-- Dependencies: 215
-- Data for Name: pedidos_statusproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos_statusproduto VALUES (1, 'Cadastrado pelo usuário');
INSERT INTO public.pedidos_statusproduto VALUES (2, 'Aprovado');
INSERT INTO public.pedidos_statusproduto VALUES (3, 'Rejeitado');


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 214
-- Name: pedidos_statusproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_statusproduto_id_seq', 3, true);


--
-- TOC entry 2405 (class 0 OID 20251)
-- Dependencies: 202
-- Data for Name: pessoas_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_cliente VALUES (1, 'João', 54991552720, 0);


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 201
-- Name: pessoas_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoas_cliente_id_seq', 1, true);


--
-- TOC entry 2407 (class 0 OID 20261)
-- Dependencies: 204
-- Data for Name: pessoas_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_empresa VALUES (1, 'Cotribá', 'empresas/cotriba_02yeeCr.png', 1);
INSERT INTO public.pessoas_empresa VALUES (2, 'Coopeagri', 'empresas/coopeagri_8MJpbp6.png', 1);


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 203
-- Name: pessoas_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoas_empresa_id_seq', 2, true);


--
-- TOC entry 2408 (class 0 OID 20267)
-- Dependencies: 205
-- Data for Name: pessoas_funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas_funcionario VALUES (2, 'ana', NULL, 2);
INSERT INTO public.pessoas_funcionario VALUES (3, 'Maria', NULL, 1);


--
-- TOC entry 2176 (class 2606 OID 20239)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2181 (class 2606 OID 20176)
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2184 (class 2606 OID 20129)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 20119)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2171 (class 2606 OID 20162)
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2173 (class 2606 OID 20111)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 20147)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2195 (class 2606 OID 20191)
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2186 (class 2606 OID 20137)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 20155)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2201 (class 2606 OID 20205)
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2189 (class 2606 OID 20233)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2204 (class 2606 OID 20219)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 20103)
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2168 (class 2606 OID 20101)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 20093)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2246 (class 2606 OID 20414)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2207 (class 2606 OID 20248)
-- Name: outros_cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outros_cidade
    ADD CONSTRAINT outros_cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2219 (class 2606 OID 20299)
-- Name: pedidos_categoriaproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_categoriaproduto
    ADD CONSTRAINT pedidos_categoriaproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2223 (class 2606 OID 20307)
-- Name: pedidos_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2228 (class 2606 OID 20318)
-- Name: pedidos_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 20370)
-- Name: pedidos_pedidoproduto_pedido_id_produto_id_b539101f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pedido_id_produto_id_b539101f_uniq UNIQUE (pedido_id, produto_id);


--
-- TOC entry 2242 (class 2606 OID 20350)
-- Name: pedidos_pedidoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2236 (class 2606 OID 20342)
-- Name: pedidos_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2231 (class 2606 OID 20326)
-- Name: pedidos_statuspedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statuspedido
    ADD CONSTRAINT pedidos_statuspedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 20334)
-- Name: pedidos_statusproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_statusproduto
    ADD CONSTRAINT pedidos_statusproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 20256)
-- Name: pessoas_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente
    ADD CONSTRAINT pessoas_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 20258)
-- Name: pessoas_cliente_telefone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_cliente
    ADD CONSTRAINT pessoas_cliente_telefone_key UNIQUE (telefone);


--
-- TOC entry 2214 (class 2606 OID 20266)
-- Name: pessoas_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa
    ADD CONSTRAINT pessoas_empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2217 (class 2606 OID 20274)
-- Name: pessoas_funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_pkey PRIMARY KEY (user_ptr_id);


--
-- TOC entry 2174 (class 1259 OID 20240)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2179 (class 1259 OID 20177)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2182 (class 1259 OID 20178)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2169 (class 1259 OID 20163)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2190 (class 1259 OID 20193)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2193 (class 1259 OID 20192)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2196 (class 1259 OID 20207)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2199 (class 1259 OID 20206)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2187 (class 1259 OID 20234)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2202 (class 1259 OID 20230)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2205 (class 1259 OID 20231)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2244 (class 1259 OID 20416)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2247 (class 1259 OID 20415)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2220 (class 1259 OID 20395)
-- Name: pedidos_endereco_cidade_id_d411cb38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_endereco_cidade_id_d411cb38 ON public.pedidos_endereco USING btree (cidade_id);


--
-- TOC entry 2221 (class 1259 OID 20401)
-- Name: pedidos_endereco_pedido_id_1f69ee37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_endereco_pedido_id_1f69ee37 ON public.pedidos_endereco USING btree (pedido_id);


--
-- TOC entry 2224 (class 1259 OID 20371)
-- Name: pedidos_pedido_cliente_id_84f4fc73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_cliente_id_84f4fc73 ON public.pedidos_pedido USING btree (cliente_id);


--
-- TOC entry 2225 (class 1259 OID 20377)
-- Name: pedidos_pedido_empresa_id_88ea251a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_empresa_id_88ea251a ON public.pedidos_pedido USING btree (empresa_id);


--
-- TOC entry 2226 (class 1259 OID 20383)
-- Name: pedidos_pedido_funcionario_id_8154228a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_funcionario_id_8154228a ON public.pedidos_pedido USING btree (funcionario_id);


--
-- TOC entry 2229 (class 1259 OID 20389)
-- Name: pedidos_pedido_status_id_84f6c512; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedido_status_id_84f6c512 ON public.pedidos_pedido USING btree (status_id);


--
-- TOC entry 2238 (class 1259 OID 20367)
-- Name: pedidos_pedidoproduto_pedido_id_ab5340e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedidoproduto_pedido_id_ab5340e1 ON public.pedidos_pedidoproduto USING btree (pedido_id);


--
-- TOC entry 2243 (class 1259 OID 20368)
-- Name: pedidos_pedidoproduto_produto_id_d564b867; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_pedidoproduto_produto_id_d564b867 ON public.pedidos_pedidoproduto USING btree (produto_id);


--
-- TOC entry 2234 (class 1259 OID 20356)
-- Name: pedidos_produto_categoria_id_13275e73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_produto_categoria_id_13275e73 ON public.pedidos_produto USING btree (categoria_id);


--
-- TOC entry 2237 (class 1259 OID 20418)
-- Name: pedidos_produto_situacao_id_ee34177f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedidos_produto_situacao_id_ee34177f ON public.pedidos_produto USING btree (situacao_id);


--
-- TOC entry 2212 (class 1259 OID 20280)
-- Name: pessoas_empresa_cidade_id_40bb748c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pessoas_empresa_cidade_id_40bb748c ON public.pessoas_empresa USING btree (cidade_id);


--
-- TOC entry 2215 (class 1259 OID 20291)
-- Name: pessoas_funcionario_empresa_id_7e9d8835; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pessoas_funcionario_empresa_id_7e9d8835 ON public.pessoas_funcionario USING btree (empresa_id);


--
-- TOC entry 2250 (class 2606 OID 20170)
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2249 (class 2606 OID 20165)
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2248 (class 2606 OID 20156)
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2252 (class 2606 OID 20185)
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2251 (class 2606 OID 20180)
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2254 (class 2606 OID 20199)
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2253 (class 2606 OID 20194)
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2255 (class 2606 OID 20220)
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2256 (class 2606 OID 20225)
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2260 (class 2606 OID 20396)
-- Name: pedidos_endereco_cidade_id_d411cb38_fk_outros_cidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_cidade_id_d411cb38_fk_outros_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.outros_cidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2261 (class 2606 OID 20402)
-- Name: pedidos_endereco_pedido_id_1f69ee37_fk_pedidos_pedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_endereco
    ADD CONSTRAINT pedidos_endereco_pedido_id_1f69ee37_fk_pedidos_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedidos_pedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2262 (class 2606 OID 20372)
-- Name: pedidos_pedido_cliente_id_84f4fc73_fk_pessoas_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_cliente_id_84f4fc73_fk_pessoas_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.pessoas_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2263 (class 2606 OID 20378)
-- Name: pedidos_pedido_empresa_id_88ea251a_fk_pessoas_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_empresa_id_88ea251a_fk_pessoas_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.pessoas_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2264 (class 2606 OID 20384)
-- Name: pedidos_pedido_funcionario_id_8154228a_fk_pessoas_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_funcionario_id_8154228a_fk_pessoas_f FOREIGN KEY (funcionario_id) REFERENCES public.pessoas_funcionario(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2265 (class 2606 OID 20390)
-- Name: pedidos_pedido_status_id_84f6c512_fk_pedidos_statuspedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedido
    ADD CONSTRAINT pedidos_pedido_status_id_84f6c512_fk_pedidos_statuspedido_id FOREIGN KEY (status_id) REFERENCES public.pedidos_statuspedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2268 (class 2606 OID 20357)
-- Name: pedidos_pedidoproduto_pedido_id_ab5340e1_fk_pedidos_pedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_pedido_id_ab5340e1_fk_pedidos_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedidos_pedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2269 (class 2606 OID 20362)
-- Name: pedidos_pedidoproduto_produto_id_d564b867_fk_pedidos_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_pedidoproduto
    ADD CONSTRAINT pedidos_pedidoproduto_produto_id_d564b867_fk_pedidos_produto_id FOREIGN KEY (produto_id) REFERENCES public.pedidos_produto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2266 (class 2606 OID 20351)
-- Name: pedidos_produto_categoria_id_13275e73_fk_pedidos_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_categoria_id_13275e73_fk_pedidos_c FOREIGN KEY (categoria_id) REFERENCES public.pedidos_categoriaproduto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2267 (class 2606 OID 20425)
-- Name: pedidos_produto_situacao_id_ee34177f_fk_pedidos_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_produto
    ADD CONSTRAINT pedidos_produto_situacao_id_ee34177f_fk_pedidos_s FOREIGN KEY (situacao_id) REFERENCES public.pedidos_statusproduto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2257 (class 2606 OID 20275)
-- Name: pessoas_empresa_cidade_id_40bb748c_fk_outros_cidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_empresa
    ADD CONSTRAINT pessoas_empresa_cidade_id_40bb748c_fk_outros_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.outros_cidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2259 (class 2606 OID 20286)
-- Name: pessoas_funcionario_empresa_id_7e9d8835_fk_pessoas_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_empresa_id_7e9d8835_fk_pessoas_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.pessoas_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2258 (class 2606 OID 20281)
-- Name: pessoas_funcionario_user_ptr_id_950559db_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas_funcionario
    ADD CONSTRAINT pessoas_funcionario_user_ptr_id_950559db_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-04-05 18:48:00 -03

--
-- PostgreSQL database dump complete
--

