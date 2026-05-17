--
-- PostgreSQL database dump
--

\restrict jF1elbAZqf9fBiU5bN08ddoTcpTxKdxqzh2b88J36i6QH1lwKXu8lWRbt8Bs4QQ

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-05-17 01:48:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 244 (class 1259 OID 16738)
-- Name: alertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alertas (
    id_alerta integer NOT NULL,
    tipo_alerta character varying(50) NOT NULL,
    mensaje text NOT NULL,
    nivel_criticidad character varying(20),
    estado character varying(20) DEFAULT 'ACTIVA'::character varying,
    fecha_generada timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.alertas OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16737)
-- Name: alertas_id_alerta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alertas_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alertas_id_alerta_seq OWNER TO postgres;

--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 243
-- Name: alertas_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alertas_id_alerta_seq OWNED BY public.alertas.id_alerta;


--
-- TOC entry 234 (class 1259 OID 16638)
-- Name: consumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumo (
    id_consumo integer NOT NULL,
    id_sector integer NOT NULL,
    litros_consumidos numeric(10,2),
    fecha_registro date NOT NULL
);


ALTER TABLE public.consumo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16637)
-- Name: consumo_id_consumo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumo_id_consumo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consumo_id_consumo_seq OWNER TO postgres;

--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 233
-- Name: consumo_id_consumo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumo_id_consumo_seq OWNED BY public.consumo.id_consumo;


--
-- TOC entry 236 (class 1259 OID 16653)
-- Name: distribucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distribucion (
    id_distribucion integer NOT NULL,
    id_sector integer NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    cantidad_estimada numeric(10,2),
    estado character varying(20) DEFAULT 'ACTIVO'::character varying
);


ALTER TABLE public.distribucion OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16652)
-- Name: distribucion_id_distribucion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.distribucion_id_distribucion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.distribucion_id_distribucion_seq OWNER TO postgres;

--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 235
-- Name: distribucion_id_distribucion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.distribucion_id_distribucion_seq OWNED BY public.distribucion.id_distribucion;


--
-- TOC entry 226 (class 1259 OID 16568)
-- Name: familias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.familias (
    id_familia integer NOT NULL,
    nombre_responsable character varying(150) NOT NULL,
    dpi_responsable character varying(20),
    telefono character varying(20),
    direccion text NOT NULL,
    numero_integrantes integer NOT NULL,
    estado_servicio character varying(30) DEFAULT 'ACTIVO'::character varying,
    id_sector integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.familias OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16789)
-- Name: familias_eliminadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.familias_eliminadas (
    id_eliminado integer NOT NULL,
    id_familia_original integer NOT NULL,
    nombre_responsable character varying(150) NOT NULL,
    dpi_responsable character varying(20),
    telefono character varying(20),
    direccion text NOT NULL,
    numero_integrantes integer NOT NULL,
    estado_servicio character varying(30),
    id_sector integer,
    usuario_id integer,
    fecha_registro timestamp without time zone,
    motivo_eliminacion text,
    eliminado_por integer,
    fecha_eliminacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.familias_eliminadas OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16788)
-- Name: familias_eliminadas_id_eliminado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.familias_eliminadas_id_eliminado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.familias_eliminadas_id_eliminado_seq OWNER TO postgres;

--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 249
-- Name: familias_eliminadas_id_eliminado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.familias_eliminadas_id_eliminado_seq OWNED BY public.familias_eliminadas.id_eliminado;


--
-- TOC entry 225 (class 1259 OID 16567)
-- Name: familias_id_familia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.familias_id_familia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.familias_id_familia_seq OWNER TO postgres;

--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 225
-- Name: familias_id_familia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.familias_id_familia_seq OWNED BY public.familias.id_familia;


--
-- TOC entry 248 (class 1259 OID 16771)
-- Name: historial_reportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_reportes (
    id_reporte integer NOT NULL,
    usuario_id integer NOT NULL,
    tipo_reporte character varying(100),
    descripcion text,
    fecha_generacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historial_reportes OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16770)
-- Name: historial_reportes_id_reporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_reportes_id_reporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historial_reportes_id_reporte_seq OWNER TO postgres;

--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 247
-- Name: historial_reportes_id_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_reportes_id_reporte_seq OWNED BY public.historial_reportes.id_reporte;


--
-- TOC entry 238 (class 1259 OID 16671)
-- Name: horarios_distribucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios_distribucion (
    id_horario integer NOT NULL,
    id_distribucion integer NOT NULL,
    fecha date NOT NULL,
    observaciones text
);


ALTER TABLE public.horarios_distribucion OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16670)
-- Name: horarios_distribucion_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_distribucion_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_distribucion_id_horario_seq OWNER TO postgres;

--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 237
-- Name: horarios_distribucion_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_distribucion_id_horario_seq OWNED BY public.horarios_distribucion.id_horario;


--
-- TOC entry 240 (class 1259 OID 16688)
-- Name: incidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidencias (
    id_incidencia integer NOT NULL,
    id_familia integer NOT NULL,
    tipo_incidencia character varying(100) NOT NULL,
    descripcion text NOT NULL,
    prioridad character varying(20) DEFAULT 'MEDIA'::character varying,
    estado character varying(30) DEFAULT 'PENDIENTE'::character varying,
    fecha_reporte timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_resolucion timestamp without time zone,
    asignado_a integer
);


ALTER TABLE public.incidencias OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16687)
-- Name: incidencias_id_incidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidencias_id_incidencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidencias_id_incidencia_seq OWNER TO postgres;

--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 239
-- Name: incidencias_id_incidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidencias_id_incidencia_seq OWNED BY public.incidencias.id_incidencia;


--
-- TOC entry 242 (class 1259 OID 16714)
-- Name: mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenimiento (
    id_mantenimiento integer NOT NULL,
    id_sector integer,
    descripcion text NOT NULL,
    fecha_programada date NOT NULL,
    estado character varying(30) DEFAULT 'PENDIENTE'::character varying,
    responsable integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mantenimiento OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16713)
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenimiento_id_mantenimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mantenimiento_id_mantenimiento_seq OWNER TO postgres;

--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 241
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenimiento_id_mantenimiento_seq OWNED BY public.mantenimiento.id_mantenimiento;


--
-- TOC entry 232 (class 1259 OID 16629)
-- Name: metricas_sistema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metricas_sistema (
    id_metrica integer NOT NULL,
    presion numeric(10,2),
    litros_disponibles numeric(10,2),
    nivel_porcentaje numeric(5,2),
    temperatura numeric(5,2),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.metricas_sistema OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16628)
-- Name: metricas_sistema_id_metrica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metricas_sistema_id_metrica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metricas_sistema_id_metrica_seq OWNER TO postgres;

--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 231
-- Name: metricas_sistema_id_metrica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metricas_sistema_id_metrica_seq OWNED BY public.metricas_sistema.id_metrica;


--
-- TOC entry 230 (class 1259 OID 16607)
-- Name: niveles_tanque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveles_tanque (
    id_nivel integer NOT NULL,
    id_tanque integer NOT NULL,
    nivel_litros numeric(10,2) NOT NULL,
    porcentaje numeric(5,2),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    registrado_por integer NOT NULL
);


ALTER TABLE public.niveles_tanque OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16606)
-- Name: niveles_tanque_id_nivel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.niveles_tanque_id_nivel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.niveles_tanque_id_nivel_seq OWNER TO postgres;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 229
-- Name: niveles_tanque_id_nivel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.niveles_tanque_id_nivel_seq OWNED BY public.niveles_tanque.id_nivel;


--
-- TOC entry 246 (class 1259 OID 16752)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    usuario_id integer NOT NULL,
    mensaje text NOT NULL,
    leida boolean DEFAULT false,
    fecha_envio timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16751)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNER TO postgres;

--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 245
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;


--
-- TOC entry 220 (class 1259 OID 16439)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16438)
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_rol_seq OWNER TO postgres;

--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;


--
-- TOC entry 222 (class 1259 OID 16466)
-- Name: sectores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectores (
    id_sector integer NOT NULL,
    nombre_sector character varying(100) NOT NULL,
    descripcion text,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying
);


ALTER TABLE public.sectores OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16465)
-- Name: sectores_id_sector_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectores_id_sector_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sectores_id_sector_seq OWNER TO postgres;

--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 221
-- Name: sectores_id_sector_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectores_id_sector_seq OWNED BY public.sectores.id_sector;


--
-- TOC entry 228 (class 1259 OID 16594)
-- Name: tanques; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tanques (
    id_tanque integer NOT NULL,
    nombre_tanque character varying(100) NOT NULL,
    capacidad_litros numeric(10,2) NOT NULL,
    ubicacion text,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying
);


ALTER TABLE public.tanques OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16593)
-- Name: tanques_id_tanque_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tanques_id_tanque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tanques_id_tanque_seq OWNER TO postgres;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 227
-- Name: tanques_id_tanque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tanques_id_tanque_seq OWNED BY public.tanques.id_tanque;


--
-- TOC entry 224 (class 1259 OID 16543)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_completo character varying(150) NOT NULL,
    usuario character varying(50) NOT NULL,
    correo character varying(150),
    password_hash text NOT NULL,
    telefono character varying(20),
    id_rol integer NOT NULL,
    estado boolean DEFAULT true,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16542)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4957 (class 2604 OID 16741)
-- Name: alertas id_alerta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas ALTER COLUMN id_alerta SET DEFAULT nextval('public.alertas_id_alerta_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 16641)
-- Name: consumo id_consumo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo ALTER COLUMN id_consumo SET DEFAULT nextval('public.consumo_id_consumo_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 16656)
-- Name: distribucion id_distribucion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distribucion ALTER COLUMN id_distribucion SET DEFAULT nextval('public.distribucion_id_distribucion_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 16571)
-- Name: familias id_familia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias ALTER COLUMN id_familia SET DEFAULT nextval('public.familias_id_familia_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 16792)
-- Name: familias_eliminadas id_eliminado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias_eliminadas ALTER COLUMN id_eliminado SET DEFAULT nextval('public.familias_eliminadas_id_eliminado_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 16774)
-- Name: historial_reportes id_reporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_reportes ALTER COLUMN id_reporte SET DEFAULT nextval('public.historial_reportes_id_reporte_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 16674)
-- Name: horarios_distribucion id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios_distribucion ALTER COLUMN id_horario SET DEFAULT nextval('public.horarios_distribucion_id_horario_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 16691)
-- Name: incidencias id_incidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias ALTER COLUMN id_incidencia SET DEFAULT nextval('public.incidencias_id_incidencia_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 16717)
-- Name: mantenimiento id_mantenimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento ALTER COLUMN id_mantenimiento SET DEFAULT nextval('public.mantenimiento_id_mantenimiento_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 16632)
-- Name: metricas_sistema id_metrica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metricas_sistema ALTER COLUMN id_metrica SET DEFAULT nextval('public.metricas_sistema_id_metrica_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 16610)
-- Name: niveles_tanque id_nivel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveles_tanque ALTER COLUMN id_nivel SET DEFAULT nextval('public.niveles_tanque_id_nivel_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 16755)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 16442)
-- Name: roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);


--
-- TOC entry 4932 (class 2604 OID 16469)
-- Name: sectores id_sector; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectores ALTER COLUMN id_sector SET DEFAULT nextval('public.sectores_id_sector_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 16597)
-- Name: tanques id_tanque; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanques ALTER COLUMN id_tanque SET DEFAULT nextval('public.tanques_id_tanque_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 16546)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 5196 (class 0 OID 16738)
-- Dependencies: 244
-- Data for Name: alertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alertas (id_alerta, tipo_alerta, mensaje, nivel_criticidad, estado, fecha_generada) FROM stdin;
\.


--
-- TOC entry 5186 (class 0 OID 16638)
-- Dependencies: 234
-- Data for Name: consumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumo (id_consumo, id_sector, litros_consumidos, fecha_registro) FROM stdin;
\.


--
-- TOC entry 5188 (class 0 OID 16653)
-- Dependencies: 236
-- Data for Name: distribucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.distribucion (id_distribucion, id_sector, dia_semana, hora_inicio, hora_fin, cantidad_estimada, estado) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 16568)
-- Dependencies: 226
-- Data for Name: familias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.familias (id_familia, nombre_responsable, dpi_responsable, telefono, direccion, numero_integrantes, estado_servicio, id_sector, usuario_id, fecha_registro) FROM stdin;
\.


--
-- TOC entry 5202 (class 0 OID 16789)
-- Dependencies: 250
-- Data for Name: familias_eliminadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.familias_eliminadas (id_eliminado, id_familia_original, nombre_responsable, dpi_responsable, telefono, direccion, numero_integrantes, estado_servicio, id_sector, usuario_id, fecha_registro, motivo_eliminacion, eliminado_por, fecha_eliminacion) FROM stdin;
\.


--
-- TOC entry 5200 (class 0 OID 16771)
-- Dependencies: 248
-- Data for Name: historial_reportes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_reportes (id_reporte, usuario_id, tipo_reporte, descripcion, fecha_generacion) FROM stdin;
\.


--
-- TOC entry 5190 (class 0 OID 16671)
-- Dependencies: 238
-- Data for Name: horarios_distribucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios_distribucion (id_horario, id_distribucion, fecha, observaciones) FROM stdin;
\.


--
-- TOC entry 5192 (class 0 OID 16688)
-- Dependencies: 240
-- Data for Name: incidencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidencias (id_incidencia, id_familia, tipo_incidencia, descripcion, prioridad, estado, fecha_reporte, fecha_resolucion, asignado_a) FROM stdin;
\.


--
-- TOC entry 5194 (class 0 OID 16714)
-- Dependencies: 242
-- Data for Name: mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mantenimiento (id_mantenimiento, id_sector, descripcion, fecha_programada, estado, responsable, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 16629)
-- Dependencies: 232
-- Data for Name: metricas_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metricas_sistema (id_metrica, presion, litros_disponibles, nivel_porcentaje, temperatura, fecha_registro) FROM stdin;
\.


--
-- TOC entry 5182 (class 0 OID 16607)
-- Dependencies: 230
-- Data for Name: niveles_tanque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveles_tanque (id_nivel, id_tanque, nivel_litros, porcentaje, fecha_registro, registrado_por) FROM stdin;
\.


--
-- TOC entry 5198 (class 0 OID 16752)
-- Dependencies: 246
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificaciones (id_notificacion, usuario_id, mensaje, leida, fecha_envio) FROM stdin;
\.


--
-- TOC entry 5172 (class 0 OID 16439)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id_rol, nombre_rol, descripcion) FROM stdin;
\.


--
-- TOC entry 5174 (class 0 OID 16466)
-- Dependencies: 222
-- Data for Name: sectores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sectores (id_sector, nombre_sector, descripcion, estado) FROM stdin;
\.


--
-- TOC entry 5180 (class 0 OID 16594)
-- Dependencies: 228
-- Data for Name: tanques; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tanques (id_tanque, nombre_tanque, capacidad_litros, ubicacion, estado) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 16543)
-- Dependencies: 224
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre_completo, usuario, correo, password_hash, telefono, id_rol, estado, fecha_creacion) FROM stdin;
\.


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 243
-- Name: alertas_id_alerta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alertas_id_alerta_seq', 1, false);


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 233
-- Name: consumo_id_consumo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumo_id_consumo_seq', 1, false);


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 235
-- Name: distribucion_id_distribucion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.distribucion_id_distribucion_seq', 1, false);


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 249
-- Name: familias_eliminadas_id_eliminado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.familias_eliminadas_id_eliminado_seq', 1, false);


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 225
-- Name: familias_id_familia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.familias_id_familia_seq', 1, false);


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 247
-- Name: historial_reportes_id_reporte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_reportes_id_reporte_seq', 1, false);


--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 237
-- Name: horarios_distribucion_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_distribucion_id_horario_seq', 1, false);


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 239
-- Name: incidencias_id_incidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidencias_id_incidencia_seq', 1, false);


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 241
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mantenimiento_id_mantenimiento_seq', 1, false);


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 231
-- Name: metricas_sistema_id_metrica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metricas_sistema_id_metrica_seq', 1, false);


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 229
-- Name: niveles_tanque_id_nivel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.niveles_tanque_id_nivel_seq', 1, false);


--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 245
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_rol_seq', 1, false);


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 221
-- Name: sectores_id_sector_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sectores_id_sector_seq', 1, false);


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 227
-- Name: tanques_id_tanque_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tanques_id_tanque_seq', 1, false);


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);


--
-- TOC entry 5000 (class 2606 OID 16750)
-- Name: alertas alertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas
    ADD CONSTRAINT alertas_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 4990 (class 2606 OID 16646)
-- Name: consumo consumo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT consumo_pkey PRIMARY KEY (id_consumo);


--
-- TOC entry 4992 (class 2606 OID 16664)
-- Name: distribucion distribucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distribucion
    ADD CONSTRAINT distribucion_pkey PRIMARY KEY (id_distribucion);


--
-- TOC entry 5006 (class 2606 OID 16802)
-- Name: familias_eliminadas familias_eliminadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias_eliminadas
    ADD CONSTRAINT familias_eliminadas_pkey PRIMARY KEY (id_eliminado);


--
-- TOC entry 4982 (class 2606 OID 16582)
-- Name: familias familias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias
    ADD CONSTRAINT familias_pkey PRIMARY KEY (id_familia);


--
-- TOC entry 5004 (class 2606 OID 16781)
-- Name: historial_reportes historial_reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_reportes
    ADD CONSTRAINT historial_reportes_pkey PRIMARY KEY (id_reporte);


--
-- TOC entry 4994 (class 2606 OID 16681)
-- Name: horarios_distribucion horarios_distribucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios_distribucion
    ADD CONSTRAINT horarios_distribucion_pkey PRIMARY KEY (id_horario);


--
-- TOC entry 4996 (class 2606 OID 16702)
-- Name: incidencias incidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_pkey PRIMARY KEY (id_incidencia);


--
-- TOC entry 4998 (class 2606 OID 16726)
-- Name: mantenimiento mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (id_mantenimiento);


--
-- TOC entry 4988 (class 2606 OID 16636)
-- Name: metricas_sistema metricas_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metricas_sistema
    ADD CONSTRAINT metricas_sistema_pkey PRIMARY KEY (id_metrica);


--
-- TOC entry 4986 (class 2606 OID 16617)
-- Name: niveles_tanque niveles_tanque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveles_tanque
    ADD CONSTRAINT niveles_tanque_pkey PRIMARY KEY (id_nivel);


--
-- TOC entry 5002 (class 2606 OID 16764)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 4968 (class 2606 OID 16450)
-- Name: roles roles_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_rol_key UNIQUE (nombre_rol);


--
-- TOC entry 4970 (class 2606 OID 16448)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4972 (class 2606 OID 16478)
-- Name: sectores sectores_nombre_sector_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectores
    ADD CONSTRAINT sectores_nombre_sector_key UNIQUE (nombre_sector);


--
-- TOC entry 4974 (class 2606 OID 16476)
-- Name: sectores sectores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectores
    ADD CONSTRAINT sectores_pkey PRIMARY KEY (id_sector);


--
-- TOC entry 4984 (class 2606 OID 16605)
-- Name: tanques tanques_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanques
    ADD CONSTRAINT tanques_pkey PRIMARY KEY (id_tanque);


--
-- TOC entry 4976 (class 2606 OID 16561)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4978 (class 2606 OID 16557)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4980 (class 2606 OID 16559)
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 5012 (class 2606 OID 16647)
-- Name: consumo fk_consumo_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumo
    ADD CONSTRAINT fk_consumo_sector FOREIGN KEY (id_sector) REFERENCES public.sectores(id_sector);


--
-- TOC entry 5013 (class 2606 OID 16665)
-- Name: distribucion fk_distribucion_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distribucion
    ADD CONSTRAINT fk_distribucion_sector FOREIGN KEY (id_sector) REFERENCES public.sectores(id_sector);


--
-- TOC entry 5021 (class 2606 OID 16813)
-- Name: familias_eliminadas fk_familia_eliminada_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias_eliminadas
    ADD CONSTRAINT fk_familia_eliminada_admin FOREIGN KEY (eliminado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5022 (class 2606 OID 16803)
-- Name: familias_eliminadas fk_familia_eliminada_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias_eliminadas
    ADD CONSTRAINT fk_familia_eliminada_sector FOREIGN KEY (id_sector) REFERENCES public.sectores(id_sector);


--
-- TOC entry 5023 (class 2606 OID 16808)
-- Name: familias_eliminadas fk_familia_eliminada_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias_eliminadas
    ADD CONSTRAINT fk_familia_eliminada_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5008 (class 2606 OID 16583)
-- Name: familias fk_familia_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias
    ADD CONSTRAINT fk_familia_sector FOREIGN KEY (id_sector) REFERENCES public.sectores(id_sector);


--
-- TOC entry 5009 (class 2606 OID 16588)
-- Name: familias fk_familia_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familias
    ADD CONSTRAINT fk_familia_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5014 (class 2606 OID 16682)
-- Name: horarios_distribucion fk_horario_distribucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios_distribucion
    ADD CONSTRAINT fk_horario_distribucion FOREIGN KEY (id_distribucion) REFERENCES public.distribucion(id_distribucion);


--
-- TOC entry 5015 (class 2606 OID 16703)
-- Name: incidencias fk_incidencia_familia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT fk_incidencia_familia FOREIGN KEY (id_familia) REFERENCES public.familias(id_familia);


--
-- TOC entry 5016 (class 2606 OID 16708)
-- Name: incidencias fk_incidencia_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT fk_incidencia_usuario FOREIGN KEY (asignado_a) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5017 (class 2606 OID 16727)
-- Name: mantenimiento fk_mantenimiento_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT fk_mantenimiento_sector FOREIGN KEY (id_sector) REFERENCES public.sectores(id_sector);


--
-- TOC entry 5018 (class 2606 OID 16732)
-- Name: mantenimiento fk_mantenimiento_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT fk_mantenimiento_usuario FOREIGN KEY (responsable) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5010 (class 2606 OID 16618)
-- Name: niveles_tanque fk_nivel_tanque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveles_tanque
    ADD CONSTRAINT fk_nivel_tanque FOREIGN KEY (id_tanque) REFERENCES public.tanques(id_tanque);


--
-- TOC entry 5011 (class 2606 OID 16623)
-- Name: niveles_tanque fk_nivel_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveles_tanque
    ADD CONSTRAINT fk_nivel_usuario FOREIGN KEY (registrado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5019 (class 2606 OID 16765)
-- Name: notificaciones fk_notificacion_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT fk_notificacion_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5020 (class 2606 OID 16782)
-- Name: historial_reportes fk_reporte_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_reportes
    ADD CONSTRAINT fk_reporte_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5007 (class 2606 OID 16562)
-- Name: usuarios fk_usuario_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


-- Completed on 2026-05-17 01:48:41

--
-- PostgreSQL database dump complete
--

\unrestrict jF1elbAZqf9fBiU5bN08ddoTcpTxKdxqzh2b88J36i6QH1lwKXu8lWRbt8Bs4QQ

