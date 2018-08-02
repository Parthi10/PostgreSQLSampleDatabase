--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: webshop; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA webshop;


ALTER SCHEMA webshop OWNER TO postgres;

--
-- Name: category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category AS ENUM (
    'Apparel',
    'Footwear',
    'Sportswear',
    'Traditional',
    'Formal Wear',
    'Accessories',
    'Watches & Jewelry',
    'Luggage',
    'Cosmetics'
);


ALTER TYPE public.category OWNER TO postgres;

--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'male',
    'female',
    'unisex'
);


ALTER TYPE public.gender OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.address (
    id integer NOT NULL,
    customerid integer,
    firstname text,
    lastname text,
    address1 text,
    address2 text,
    city text,
    zip text,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.address_id_seq OWNED BY webshop.address.id;


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.articles_id_seq OWNER TO postgres;

--
-- Name: colors; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.colors (
    id integer NOT NULL,
    name text,
    rgb text
);


ALTER TABLE webshop.colors OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.colors_id_seq OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.colors_id_seq OWNED BY webshop.colors.id;


--
-- Name: customer_id_seq1; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.customer_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.customer_id_seq1 OWNER TO postgres;

--
-- Name: labels; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.labels (
    id integer NOT NULL,
    name text,
    slugname text,
    icon bytea
);


ALTER TABLE webshop.labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.labels_id_seq OWNED BY webshop.labels.id;


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.order_id_seq OWNER TO postgres;

--
-- Name: order_positions_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.order_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.order_positions_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.products_id_seq OWNER TO postgres;

--
-- Name: sizes; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.sizes (
    id integer NOT NULL,
    gender public.gender,
    category public.category,
    size text,
    size_us int4range,
    size_uk int4range,
    size_eu int4range
);


ALTER TABLE webshop.sizes OWNER TO postgres;

--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.sizes_id_seq OWNER TO postgres;

--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.sizes_id_seq OWNED BY webshop.sizes.id;


--
-- Name: stock_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.stock_id_seq OWNER TO postgres;

--
-- Name: address id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.address ALTER COLUMN id SET DEFAULT nextval('webshop.address_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.colors ALTER COLUMN id SET DEFAULT nextval('webshop.colors_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.labels ALTER COLUMN id SET DEFAULT nextval('webshop.labels_id_seq'::regclass);


--
-- Name: sizes id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.sizes ALTER COLUMN id SET DEFAULT nextval('webshop.sizes_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: webshop; Owner: postgres
--

COPY webshop.address (id, customerid, firstname, lastname, address1, address2, city, zip, created, updated) FROM stdin;
1108	108	\N	\N	5718 Rue Jean-Baldassini	\N	Eriswil	9937	2018-08-02 13:52:31.805549+02	\N
1109	109	\N	\N	2276 Rue Abel-Hovelacque	\N	Buchs (Ag)	5576	2018-08-02 13:52:31.805549+02	\N
1110	110	\N	\N	3646 Daisy Dr	\N	Arvada	98683	2018-08-02 13:52:31.805549+02	\N
1111	111	\N	\N	8115 High Street	\N	Wolverhampton	Q17 4XE	2018-08-02 13:52:31.805549+02	\N
1112	112	\N	\N	8115 Elgin St	\N	Shiloh	58151	2018-08-02 13:52:31.805549+02	\N
1113	113	\N	\N	3848 Fyrvej	\N	Ugerløse	24636	2018-08-02 13:52:31.805549+02	\N
1114	114	\N	\N	8477 Rue Du Stade	\N	Fahrwangen	3189	2018-08-02 13:52:31.805549+02	\N
1115	115	\N	\N	5393 Rue Pierre-Delore	\N	Aire-La-Ville	4519	2018-08-02 13:52:31.805549+02	\N
1116	116	\N	\N	1033 Biltstraat	\N	De Marne	51284	2018-08-02 13:52:31.805549+02	\N
1117	117	\N	\N	974 E Center St	\N	Concord	58333	2018-08-02 13:52:31.805549+02	\N
1118	118	\N	\N	736 New Road	\N	Worcester	V16 9UX	2018-08-02 13:52:31.805549+02	\N
1119	119	\N	\N	4414 Rue Desaix	\N	Speicher	9718	2018-08-02 13:52:31.805549+02	\N
1120	120	\N	\N	5593 Cackson St	\N	Indianapolis	91972	2018-08-02 13:52:31.805549+02	\N
1121	121	\N	\N	700 Spring St	\N	Traralgon	1270	2018-08-02 13:52:31.805549+02	\N
1122	122	\N	\N	Amselweg 107	\N	Bonndorf Im Schwarzwald	64406	2018-08-02 13:52:31.805549+02	\N
1123	123	\N	\N	6103 Neude	\N	Wormerland	20748	2018-08-02 13:52:31.805549+02	\N
1124	124	\N	\N	2704 Vesterlundvej	\N	Stoevring	99631	2018-08-02 13:52:31.805549+02	\N
1125	125	\N	\N	6283 Lange Nieuwstraat	\N	Hilversum	37030	2018-08-02 13:52:31.805549+02	\N
1126	126	\N	\N	6958 Springfield Road	\N	Belfast	C7 3ZR	2018-08-02 13:52:31.805549+02	\N
1127	127	\N	\N	7452 Rua Um	\N	São Paulo	87115	2018-08-02 13:52:31.805549+02	\N
1128	128	\N	\N	4332 Park Road	\N	Glasgow	ID76 3RA	2018-08-02 13:52:31.805549+02	\N
201	201	\N	\N	4899 West Street	\N	Ely	FS21 3LE	2018-08-02 13:52:31.805549+02	\N
1129	129	\N	\N	8294 Thornridge Cir	\N	Wollongong	9386	2018-08-02 13:52:31.805549+02	\N
303	303	\N	\N	8607 Homestead Rd	\N	El Cajon	58663	2018-08-02 13:52:31.805549+02	\N
304	304	\N	\N	5101 Amsterdamse-Straatweg	\N	Midden-Drenthe	69242	2018-08-02 13:52:31.805549+02	\N
276	276	\N	\N	1857 Rue D'Abbeville	\N	Hütten	2397	2018-08-02 13:52:31.805549+02	\N
305	305	\N	\N	4632 Bygvænget	\N	Ølstykke	90736	2018-08-02 13:52:31.805549+02	\N
306	306	\N	\N	Kirchgasse 200	\N	Unna	61094	2018-08-02 13:52:31.805549+02	\N
307	307	\N	\N	9636 Kongensgade	\N	Juelsminde	22450	2018-08-02 13:52:31.805549+02	\N
308	308	\N	\N	1456 Calle De Ferraz	\N	Talavera De La Reina	97253	2018-08-02 13:52:31.805549+02	\N
309	309	\N	\N	7218 Calle De Téllez	\N	Santiago De Compostela	47649	2018-08-02 13:52:31.805549+02	\N
310	310	\N	\N	1528 Tjørnebjerg	\N	Brondby	96664	2018-08-02 13:52:31.805549+02	\N
311	311	\N	\N	2783 Thorsgade	\N	Nr Åby	32904	2018-08-02 13:52:31.805549+02	\N
312	312	\N	\N	4252 Lakeview St	\N	Joliet	20080	2018-08-02 13:52:31.805549+02	\N
313	313	\N	\N	1420 Rua Alagoas 	\N	Muriaé	62362	2018-08-02 13:52:31.805549+02	\N
314	314	\N	\N	9471 Paardenveld	\N	Borne	14196	2018-08-02 13:52:31.805549+02	\N
315	315	\N	\N	Ringstraße 52	\N	Marktsteft	88134	2018-08-02 13:52:31.805549+02	\N
316	316	\N	\N	750 Ronda De Toledo	\N	Oviedo	27899	2018-08-02 13:52:31.805549+02	\N
317	317	\N	\N	7098 Ringkøbingvej	\N	Randers Nø	19075	2018-08-02 13:52:31.805549+02	\N
318	318	\N	\N	4411 Richmond Road	\N	Durham	KX2 6TF	2018-08-02 13:52:31.805549+02	\N
319	319	\N	\N	Rosenweg 111	\N	Köthen (Anhalt)	29386	2018-08-02 13:52:31.805549+02	\N
320	320	\N	\N	4783 Rua Belo Horizonte 	\N	Jequié	52584	2018-08-02 13:52:31.805549+02	\N
321	321	\N	\N	662 Avenida Brasil 	\N	Barretos	79444	2018-08-02 13:52:31.805549+02	\N
322	322	\N	\N	8741 Oak Ridge Ln	\N	Ontario	38447	2018-08-02 13:52:31.805549+02	\N
323	323	\N	\N	5348 Kvædevej	\N	Ansager	54820	2018-08-02 13:52:31.805549+02	\N
324	324	\N	\N	8435 Edwards Rd	\N	Australian Capital Territory	6055	2018-08-02 13:52:31.805549+02	\N
325	325	\N	\N	6411 Mill Lane	\N	Stirling	LV4 6XT	2018-08-02 13:52:31.805549+02	\N
326	326	\N	\N	3562 Rua Sete De Setembro 	\N	Votorantim	65157	2018-08-02 13:52:31.805549+02	\N
327	327	\N	\N	5060 Paseo De Extremadura	\N	Granada	55537	2018-08-02 13:52:31.805549+02	\N
328	328	\N	\N	1047 Rue De La Baleine	\N	Jonen	1081	2018-08-02 13:52:31.805549+02	\N
329	329	\N	\N	6070 Miller Ave	\N	Rockhampton	7460	2018-08-02 13:52:31.805549+02	\N
330	330	\N	\N	1537 Park Road	\N	Ely	TH8V 5ZP	2018-08-02 13:52:31.805549+02	\N
331	331	\N	\N	8826 Enghavevej	\N	Ulsted	danmark	2018-08-02 13:52:31.805549+02	\N
332	332	\N	\N	336 Suvantokatu	\N	Pirkkala	56105	2018-08-02 13:52:31.805549+02	\N
333	333	\N	\N	4857 Avenue Du Fort-Caire	\N	Juriens	1554	2018-08-02 13:52:31.805549+02	\N
334	334	\N	\N	9654 Park Avenue	\N	Stevenage	A2 9SG	2018-08-02 13:52:31.805549+02	\N
335	335	\N	\N	7263 Calle De Tetuán	\N	San Sebastián	37636	2018-08-02 13:52:31.805549+02	\N
336	336	\N	\N	4619 Calle Del Arenal	\N	Alcobendas	28747	2018-08-02 13:52:31.805549+02	\N
337	337	\N	\N	9858 Rua Pernambuco 	\N	Alvorada	36461	2018-08-02 13:52:31.805549+02	\N
338	338	\N	\N	8293 H.C. Andersens Vej	\N	Billum	95111	2018-08-02 13:52:31.805549+02	\N
339	339	\N	\N	9240 Green Rd	\N	Coffs Harbour	6796	2018-08-02 13:52:31.805549+02	\N
340	340	\N	\N	9998 Bruce St	\N	Ballarat	8395	2018-08-02 13:52:31.805549+02	\N
341	341	\N	\N	4465 Lakeview St	\N	Hollywood	67767	2018-08-02 13:52:31.805549+02	\N
277	277	\N	\N	4673 Queens Road	\N	Newport	HR6W 8AL	2018-08-02 13:52:31.805549+02	\N
278	278	\N	\N	9212 Calle De Alberto Aguilera	\N	Vigo	31902	2018-08-02 13:52:31.805549+02	\N
279	279	\N	\N	6761 Highfield Road	\N	St Albans	UC2M 0FT	2018-08-02 13:52:31.805549+02	\N
280	280	\N	\N	5902 Hämeenkatu	\N	Paimio	77168	2018-08-02 13:52:31.805549+02	\N
281	281	\N	\N	9734 Rua Vinte E Dois 	\N	Eunápolis	31515	2018-08-02 13:52:31.805549+02	\N
282	282	\N	\N	1915 Rua Amazonas 	\N	Olinda	50897	2018-08-02 13:52:31.805549+02	\N
283	283	\N	\N	7739 Suvantokatu	\N	Vörå	83311	2018-08-02 13:52:31.805549+02	\N
284	284	\N	\N	5817 Reijolankatu	\N	Kiikoinen	94899	2018-08-02 13:52:31.805549+02	\N
285	285	\N	\N	8552 Donkere Gaard	\N	Heiloo	44649	2018-08-02 13:52:31.805549+02	\N
286	286	\N	\N	6376 The Green	\N	Plymouth	V28 0EY	2018-08-02 13:52:31.805549+02	\N
287	287	\N	\N	Lindenstraße 1	\N	St. Ingbert	23222	2018-08-02 13:52:31.805549+02	\N
288	288	\N	\N	8460 Rue Duguesclin	\N	Corcelles-Cormondrèche	5473	2018-08-02 13:52:31.805549+02	\N
289	289	\N	\N	1364 Calle De La Democracia	\N	Gandía	46296	2018-08-02 13:52:31.805549+02	\N
290	290	\N	\N	6781 Rua Primeiro De Maio 	\N	Mauá	58316	2018-08-02 13:52:31.805549+02	\N
291	291	\N	\N	6527 Rua Amazonas 	\N	Ilhéus	54391	2018-08-02 13:52:31.805549+02	\N
292	292	\N	\N	6692 Jaarbeursplein	\N	Waddinxveen	41460	2018-08-02 13:52:31.805549+02	\N
293	293	\N	\N	9310 Østre Strandvej	\N	Overby Lyng	41281	2018-08-02 13:52:31.805549+02	\N
294	294	\N	\N	739 Park Avenue	\N	York	W90 2SL	2018-08-02 13:52:31.805549+02	\N
295	295	\N	\N	6887 Algade	\N	Agerbæk	14362	2018-08-02 13:52:31.805549+02	\N
296	296	\N	\N	9064 Rua Dom Pedro Ii 	\N	Corumbá	53953	2018-08-02 13:52:31.805549+02	\N
297	297	\N	\N	Kirchstraße 139	\N	Zella-Mehlis	74792	2018-08-02 13:52:31.805549+02	\N
298	298	\N	\N	9442 Ranchview Dr	\N	Nowra	6128	2018-08-02 13:52:31.805549+02	\N
299	299	\N	\N	11 Lovers Ln	\N	Tweed	9951	2018-08-02 13:52:31.805549+02	\N
300	300	\N	\N	3462 Leidsekade	\N	Hulst	95435	2018-08-02 13:52:31.805549+02	\N
301	301	\N	\N	Beethovenstraße 189	\N	Unterschleißheim	96429	2018-08-02 13:52:31.805549+02	\N
302	302	\N	\N	Poststraße 74	\N	Kemberg	35511	2018-08-02 13:52:31.805549+02	\N
1077	1077	\N	\N	86 Rua Minas Gerais 	\N	Teixeira De Freitas	43288	2018-08-02 13:52:31.805549+02	\N
1078	1078	\N	\N	1819 Place Du 8 Février 1962	\N	Ehrendingen	7475	2018-08-02 13:52:31.805549+02	\N
1079	1079	\N	\N	6926 Rua Rui Barbosa 	\N	Florianópolis	67199	2018-08-02 13:52:31.805549+02	\N
1080	1080	\N	\N	1086 Egeskovvej	\N	København S	69777	2018-08-02 13:52:31.805549+02	\N
1081	1081	\N	\N	459 Hillcrest Rd	\N	Adelaide	967	2018-08-02 13:52:31.805549+02	\N
1082	1082	\N	\N	8928 Rua Rui Barbosa 	\N	São Caetano Do Sul	67400	2018-08-02 13:52:31.805549+02	\N
1083	1083	\N	\N	7592 Calle De Atocha	\N	Jerez De La Frontera	89463	2018-08-02 13:52:31.805549+02	\N
1084	1084	\N	\N	Birkenstraße 140	\N	Ahrensburg	76809	2018-08-02 13:52:31.805549+02	\N
1085	1085	\N	\N	4786 Graadt Van Roggenweg	\N	Loon Op Zand	43355	2018-08-02 13:52:31.805549+02	\N
1086	1086	\N	\N	349 Calle Covadonga	\N	Granada	84748	2018-08-02 13:52:31.805549+02	\N
1087	1087	\N	\N	8580 Rua São Luiz 	\N	Várzea Grande	39717	2018-08-02 13:52:31.805549+02	\N
1088	1088	\N	\N	8546 Æblevænget	\N	Pandrup	85203	2018-08-02 13:52:31.805549+02	\N
1089	1089	\N	\N	9406 Søndervej	\N	København V	11580	2018-08-02 13:52:31.805549+02	\N
1090	1090	\N	\N	3718 Paseo De Zorrilla	\N	La Coruña	76605	2018-08-02 13:52:31.805549+02	\N
1091	1091	\N	\N	8809 Avenida De La Albufera	\N	Gandía	42663	2018-08-02 13:52:31.805549+02	\N
1092	1092	\N	\N	4984 Crockett St	\N	Busselton	2150	2018-08-02 13:52:31.805549+02	\N
1093	1093	\N	\N	8320 Pecan Acres Ln	\N	Edison	37305	2018-08-02 13:52:31.805549+02	\N
203	203	\N	\N	4646 Avenue Des Ternes	\N	Bottmingen	7934	2018-08-02 13:52:31.805549+02	\N
204	204	\N	\N	4916 Køgevej	\N	﻿Aaborg Øst	39774	2018-08-02 13:52:31.805549+02	\N
205	205	\N	\N	Tulpenweg 15	\N	Röbel/Müritz	27280	2018-08-02 13:52:31.805549+02	\N
206	206	\N	\N	566 North Road	\N	Truro	G5K 1ST	2018-08-02 13:52:31.805549+02	\N
207	207	\N	\N	910 High Street	\N	Coventry	VY05 7UX	2018-08-02 13:52:31.805549+02	\N
208	208	\N	\N	6684 Havevej	\N	Sønder Stenderup	93222	2018-08-02 13:52:31.805549+02	\N
209	209	\N	\N	3610 Furkabaan	\N	Voorst	89174	2018-08-02 13:52:31.805549+02	\N
342	342	\N	\N	4025 Avenida De Andalucía	\N	Madrid	46314	2018-08-02 13:52:31.805549+02	\N
343	343	\N	\N	3222 Avenue De La République	\N	Wilen (Tg)	4012	2018-08-02 13:52:31.805549+02	\N
234	234	\N	\N	499 Avenida Vinícius De Morais	\N	Campina Grande	68503	2018-08-02 13:52:31.805549+02	\N
235	235	\N	\N	7463 Stadionvej	\N	Juelsminde	94187	2018-08-02 13:52:31.805549+02	\N
236	236	\N	\N	2023 Stevens Creek Blvd	\N	Hayward	64138	2018-08-02 13:52:31.805549+02	\N
237	237	\N	\N	8088 Mockingbird Ln	\N	Darwin	8325	2018-08-02 13:52:31.805549+02	\N
238	238	\N	\N	544 College St	\N	Carrollton	17143	2018-08-02 13:52:31.805549+02	\N
239	239	\N	\N	6235 Agnetevej	\N	Branderup J	38031	2018-08-02 13:52:31.805549+02	\N
240	240	\N	\N	5130 Calle De Toledo	\N	Madrid	44293	2018-08-02 13:52:31.805549+02	\N
241	241	\N	\N	1325 Mirabellevej	\N	Brøndby Strand	46962	2018-08-02 13:52:31.805549+02	\N
242	242	\N	\N	7791 Rua Três	\N	Atibaia	37607	2018-08-02 13:52:31.805549+02	\N
243	243	\N	\N	4071 Vangen	\N	Jystrup	56156	2018-08-02 13:52:31.805549+02	\N
244	244	\N	\N	8726 Københavnsvej	\N	Gørløse	98194	2018-08-02 13:52:31.805549+02	\N
245	245	\N	\N	Danziger Straße 189	\N	Elzach	12378	2018-08-02 13:52:31.805549+02	\N
246	246	\N	\N	Kapellenweg 199	\N	Biedenkopf	45798	2018-08-02 13:52:31.805549+02	\N
247	247	\N	\N	1405 Brick Kiln Road	\N	Armagh	S28 7HE	2018-08-02 13:52:31.805549+02	\N
248	248	\N	\N	3707 Hatanpään Valtatie	\N	Savonlinna	15425	2018-08-02 13:52:31.805549+02	\N
249	249	\N	\N	5404 Keistraat	\N	Drechterland	11831	2018-08-02 13:52:31.805549+02	\N
250	250	\N	\N	1445 Jaarbeursplein	\N	Aa En Hunze	93533	2018-08-02 13:52:31.805549+02	\N
251	251	\N	\N	2846 Avenida Da Legalidade	\N	Cascavel	15621	2018-08-02 13:52:31.805549+02	\N
252	252	\N	\N	5437 Valley View Ln	\N	Surprise	55994	2018-08-02 13:52:31.805549+02	\N
253	253	\N	\N	6255 Kærsangervej	\N	København V	46725	2018-08-02 13:52:31.805549+02	\N
254	254	\N	\N	6369 Groveland Terrace	\N	Nowra	8991	2018-08-02 13:52:31.805549+02	\N
255	255	\N	\N	4313 Rue Desaix	\N	Chippis	3236	2018-08-02 13:52:31.805549+02	\N
256	256	\N	\N	6171 Hermiankatu	\N	Laitila	32338	2018-08-02 13:52:31.805549+02	\N
257	257	\N	\N	6543 Calle Del Barquillo	\N	Alcalá De Henares	33472	2018-08-02 13:52:31.805549+02	\N
258	258	\N	\N	2104 Calle De La Democracia	\N	Lorca	91377	2018-08-02 13:52:31.805549+02	\N
259	259	\N	\N	5807 Ronda De Toledo	\N	Mérida	59519	2018-08-02 13:52:31.805549+02	\N
260	260	\N	\N	Bachstraße 96	\N	Eschborn	30333	2018-08-02 13:52:31.805549+02	\N
261	261	\N	\N	Drosselweg 96	\N	Krakow Am See	54284	2018-08-02 13:52:31.805549+02	\N
262	262	\N	\N	2565 Vismarkt	\N	Sint Anthonis	63386	2018-08-02 13:52:31.805549+02	\N
263	263	\N	\N	3481 Bokstraat	\N	Sint Anthonis	34022	2018-08-02 13:52:31.805549+02	\N
264	264	\N	\N	6724 Rue De La Baleine	\N	Worb	9377	2018-08-02 13:52:31.805549+02	\N
265	265	\N	\N	83 Central St	\N	Grapevine	80973	2018-08-02 13:52:31.805549+02	\N
266	266	\N	\N	3879 Calle De Argumosa	\N	Bilbao	95996	2018-08-02 13:52:31.805549+02	\N
267	267	\N	\N	Wiesenweg 51	\N	Künzelsau	22994	2018-08-02 13:52:31.805549+02	\N
268	268	\N	\N	2456 Gammel Landevej	\N	Nørre Sundby	78188	2018-08-02 13:52:31.805549+02	\N
269	269	\N	\N	4602 Calle De Arganzuela	\N	Gijón	63954	2018-08-02 13:52:31.805549+02	\N
270	270	\N	\N	2415 Calle De Argumosa	\N	Vitoria	36472	2018-08-02 13:52:31.805549+02	\N
271	271	\N	\N	6141 Avenue Paul Eluard	\N	Grandvillard	6326	2018-08-02 13:52:31.805549+02	\N
272	272	\N	\N	294 W Sherman Dr	\N	Beaumont	67624	2018-08-02 13:52:31.805549+02	\N
273	273	\N	\N	7365 Calle De Arganzuela	\N	Alicante	76778	2018-08-02 13:52:31.805549+02	\N
274	274	\N	\N	3241 Rua Dezenove De Outubro	\N	Barbacena	67058	2018-08-02 13:52:31.805549+02	\N
275	275	\N	\N	3486 Avenida Da Democracia	\N	Bragança	39418	2018-08-02 13:52:31.805549+02	\N
160	160	\N	\N	6924 H.C. Lumbyes Vej	\N	Ishoej	21140	2018-08-02 13:52:31.805549+02	\N
161	161	\N	\N	5388 Lone Wolf Trail	\N	Shepparton	2797	2018-08-02 13:52:31.805549+02	\N
162	162	\N	\N	1901 Avenue De La Libération	\N	Schöftland	7253	2018-08-02 13:52:31.805549+02	\N
163	163	\N	\N	7621 Vondellaan	\N	Raalte	28223	2018-08-02 13:52:31.805549+02	\N
164	164	\N	\N	4119 Rue De L'Abbé-Rousselot	\N	Bürchen	3392	2018-08-02 13:52:31.805549+02	\N
165	165	\N	\N	8004 Mannerheimintie	\N	Pertunmaa	96455	2018-08-02 13:52:31.805549+02	\N
166	166	\N	\N	765 Westplein	\N	Schiermonnikoog	21917	2018-08-02 13:52:31.805549+02	\N
167	167	\N	\N	9119 Slugten	\N	Saltum	48504	2018-08-02 13:52:31.805549+02	\N
168	168	\N	\N	Erlenweg 42	\N	Glinde	45725	2018-08-02 13:52:31.805549+02	\N
169	169	\N	\N	7650 Rua Bela Vista 	\N	Limeira	97640	2018-08-02 13:52:31.805549+02	\N
170	170	\N	\N	7608 Calle De Arganzuela	\N	Sevilla	78590	2018-08-02 13:52:31.805549+02	\N
171	171	\N	\N	5564 Hobrovej	\N	Ryslinge	96527	2018-08-02 13:52:31.805549+02	\N
172	172	\N	\N	871 George Street	\N	Bangor	RH7P 1NS	2018-08-02 13:52:31.805549+02	\N
173	173	\N	\N	1118 Avenida De Andalucía	\N	Málaga	69220	2018-08-02 13:52:31.805549+02	\N
174	174	\N	\N	2070 Ringkøbingvej	\N	Aalborg S.Ø.	41148	2018-08-02 13:52:31.805549+02	\N
175	175	\N	\N	4252 Margrethevej	\N	Ansager	38502	2018-08-02 13:52:31.805549+02	\N
176	176	\N	\N	Bachstraße 193	\N	Ostritz	53164	2018-08-02 13:52:31.805549+02	\N
177	177	\N	\N	4022 Country Club Rd	\N	Albany	5871	2018-08-02 13:52:31.805549+02	\N
178	178	\N	\N	3671 Oddesundvej	\N	Gjerlev	67279	2018-08-02 13:52:31.805549+02	\N
179	179	\N	\N	3477 Railroad St	\N	Salt Lake City	73117	2018-08-02 13:52:31.805549+02	\N
180	180	\N	\N	5938 Rue Du Château	\N	Le Chenit	6872	2018-08-02 13:52:31.805549+02	\N
181	181	\N	\N	923 Windsor Road	\N	Coventry	BV2 0GS	2018-08-02 13:52:31.805549+02	\N
182	182	\N	\N	8033 Kildevej	\N	Randers Nv	90513	2018-08-02 13:52:31.805549+02	\N
183	183	\N	\N	1764 Spring St	\N	Augusta	88104	2018-08-02 13:52:31.805549+02	\N
184	184	\N	\N	860 Hermiankatu	\N	Tammela	20880	2018-08-02 13:52:31.805549+02	\N
185	185	\N	\N	4832 Avenida De Salamanca	\N	Arrecife	25469	2018-08-02 13:52:31.805549+02	\N
186	186	\N	\N	6008 Sprogøvej	\N	Stokkemarke	92746	2018-08-02 13:52:31.805549+02	\N
187	187	\N	\N	3634 Sletten	\N	St.Merløse	14338	2018-08-02 13:52:31.805549+02	\N
188	188	\N	\N	5194 Rue Du Bon-Pasteur	\N	Corcelles-Près-Payerne	3432	2018-08-02 13:52:31.805549+02	\N
189	189	\N	\N	679 Avenida De Salamanca	\N	Alicante	97634	2018-08-02 13:52:31.805549+02	\N
190	190	\N	\N	5392 The Avenue	\N	Stirling	AQ0W 3ZU	2018-08-02 13:52:31.805549+02	\N
191	191	\N	\N	5494 W 6th St	\N	Bundaberg	2768	2018-08-02 13:52:31.805549+02	\N
192	192	\N	\N	8699 Avenue De L'Abbé-Roussel	\N	Vuiteboeuf	9965	2018-08-02 13:52:31.805549+02	\N
193	193	\N	\N	4096 Rolling Green Rd	\N	Dubbo	2184	2018-08-02 13:52:31.805549+02	\N
194	194	\N	\N	8167 Højbjergvej	\N	Ugerløse	89227	2018-08-02 13:52:31.805549+02	\N
195	195	\N	\N	8070 Place De L'Église	\N	Baar	9688	2018-08-02 13:52:31.805549+02	\N
196	196	\N	\N	7476 Esplanadi	\N	Naantali	41375	2018-08-02 13:52:31.805549+02	\N
197	197	\N	\N	7323 Solbærvej	\N	Agerbæk	92040	2018-08-02 13:52:31.805549+02	\N
198	198	\N	\N	1929 Sunset St	\N	Wollongong	7047	2018-08-02 13:52:31.805549+02	\N
199	199	\N	\N	1984 Wheeler Ridge Dr	\N	Cairns	5074	2018-08-02 13:52:31.805549+02	\N
200	200	\N	\N	3470 Calle De Pedro Bosch	\N	Castellón De La Plana	43375	2018-08-02 13:52:31.805549+02	\N
344	344	\N	\N	1712 York Road	\N	Wakefield	PJ54 1GA	2018-08-02 13:52:31.805549+02	\N
345	345	\N	\N	6108 College St	\N	Seagoville	86571	2018-08-02 13:52:31.805549+02	\N
346	346	\N	\N	9307 Esplanadi	\N	Raseborg	17951	2018-08-02 13:52:31.805549+02	\N
347	347	\N	\N	2711 Itsenäisyydenkatu	\N	Vehmaa	55568	2018-08-02 13:52:31.805549+02	\N
348	348	\N	\N	1113 South Street	\N	Cambridge	FN88 8TB	2018-08-02 13:52:31.805549+02	\N
349	349	\N	\N	5574 Green Lane	\N	Bangor	N6 9EN	2018-08-02 13:52:31.805549+02	\N
350	350	\N	\N	2212 Gammel Landevej	\N	Roskilde	24133	2018-08-02 13:52:31.805549+02	\N
351	351	\N	\N	9012 Manor Road	\N	Cambridge	F5 3AG	2018-08-02 13:52:31.805549+02	\N
352	352	\N	\N	4223 Bulevardi	\N	Paltamo	26487	2018-08-02 13:52:31.805549+02	\N
353	353	\N	\N	8282 Vondellaan	\N	Waterland	22757	2018-08-02 13:52:31.805549+02	\N
354	354	\N	\N	6441 Broadway	\N	Belfast	R51 7PE	2018-08-02 13:52:31.805549+02	\N
355	355	\N	\N	2221 Country Club Rd	\N	Fremont	99410	2018-08-02 13:52:31.805549+02	\N
356	356	\N	\N	7787 Rue Desaix	\N	Goldach	6267	2018-08-02 13:52:31.805549+02	\N
357	357	\N	\N	8898 Calle De Ferraz	\N	Pamplona	79318	2018-08-02 13:52:31.805549+02	\N
358	358	\N	\N	1125 Rue Principale	\N	Ried-Brig	6463	2018-08-02 13:52:31.805549+02	\N
359	359	\N	\N	2061 Ringkøbingvej	\N	Noerre Alslev	63319	2018-08-02 13:52:31.805549+02	\N
360	360	\N	\N	3193 Verkatehtaankatu	\N	Föglö	66075	2018-08-02 13:52:31.805549+02	\N
361	361	\N	\N	8050 Rua Santos Dumont 	\N	Vespasiano	57023	2018-08-02 13:52:31.805549+02	\N
362	362	\N	\N	Tulpenweg 119	\N	Beeskow	69665	2018-08-02 13:52:31.805549+02	\N
363	363	\N	\N	8124 Hatanpään Valtatie	\N	Vähäkyrö	15066	2018-08-02 13:52:31.805549+02	\N
364	364	\N	\N	8901 Solvænget	\N	København V	33599	2018-08-02 13:52:31.805549+02	\N
365	365	\N	\N	7979 Hermiankatu	\N	Pukkila	16016	2018-08-02 13:52:31.805549+02	\N
366	366	\N	\N	8567 Stevens Creek Blvd	\N	Amarillo	63430	2018-08-02 13:52:31.805549+02	\N
367	367	\N	\N	1687 Valley View Ln	\N	Houston	59784	2018-08-02 13:52:31.805549+02	\N
368	368	\N	\N	9397 Predikherenstraat	\N	Deurne	43389	2018-08-02 13:52:31.805549+02	\N
369	369	\N	\N	4222 Rue Barrème	\N	Madiswil	4264	2018-08-02 13:52:31.805549+02	\N
370	370	\N	\N	4713 W Campbell Ave	\N	Fountain Valley	39776	2018-08-02 13:52:31.805549+02	\N
371	371	\N	\N	2924 Rue De L'Abbé-Patureau	\N	Oberbuchsiten	6249	2018-08-02 13:52:31.805549+02	\N
372	372	\N	\N	8573 A.B.C.-Straat	\N	Ameland	97302	2018-08-02 13:52:31.805549+02	\N
373	373	\N	\N	5748 Amsterdamsestraatweg	\N	Ferwerderadiel	32537	2018-08-02 13:52:31.805549+02	\N
374	374	\N	\N	6924 Locust Rd	\N	Shelby	35909	2018-08-02 13:52:31.805549+02	\N
375	375	\N	\N	8536 Smokey Ln	\N	Grand Rapids	54450	2018-08-02 13:52:31.805549+02	\N
376	376	\N	\N	4635 Depaul Dr	\N	Murfreesboro	18121	2018-08-02 13:52:31.805549+02	\N
377	377	\N	\N	Marktplatz 172	\N	Langenau	23905	2018-08-02 13:52:31.805549+02	\N
378	378	\N	\N	1562 Rue De L'Abbé-Groult	\N	Trélex	1147	2018-08-02 13:52:31.805549+02	\N
379	379	\N	\N	1901 Main Street	\N	Manchester	A3 0ET	2018-08-02 13:52:31.805549+02	\N
380	380	\N	\N	8467 E Pecan St	\N	Geelong	6889	2018-08-02 13:52:31.805549+02	\N
381	381	\N	\N	9468 Jacobijnenstraat	\N	Renswoude	50092	2018-08-02 13:52:31.805549+02	\N
382	382	\N	\N	8093 Woodland St	\N	Warrnambool	977	2018-08-02 13:52:31.805549+02	\N
383	383	\N	\N	6580 High Street	\N	Newport	LP1 5RY	2018-08-02 13:52:31.805549+02	\N
384	384	\N	\N	3636 Calle Covadonga	\N	Sevilla	94833	2018-08-02 13:52:31.805549+02	\N
385	385	\N	\N	7795 Rue Du Bon-Pasteur	\N	Laufenburg	3435	2018-08-02 13:52:31.805549+02	\N
386	386	\N	\N	8843 Vibevænget	\N	Randers Nv	85801	2018-08-02 13:52:31.805549+02	\N
387	387	\N	\N	1478 Hogelandsepark	\N	Terneuzen	73858	2018-08-02 13:52:31.805549+02	\N
388	388	\N	\N	3751 Richmond Road	\N	Winchester	FA3L 7ZE	2018-08-02 13:52:31.805549+02	\N
389	389	\N	\N	8218 Rua Dom Pedro Ii 	\N	Nossa Senhora Do Socorro	89181	2018-08-02 13:52:31.805549+02	\N
390	390	\N	\N	3401 New Road	\N	St Davids	Z1 0HU	2018-08-02 13:52:31.805549+02	\N
391	391	\N	\N	1777 Rue De L'Église	\N	Mattstetten	2571	2018-08-02 13:52:31.805549+02	\N
392	392	\N	\N	4698 Mannerheimintie	\N	Kemijärvi	97721	2018-08-02 13:52:31.805549+02	\N
393	393	\N	\N	Römerstraße 154	\N	Lichtenstein/Sa.	54021	2018-08-02 13:52:31.805549+02	\N
394	394	\N	\N	4125 Otavalankatu	\N	Sipoo	71399	2018-08-02 13:52:31.805549+02	\N
395	395	\N	\N	5160 George Street	\N	Preston	Q1 4JW	2018-08-02 13:52:31.805549+02	\N
396	396	\N	\N	4050 Massegast	\N	Bellingwedde	56465	2018-08-02 13:52:31.805549+02	\N
397	397	\N	\N	7672 Wheeler Ridge Dr	\N	Orange	4482	2018-08-02 13:52:31.805549+02	\N
398	398	\N	\N	2274 Calle Del Prado	\N	Sevilla	94971	2018-08-02 13:52:31.805549+02	\N
399	399	\N	\N	4855 Rua Duque De Caxias 	\N	Uberaba	83929	2018-08-02 13:52:31.805549+02	\N
400	400	\N	\N	9117 Frances Ct	\N	Seymour	43730	2018-08-02 13:52:31.805549+02	\N
401	401	\N	\N	638 Church Lane	\N	Aberdeen	I01 6AU	2018-08-02 13:52:31.805549+02	\N
402	402	\N	\N	5224 Elgin St	\N	Hervey Bay	5297	2018-08-02 13:52:31.805549+02	\N
403	403	\N	\N	8291 High Street	\N	Lincoln	G74 9LG	2018-08-02 13:52:31.805549+02	\N
404	404	\N	\N	41 London Road	\N	Bath	Z7O 7FL	2018-08-02 13:52:31.805549+02	\N
405	405	\N	\N	7162 Miller Ave	\N	Broken Arrow	72729	2018-08-02 13:52:31.805549+02	\N
406	406	\N	\N	Kirchstraße 160	\N	Melsungen	14985	2018-08-02 13:52:31.805549+02	\N
407	407	\N	\N	7598 Rua Santa Catarina 	\N	Juiz De Fora	99114	2018-08-02 13:52:31.805549+02	\N
408	408	\N	\N	7560 Queens Road	\N	Birmingham	ZR51 7PP	2018-08-02 13:52:31.805549+02	\N
409	409	\N	\N	4187 N Stelling Rd	\N	Ann Arbor	47132	2018-08-02 13:52:31.805549+02	\N
410	410	\N	\N	5686 Elgin St	\N	Downey	66819	2018-08-02 13:52:31.805549+02	\N
411	411	\N	\N	17 Højtoften	\N	Snertinge	20833	2018-08-02 13:52:31.805549+02	\N
412	412	\N	\N	9200 Ranchview Dr	\N	Bellevue	23292	2018-08-02 13:52:31.805549+02	\N
413	413	\N	\N	2339 Ronda De Toledo	\N	Talavera De La Reina	16847	2018-08-02 13:52:31.805549+02	\N
414	414	\N	\N	815 Korkeavuorenkatu	\N	Ulvila	79036	2018-08-02 13:52:31.805549+02	\N
415	415	\N	\N	2380 Herluf Trolles Vej	\N	Bælum	94846	2018-08-02 13:52:31.805549+02	\N
416	416	\N	\N	Buchenweg 95	\N	Falkenstein/Harz	85599	2018-08-02 13:52:31.805549+02	\N
417	417	\N	\N	9894 Ronda De Toledo	\N	Orihuela	97976	2018-08-02 13:52:31.805549+02	\N
418	418	\N	\N	4792 Stanley Road	\N	Exeter	O9 7JW	2018-08-02 13:52:31.805549+02	\N
419	419	\N	\N	5795 Locust Rd	\N	Kansas City	37935	2018-08-02 13:52:31.805549+02	\N
420	420	\N	\N	223 George Street	\N	Brighton And Hove	L1Y 1LL	2018-08-02 13:52:31.805549+02	\N
421	421	\N	\N	9126 Wheeler Ridge Dr	\N	Long Beach	13112	2018-08-02 13:52:31.805549+02	\N
422	422	\N	\N	6245 Højdedraget	\N	Gjern	65998	2018-08-02 13:52:31.805549+02	\N
423	423	\N	\N	1938 Rua Primeiro De Maio 	\N	Araguari	96914	2018-08-02 13:52:31.805549+02	\N
424	424	\N	\N	2032 Rua Maranhão 	\N	São Paulo	47738	2018-08-02 13:52:31.805549+02	\N
425	425	\N	\N	9041 Potterstraat	\N	Epe	10938	2018-08-02 13:52:31.805549+02	\N
426	426	\N	\N	2514 Paseo De Zorrilla	\N	Oviedo	13607	2018-08-02 13:52:31.805549+02	\N
427	427	\N	\N	5695 Fairview St	\N	Jersey City	75829	2018-08-02 13:52:31.805549+02	\N
428	428	\N	\N	8030 Calle Del Prado	\N	Cuenca	21527	2018-08-02 13:52:31.805549+02	\N
429	429	\N	\N	4692 Rua Vinte E Um	\N	Botucatu	56990	2018-08-02 13:52:31.805549+02	\N
430	430	\N	\N	Danziger Straße 4	\N	Traunstein	86910	2018-08-02 13:52:31.805549+02	\N
431	431	\N	\N	5887 Saturnvej	\N	København N	49887	2018-08-02 13:52:31.805549+02	\N
432	432	\N	\N	9890 Birkevang	\N	Sønder Stenderup	99112	2018-08-02 13:52:31.805549+02	\N
433	433	\N	\N	2554 Ash Dr	\N	Yakima	66728	2018-08-02 13:52:31.805549+02	\N
434	434	\N	\N	9335 Boulevard De Balmont	\N	Brittnau	4457	2018-08-02 13:52:31.805549+02	\N
435	435	\N	\N	2390 Ronda De Toledo	\N	La Coruña	23003	2018-08-02 13:52:31.805549+02	\N
436	436	\N	\N	9321 Højmarksvej	\N	Lundby	20353	2018-08-02 13:52:31.805549+02	\N
437	437	\N	\N	383 Rue De Gerland	\N	Lauwil	5885	2018-08-02 13:52:31.805549+02	\N
438	438	\N	\N	532 Rua São João 	\N	São José De Ribamar	97438	2018-08-02 13:52:31.805549+02	\N
439	439	\N	\N	2765 Nordenskiöldinkatu	\N	Orimattila	81622	2018-08-02 13:52:31.805549+02	\N
440	440	\N	\N	6519 Verkatehtaankatu	\N	Pudasjärvi	70658	2018-08-02 13:52:31.805549+02	\N
441	441	\N	\N	2309 Calle De Atocha	\N	Cartagena	76841	2018-08-02 13:52:31.805549+02	\N
442	442	\N	\N	3601 Hermiankatu	\N	Lappeenranta	61809	2018-08-02 13:52:31.805549+02	\N
443	443	\N	\N	5645 Svanevej	\N	Nr Åby	91031	2018-08-02 13:52:31.805549+02	\N
444	444	\N	\N	Schillerstraße 12	\N	Heinsberg	28788	2018-08-02 13:52:31.805549+02	\N
445	445	\N	\N	8127 Calle De Ángel García	\N	Torrejón De Ardoz	48996	2018-08-02 13:52:31.805549+02	\N
446	446	\N	\N	Lindenweg 114	\N	Amöneburg	29136	2018-08-02 13:52:31.805549+02	\N
447	447	\N	\N	3720 Parcelvej	\N	København N	56977	2018-08-02 13:52:31.805549+02	\N
448	448	\N	\N	6457 Avenue Debourg	\N	Wangen Bei Olten	7882	2018-08-02 13:52:31.805549+02	\N
449	449	\N	\N	5781 Veeartsenijpad	\N	Oldebroek	25701	2018-08-02 13:52:31.805549+02	\N
450	450	\N	\N	4695 Groveland Terrace	\N	Belen	19486	2018-08-02 13:52:31.805549+02	\N
451	451	\N	\N	6875 Suvantokatu	\N	Valkeakoski	75004	2018-08-02 13:52:31.805549+02	\N
452	452	\N	\N	6294 Rua São Paulo 	\N	Foz Do Iguaçu	22129	2018-08-02 13:52:31.805549+02	\N
453	453	\N	\N	7714 Visiokatu	\N	Jämijärvi	68781	2018-08-02 13:52:31.805549+02	\N
454	454	\N	\N	4052 Place De L'Abbé-Basset	\N	Gorgier	9189	2018-08-02 13:52:31.805549+02	\N
455	455	\N	\N	Meisenweg 106	\N	Gladenbach	21647	2018-08-02 13:52:31.805549+02	\N
456	456	\N	\N	1548 Pispalan Valtatie	\N	Utsjoki	23675	2018-08-02 13:52:31.805549+02	\N
457	457	\N	\N	5489 Main Street	\N	York	S65 9JB	2018-08-02 13:52:31.805549+02	\N
458	458	\N	\N	1881 E Little York Rd	\N	Van Alstyne	50912	2018-08-02 13:52:31.805549+02	\N
459	459	\N	\N	905 Bavnehøjvej	\N	Aarhus N	64133	2018-08-02 13:52:31.805549+02	\N
460	460	\N	\N	5040 Rue Paul Bert	\N	Wädenswil	3139	2018-08-02 13:52:31.805549+02	\N
461	461	\N	\N	7546 Fairview Road	\N	St Davids	P6 8DP	2018-08-02 13:52:31.805549+02	\N
462	462	\N	\N	6908 Alexander Road	\N	Inverness	WD16 5XU	2018-08-02 13:52:31.805549+02	\N
463	463	\N	\N	5684 Adriaen Van Ostadelaan	\N	Kampen	54079	2018-08-02 13:52:31.805549+02	\N
464	464	\N	\N	8316 Chester Road	\N	Chester	DR09 7GY	2018-08-02 13:52:31.805549+02	\N
465	465	\N	\N	2156 Jyllandsgade	\N	Hirtsals	92645	2018-08-02 13:52:31.805549+02	\N
466	466	\N	\N	8463 Tehtaankatu	\N	Evijärvi	30135	2018-08-02 13:52:31.805549+02	\N
467	467	\N	\N	3349 Twijnstraat Aan De Werf	\N	Stitswerd	59439	2018-08-02 13:52:31.805549+02	\N
468	468	\N	\N	988 Monseigneur Van De Weteringstraat	\N	Oldebroek	91175	2018-08-02 13:52:31.805549+02	\N
469	469	\N	\N	6149 Myllypuronkatu	\N	Vesilahti	22946	2018-08-02 13:52:31.805549+02	\N
470	470	\N	\N	6053 Crockett St	\N	Austin	30871	2018-08-02 13:52:31.805549+02	\N
471	471	\N	\N	5351 Photinia Ave	\N	Mackay	7141	2018-08-02 13:52:31.805549+02	\N
472	472	\N	\N	Brunnenstraße 14	\N	Herbolzheim	39590	2018-08-02 13:52:31.805549+02	\N
473	473	\N	\N	975 W Pecan St	\N	Milwaukee	12296	2018-08-02 13:52:31.805549+02	\N
474	474	\N	\N	4512 Bruce St	\N	Elko	64033	2018-08-02 13:52:31.805549+02	\N
475	475	\N	\N	9953 Rue De La Fontaine	\N	Pieterlen	7850	2018-08-02 13:52:31.805549+02	\N
476	476	\N	\N	5159 Fairview St	\N	Vernon	50611	2018-08-02 13:52:31.805549+02	\N
477	477	\N	\N	1396 Calle Del Pez	\N	Pozuelo De Alarcón	11624	2018-08-02 13:52:31.805549+02	\N
478	478	\N	\N	5538 A.B.C.-Straat	\N	Tytsjerksteradiel	54670	2018-08-02 13:52:31.805549+02	\N
479	479	\N	\N	9599 Main Street	\N	Nottingham	B8I 0BH	2018-08-02 13:52:31.805549+02	\N
480	480	\N	\N	656 Harrison Ct	\N	Anchorage	81824	2018-08-02 13:52:31.805549+02	\N
481	481	\N	\N	9336 Donkere Gaard	\N	Tynaarlo	12888	2018-08-02 13:52:31.805549+02	\N
482	482	\N	\N	Kapellenweg 79	\N	Freyung-Grafenau	38520	2018-08-02 13:52:31.805549+02	\N
483	483	\N	\N	467 Locust Rd	\N	Greeley	47013	2018-08-02 13:52:31.805549+02	\N
484	484	\N	\N	Parkstraße 178	\N	Wetter (Ruhr)	89023	2018-08-02 13:52:31.805549+02	\N
485	485	\N	\N	4758 Hjørringvej	\N	Oure	13177	2018-08-02 13:52:31.805549+02	\N
486	486	\N	\N	6580 Calle De Ángel García	\N	Cartagena	41309	2018-08-02 13:52:31.805549+02	\N
487	487	\N	\N	3758 Adelgade	\N	Overby Lyng	16926	2018-08-02 13:52:31.805549+02	\N
488	488	\N	\N	7756 Aleksanterinkatu	\N	Valkeakoski	71739	2018-08-02 13:52:31.805549+02	\N
489	489	\N	\N	7367 Rue Des Abbesses	\N	Amsoldingen	7112	2018-08-02 13:52:31.805549+02	\N
490	490	\N	\N	2959 Wheeler Ridge Dr	\N	Melbourne	3090	2018-08-02 13:52:31.805549+02	\N
491	491	\N	\N	6238 Depaul Dr	\N	Coffs Harbour	256	2018-08-02 13:52:31.805549+02	\N
492	492	\N	\N	8826 Prospect Rd	\N	Perth	5622	2018-08-02 13:52:31.805549+02	\N
493	493	\N	\N	7054 Rotuaari	\N	Kokkola	78842	2018-08-02 13:52:31.805549+02	\N
494	494	\N	\N	5640 Avenida Del Planetario	\N	Pontevedra	48806	2018-08-02 13:52:31.805549+02	\N
495	495	\N	\N	5602 Main Street	\N	Durham	ZN3X 9UF	2018-08-02 13:52:31.805549+02	\N
496	496	\N	\N	7663 Rue Principale	\N	Les Bois	9109	2018-08-02 13:52:31.805549+02	\N
497	497	\N	\N	7986 W Gray St	\N	Garland	42070	2018-08-02 13:52:31.805549+02	\N
498	498	\N	\N	8591 Stevens Creek Blvd	\N	Vallejo	91415	2018-08-02 13:52:31.805549+02	\N
499	499	\N	\N	7345 Avenue De La Libération	\N	Gravesano	8932	2018-08-02 13:52:31.805549+02	\N
500	500	\N	\N	6563 Oaks Cross	\N	Lisburn	W5B 1AJ	2018-08-02 13:52:31.805549+02	\N
501	501	\N	\N	1061 Ambachtstraat	\N	Wijdemeren	11755	2018-08-02 13:52:31.805549+02	\N
502	502	\N	\N	4777 Park Lane	\N	Stoke-On-Trent	E51 0PU	2018-08-02 13:52:31.805549+02	\N
503	503	\N	\N	Schlossstraße 150	\N	Neuenstein	69410	2018-08-02 13:52:31.805549+02	\N
504	504	\N	\N	7984 Stengårdsvej	\N	Sundby	61023	2018-08-02 13:52:31.805549+02	\N
505	505	\N	\N	3980 Hickory Creek Dr	\N	Bowral	4940	2018-08-02 13:52:31.805549+02	\N
506	506	\N	\N	1048 Siilitie	\N	Nurmijärvi	28227	2018-08-02 13:52:31.805549+02	\N
507	507	\N	\N	2945 North Street	\N	Leicester	S37 9PE	2018-08-02 13:52:31.805549+02	\N
508	508	\N	\N	4879 Kingsway	\N	Bristol	XH4 5XQ	2018-08-02 13:52:31.805549+02	\N
509	509	\N	\N	7632 Calle Nebrija	\N	Barcelona	32674	2018-08-02 13:52:31.805549+02	\N
510	510	\N	\N	6801 Avenue De L'Abbé-Roussel	\N	Serravalle	5884	2018-08-02 13:52:31.805549+02	\N
511	511	\N	\N	1621 Grande Rue	\N	Röschenz	6583	2018-08-02 13:52:31.805549+02	\N
512	512	\N	\N	8719 Plum St	\N	Arvada	65406	2018-08-02 13:52:31.805549+02	\N
513	513	\N	\N	5527 Calle De Toledo	\N	Fuenlabrada	54825	2018-08-02 13:52:31.805549+02	\N
514	514	\N	\N	4362 Ranchview Dr	\N	Bundaberg	4611	2018-08-02 13:52:31.805549+02	\N
515	515	\N	\N	Burgstraße 35	\N	Geilenkirchen	74064	2018-08-02 13:52:31.805549+02	\N
516	516	\N	\N	5404 Alexander Numankade	\N	Nuth	17733	2018-08-02 13:52:31.805549+02	\N
517	517	\N	\N	7998 Springfield Road	\N	Belfast	C7 8LA	2018-08-02 13:52:31.805549+02	\N
518	518	\N	\N	8653 Place Du 22 Novembre 1943	\N	Zürich	6273	2018-08-02 13:52:31.805549+02	\N
519	519	\N	\N	6605 Rue Du Bât-D'Argent	\N	Lalden	7074	2018-08-02 13:52:31.805549+02	\N
520	520	\N	\N	4095 Baden-Powellweg	\N	Wijdemeren	93892	2018-08-02 13:52:31.805549+02	\N
521	521	\N	\N	4877 Hämeenkatu	\N	Myrskylä	42950	2018-08-02 13:52:31.805549+02	\N
522	522	\N	\N	1695 Avenida De Castilla	\N	Ferrol	72066	2018-08-02 13:52:31.805549+02	\N
523	523	\N	\N	1999 Calle De Alberto Aguilera	\N	Torrejón De Ardoz	79202	2018-08-02 13:52:31.805549+02	\N
524	524	\N	\N	204 Avenida Da Legalidade	\N	Guarapuava	29410	2018-08-02 13:52:31.805549+02	\N
525	525	\N	\N	6197 Calle De Tetuán	\N	Lugo	35845	2018-08-02 13:52:31.805549+02	\N
526	526	\N	\N	4393 Ballevej	\N	Assens	10412	2018-08-02 13:52:31.805549+02	\N
527	527	\N	\N	6883 Nieuwegracht	\N	Den Haag	31471	2018-08-02 13:52:31.805549+02	\N
528	528	\N	\N	4697 F.C. Dondersstraat	\N	Beuningen	88261	2018-08-02 13:52:31.805549+02	\N
529	529	\N	\N	Im Winkel 67	\N	Altenberg	60904	2018-08-02 13:52:31.805549+02	\N
530	530	\N	\N	Brunnenstraße 130	\N	Eggesin	93708	2018-08-02 13:52:31.805549+02	\N
531	531	\N	\N	8989 Rua Dom Pedro Ii 	\N	Pindamonhangaba	80049	2018-08-02 13:52:31.805549+02	\N
532	532	\N	\N	2042 Rua Vinte De Setembro	\N	Araguaína	96422	2018-08-02 13:52:31.805549+02	\N
533	533	\N	\N	9371 Rue Pasteur	\N	Dalpe	3555	2018-08-02 13:52:31.805549+02	\N
534	534	\N	\N	4892 The Grove	\N	Gloucester	M72 9ZB	2018-08-02 13:52:31.805549+02	\N
535	535	\N	\N	5502 Fredrikinkatu	\N	Somero	27518	2018-08-02 13:52:31.805549+02	\N
536	536	\N	\N	1786 E North St	\N	Rockhampton	8026	2018-08-02 13:52:31.805549+02	\N
537	537	\N	\N	9442 Ash Dr	\N	Toowoomba	5400	2018-08-02 13:52:31.805549+02	\N
538	538	\N	\N	8172 Verkatehtaankatu	\N	Nummi	45103	2018-08-02 13:52:31.805549+02	\N
539	539	\N	\N	Amselweg 143	\N	Bad Saulgau	85009	2018-08-02 13:52:31.805549+02	\N
540	540	\N	\N	4 Avenue Jean-Jaurès	\N	Bürglen (Ur)	1598	2018-08-02 13:52:31.805549+02	\N
541	541	\N	\N	5926 Sandbjergvej	\N	Skaerbaek	54396	2018-08-02 13:52:31.805549+02	\N
542	542	\N	\N	5555 Nordenskiöldinkatu	\N	Hanko	86210	2018-08-02 13:52:31.805549+02	\N
543	543	\N	\N	9275 Rolling Green Rd	\N	Wollongong	2467	2018-08-02 13:52:31.805549+02	\N
544	544	\N	\N	225 Rue Gasparin	\N	Le Cerneux-Péquignot	4542	2018-08-02 13:52:31.805549+02	\N
545	545	\N	\N	9316 Teglgårdsvej	\N	Øster Assels	61734	2018-08-02 13:52:31.805549+02	\N
546	546	\N	\N	5913 Fredrikinkatu	\N	Ylitornio	20024	2018-08-02 13:52:31.805549+02	\N
547	547	\N	\N	4808 Lucasbolwerk	\N	Westerveld	81810	2018-08-02 13:52:31.805549+02	\N
548	548	\N	\N	3995 Poortstraat	\N	Tholen	83872	2018-08-02 13:52:31.805549+02	\N
549	549	\N	\N	6248 Karen Dr	\N	Fayetteville	66059	2018-08-02 13:52:31.805549+02	\N
550	550	\N	\N	4570 Avenue Jean-Jaurès	\N	Valsot	8586	2018-08-02 13:52:31.805549+02	\N
551	551	\N	\N	5287 Rua Vinte E Um	\N	Porto Seguro	95824	2018-08-02 13:52:31.805549+02	\N
552	552	\N	\N	3559 Stanley Road	\N	Cambridge	Y9 8YP	2018-08-02 13:52:31.805549+02	\N
553	553	\N	\N	5422 Rua Três	\N	Salto	23205	2018-08-02 13:52:31.805549+02	\N
554	554	\N	\N	1066 Croesestraat	\N	Noordenveld	32953	2018-08-02 13:52:31.805549+02	\N
555	555	\N	\N	3981 Biltstraat	\N	Nunspeet	23216	2018-08-02 13:52:31.805549+02	\N
556	556	\N	\N	9598 Rua Castro Alves 	\N	Catanduva	89101	2018-08-02 13:52:31.805549+02	\N
557	557	\N	\N	3065 Rue Des Écoles	\N	Pont-La-Ville	8260	2018-08-02 13:52:31.805549+02	\N
558	558	\N	\N	4154 Rue Victor-Hugo	\N	Obersteckholz	3878	2018-08-02 13:52:31.805549+02	\N
559	559	\N	\N	6371 Rotuaari	\N	Jyväskylä	88953	2018-08-02 13:52:31.805549+02	\N
560	560	\N	\N	7387 Kongevej	\N	Hornbæk	47851	2018-08-02 13:52:31.805549+02	\N
561	561	\N	\N	9482 Blossom Hill Rd	\N	Hervey Bay	7619	2018-08-02 13:52:31.805549+02	\N
562	562	\N	\N	9514 London Road	\N	Birmingham	O8S 6LQ	2018-08-02 13:52:31.805549+02	\N
563	563	\N	\N	9414 Oak Ridge Ln	\N	Gladstone	416	2018-08-02 13:52:31.805549+02	\N
564	564	\N	\N	1068 Grande Rue	\N	Erschwil	8592	2018-08-02 13:52:31.805549+02	\N
565	565	\N	\N	5668 Rautatienkatu	\N	Hattula	45897	2018-08-02 13:52:31.805549+02	\N
566	566	\N	\N	8657 Kildegårdsvej	\N	Ansager	33732	2018-08-02 13:52:31.805549+02	\N
567	567	\N	\N	6081 W 6th St	\N	San Mateo	97851	2018-08-02 13:52:31.805549+02	\N
568	568	\N	\N	4017 Plompetorenbrug	\N	Soest	71216	2018-08-02 13:52:31.805549+02	\N
569	569	\N	\N	5134 Rue Desaix	\N	Feuerthalen	3503	2018-08-02 13:52:31.805549+02	\N
570	570	\N	\N	5318 Spring Hill Rd	\N	Ballarat	5383	2018-08-02 13:52:31.805549+02	\N
571	571	\N	\N	2732 Rua Duque De Caxias 	\N	Itajaí	49918	2018-08-02 13:52:31.805549+02	\N
572	572	\N	\N	3762 Rua Boa Vista 	\N	Atibaia	89899	2018-08-02 13:52:31.805549+02	\N
573	573	\N	\N	215 Saddle Dr	\N	Melbourne	8159	2018-08-02 13:52:31.805549+02	\N
574	574	\N	\N	4680 Blossom Hill Rd	\N	Geelong	7166	2018-08-02 13:52:31.805549+02	\N
575	575	\N	\N	9724 North Street	\N	Stoke-On-Trent	VU6F 4GE	2018-08-02 13:52:31.805549+02	\N
576	576	\N	\N	2485 Avenida De Andalucía	\N	Lugo	43204	2018-08-02 13:52:31.805549+02	\N
577	577	\N	\N	1760 Hämeentie	\N	Vimpeli	75660	2018-08-02 13:52:31.805549+02	\N
578	578	\N	\N	685 Rylevej	\N	Oure	97701	2018-08-02 13:52:31.805549+02	\N
579	579	\N	\N	5316 Van Asch Van Wijckskade	\N	Aalburg	15778	2018-08-02 13:52:31.805549+02	\N
580	580	\N	\N	9451 Stevens Creek Blvd	\N	Bunbury	8780	2018-08-02 13:52:31.805549+02	\N
581	581	\N	\N	7579 Westplein	\N	Montferland	83338	2018-08-02 13:52:31.805549+02	\N
582	582	\N	\N	3037 Calle De Alcalá	\N	La Coruña	38015	2018-08-02 13:52:31.805549+02	\N
583	583	\N	\N	8831 Visiokatu	\N	Pello	75601	2018-08-02 13:52:31.805549+02	\N
584	584	\N	\N	7101 Smokey Ln	\N	Geelong	4301	2018-08-02 13:52:31.805549+02	\N
585	585	\N	\N	3997 Itsenäisyydenkatu	\N	Karkkila	28560	2018-08-02 13:52:31.805549+02	\N
586	586	\N	\N	2807 Rue De L'Abbé-De-L'Épée	\N	Vinelz	7596	2018-08-02 13:52:31.805549+02	\N
587	587	\N	\N	4200 Baden-Powellweg	\N	Bronckhorst	19385	2018-08-02 13:52:31.805549+02	\N
588	588	\N	\N	5711 Rua São Sebastiao 	\N	Indaiatuba	98345	2018-08-02 13:52:31.805549+02	\N
589	589	\N	\N	Mühlweg 194	\N	Halver	39346	2018-08-02 13:52:31.805549+02	\N
590	590	\N	\N	1660 Rue Dugas-Montbel	\N	Dättlikon	3996	2018-08-02 13:52:31.805549+02	\N
591	591	\N	\N	2177 First Street	\N	Lansing	53039	2018-08-02 13:52:31.805549+02	\N
592	592	\N	\N	6788 Rua Santa Rita 	\N	Itapecerica Da Serra	71163	2018-08-02 13:52:31.805549+02	\N
593	593	\N	\N	4028 Springfield Road	\N	Bristol	N23 9YJ	2018-08-02 13:52:31.805549+02	\N
594	594	\N	\N	1818 Rue Jean-Baldassini	\N	Unteriberg	6199	2018-08-02 13:52:31.805549+02	\N
595	595	\N	\N	3191 Rua Um	\N	Três Lagoas	53215	2018-08-02 13:52:31.805549+02	\N
596	596	\N	\N	2791 Railroad St	\N	Spokane	96207	2018-08-02 13:52:31.805549+02	\N
597	597	\N	\N	7096 Pirkankatu	\N	Oulainen	54918	2018-08-02 13:52:31.805549+02	\N
598	598	\N	\N	6146 Pyynikintie	\N	Honkajoki	76893	2018-08-02 13:52:31.805549+02	\N
599	599	\N	\N	Buchenweg 94	\N	Marsberg	28674	2018-08-02 13:52:31.805549+02	\N
600	600	\N	\N	350 Vægterparken	\N	Beder	65395	2018-08-02 13:52:31.805549+02	\N
601	601	\N	\N	3698 E Pecan St	\N	Lansing	29565	2018-08-02 13:52:31.805549+02	\N
602	602	\N	\N	8513 West Street	\N	Salford	K79 3AG	2018-08-02 13:52:31.805549+02	\N
603	603	\N	\N	8165 Hickory Creek Dr	\N	Bunbury	7422	2018-08-02 13:52:31.805549+02	\N
604	604	\N	\N	977 Rua Vinte E Um	\N	Vitória De Santo Antão	75428	2018-08-02 13:52:31.805549+02	\N
638	638	\N	\N	6171 New Road	\N	Bath	A81 1WW	2018-08-02 13:52:31.805549+02	\N
605	605	\N	\N	9467 Donkerstraat	\N	Zoeterwoude	14200	2018-08-02 13:52:31.805549+02	\N
606	606	\N	\N	2515 Verkatehtaankatu	\N	Ähtäri	76880	2018-08-02 13:52:31.805549+02	\N
607	607	\N	\N	Bachstraße 110	\N	Bad Wurzach	54776	2018-08-02 13:52:31.805549+02	\N
608	608	\N	\N	1538 Tahmelantie	\N	Rautjärvi	42141	2018-08-02 13:52:31.805549+02	\N
609	609	\N	\N	9435 Hickory Creek Dr	\N	Shepparton	6212	2018-08-02 13:52:31.805549+02	\N
610	610	\N	\N	1226 Avenida De La Albufera	\N	San Sebastián De Los Reyes	26163	2018-08-02 13:52:31.805549+02	\N
611	611	\N	\N	3571 Strandengen	\N	Viby J.	31769	2018-08-02 13:52:31.805549+02	\N
612	612	\N	\N	Kirchplatz 108	\N	Freilassing	18151	2018-08-02 13:52:31.805549+02	\N
613	613	\N	\N	5889 W Pecan St	\N	Long Beach	71446	2018-08-02 13:52:31.805549+02	\N
614	614	\N	\N	916 Crockett St	\N	Gladstone	4588	2018-08-02 13:52:31.805549+02	\N
615	615	\N	\N	Marktplatz 67	\N	Bielefeld	33421	2018-08-02 13:52:31.805549+02	\N
616	616	\N	\N	191 Paseo De Extremadura	\N	Burgos	76072	2018-08-02 13:52:31.805549+02	\N
617	617	\N	\N	5854 Rue De L'Abbé-De-L'Épée	\N	Fiez	2278	2018-08-02 13:52:31.805549+02	\N
618	618	\N	\N	1416 Avenida Vinícius De Morais	\N	Crato	52978	2018-08-02 13:52:31.805549+02	\N
619	619	\N	\N	9114 Fredrikinkatu	\N	Sipoo	23263	2018-08-02 13:52:31.805549+02	\N
620	620	\N	\N	6476 Calle De Pedro Bosch	\N	Albacete	78634	2018-08-02 13:52:31.805549+02	\N
621	621	\N	\N	9796 Rua São Jorge 	\N	Niterói	13145	2018-08-02 13:52:31.805549+02	\N
622	622	\N	\N	Friedhofstraße 21	\N	Böblingen	84913	2018-08-02 13:52:31.805549+02	\N
623	623	\N	\N	7698 Nordenskiöldinkatu	\N	Yli	38881	2018-08-02 13:52:31.805549+02	\N
624	624	\N	\N	6921 Engsvinget	\N	Sundby/Erslev	56116	2018-08-02 13:52:31.805549+02	\N
625	625	\N	\N	53 Pyynikintie	\N	Toivakka	48009	2018-08-02 13:52:31.805549+02	\N
626	626	\N	\N	Hauptstraße 133	\N	Meßstetten	30894	2018-08-02 13:52:31.805549+02	\N
627	627	\N	\N	555 Itsenäisyydenkatu	\N	Lapinjärvi	30363	2018-08-02 13:52:31.805549+02	\N
628	628	\N	\N	4022 Avenida Del Planetario	\N	Ferrol	13715	2018-08-02 13:52:31.805549+02	\N
629	629	\N	\N	2982 Rue Barrier	\N	Aristau	3297	2018-08-02 13:52:31.805549+02	\N
630	630	\N	\N	8410 E Little York Rd	\N	South Bend	78968	2018-08-02 13:52:31.805549+02	\N
631	631	\N	\N	Waldweg 107	\N	Oettingen In Bayern	57236	2018-08-02 13:52:31.805549+02	\N
632	632	\N	\N	7312 Grange Road	\N	City Of London	XC9H 1ER	2018-08-02 13:52:31.805549+02	\N
633	633	\N	\N	3501 Smokey Ln	\N	Geraldton	3395	2018-08-02 13:52:31.805549+02	\N
634	634	\N	\N	2929 Calle De Segovia	\N	Córdoba	25737	2018-08-02 13:52:31.805549+02	\N
635	635	\N	\N	5681 Drosselvej	\N	Saltum	22421	2018-08-02 13:52:31.805549+02	\N
636	636	\N	\N	4719 Rue Pasteur	\N	Lostorf	5030	2018-08-02 13:52:31.805549+02	\N
637	637	\N	\N	5668 Valley View Ln	\N	Sunshine Coast	7118	2018-08-02 13:52:31.805549+02	\N
639	639	\N	\N	3604 Brorsonsvej	\N	Gjern	13528	2018-08-02 13:52:31.805549+02	\N
640	640	\N	\N	3229 Teglværksvej	\N	Sommersted	39395	2018-08-02 13:52:31.805549+02	\N
641	641	\N	\N	2134 Victoria Street	\N	Gloucester	M76 3EB	2018-08-02 13:52:31.805549+02	\N
642	642	\N	\N	Kirchweg 151	\N	Abensberg	23516	2018-08-02 13:52:31.805549+02	\N
643	643	\N	\N	5714 Sofievej	\N	Aarhus N	20570	2018-08-02 13:52:31.805549+02	\N
644	644	\N	\N	789 Avenue Debrousse	\N	Birrwil	5102	2018-08-02 13:52:31.805549+02	\N
645	645	\N	\N	7753 Thornridge Cir	\N	Tamworth	471	2018-08-02 13:52:31.805549+02	\N
646	646	\N	\N	Lindenweg 61	\N	Laatzen	53319	2018-08-02 13:52:31.805549+02	\N
647	647	\N	\N	6607 Calle De Ferraz	\N	Santa Cruz De Tenerife	43524	2018-08-02 13:52:31.805549+02	\N
648	648	\N	\N	7977 Victoria Road	\N	Hereford	DG9R 4FB	2018-08-02 13:52:31.805549+02	\N
649	649	\N	\N	300 London Road	\N	Belfast	IS5 1SZ	2018-08-02 13:52:31.805549+02	\N
650	650	\N	\N	2879 Rua Treze 	\N	Canoas	91198	2018-08-02 13:52:31.805549+02	\N
651	651	\N	\N	7305 York Road	\N	Leicester	R5 2HS	2018-08-02 13:52:31.805549+02	\N
652	652	\N	\N	9854 Calle De Segovia	\N	Gijón	48115	2018-08-02 13:52:31.805549+02	\N
653	653	\N	\N	9717 Wycliff Ave	\N	Lousville	75281	2018-08-02 13:52:31.805549+02	\N
654	654	\N	\N	4394 Geertekerkhof	\N	Valkenswaard	64842	2018-08-02 13:52:31.805549+02	\N
655	655	\N	\N	8287 Calle Nebrija	\N	Talavera De La Reina	85904	2018-08-02 13:52:31.805549+02	\N
656	656	\N	\N	Lindenstraße 131	\N	Leimen	25572	2018-08-02 13:52:31.805549+02	\N
657	657	\N	\N	4163 South Street	\N	Birmingham	T15 1BA	2018-08-02 13:52:31.805549+02	\N
658	658	\N	\N	Mühlweg 117	\N	Egeln	81536	2018-08-02 13:52:31.805549+02	\N
659	659	\N	\N	9115 Pispalan Valtatie	\N	Jämsä	92239	2018-08-02 13:52:31.805549+02	\N
660	660	\N	\N	6028 Rua Amazonas 	\N	Campina Grande	39511	2018-08-02 13:52:31.805549+02	\N
661	661	\N	\N	6701 Solskrænten	\N	Billum	21264	2018-08-02 13:52:31.805549+02	\N
662	662	\N	\N	1431 Daisy Dr	\N	Pearland	97699	2018-08-02 13:52:31.805549+02	\N
663	663	\N	\N	1363 W Gray St	\N	Albany	8304	2018-08-02 13:52:31.805549+02	\N
664	664	\N	\N	4128 W Dallas St	\N	Green Bay	29279	2018-08-02 13:52:31.805549+02	\N
665	665	\N	\N	792 Avenida Brasil 	\N	Ponta Grossa	85799	2018-08-02 13:52:31.805549+02	\N
666	666	\N	\N	1143 White Oak Dr	\N	West Covina	28899	2018-08-02 13:52:31.805549+02	\N
667	667	\N	\N	9832 Royal Ln	\N	Traralgon	2750	2018-08-02 13:52:31.805549+02	\N
668	668	\N	\N	2557 Avenue Debourg	\N	Buchillon	9854	2018-08-02 13:52:31.805549+02	\N
669	669	\N	\N	965 Rua Boa Vista 	\N	São Paulo	24949	2018-08-02 13:52:31.805549+02	\N
670	670	\N	\N	8664 Vestermarken	\N	Brondby	68542	2018-08-02 13:52:31.805549+02	\N
671	671	\N	\N	6838 Rue Louis-Blanqui	\N	Ennetbürgen	5462	2018-08-02 13:52:31.805549+02	\N
672	672	\N	\N	7917 The Crescent	\N	Lisburn	YK9 9NE	2018-08-02 13:52:31.805549+02	\N
673	673	\N	\N	320 Oak Lawn Ave	\N	Shiloh	63827	2018-08-02 13:52:31.805549+02	\N
674	674	\N	\N	Lerchenweg 146	\N	Gerabronn	42386	2018-08-02 13:52:31.805549+02	\N
675	675	\N	\N	5825 Valley View Ln	\N	Wollongong	5685	2018-08-02 13:52:31.805549+02	\N
676	676	\N	\N	4125 Mcgowen St	\N	Oceanside	12649	2018-08-02 13:52:31.805549+02	\N
677	677	\N	\N	5898 Wycliff Ave	\N	Coffs Harbour	2784	2018-08-02 13:52:31.805549+02	\N
678	678	\N	\N	1342 Valley View Ln	\N	San Diego	96034	2018-08-02 13:52:31.805549+02	\N
679	679	\N	\N	2339 Rua Santa Maria 	\N	Aracaju	22039	2018-08-02 13:52:31.805549+02	\N
680	680	\N	\N	4119 Otavalankatu	\N	Parkano	36775	2018-08-02 13:52:31.805549+02	\N
681	681	\N	\N	1796 West Street	\N	Lichfield	B9R 2SX	2018-08-02 13:52:31.805549+02	\N
682	682	\N	\N	Marktplatz 182	\N	Besigheim	66413	2018-08-02 13:52:31.805549+02	\N
683	683	\N	\N	4254 Manchester Road	\N	Newcastle Upon Tyne	LF7 4ZQ	2018-08-02 13:52:31.805549+02	\N
684	684	\N	\N	4689 Albert Road	\N	Swansea	VF15 4FE	2018-08-02 13:52:31.805549+02	\N
685	685	\N	\N	4591 Rue Jean-Baldassini	\N	Rüttenen	5117	2018-08-02 13:52:31.805549+02	\N
686	686	\N	\N	9101 Smokey Ln	\N	Vancouver	75940	2018-08-02 13:52:31.805549+02	\N
687	687	\N	\N	8723 Rua Treze De Maio 	\N	Uberaba	56304	2018-08-02 13:52:31.805549+02	\N
688	688	\N	\N	5928 Billitonkade	\N	Haaksbergen	16958	2018-08-02 13:52:31.805549+02	\N
689	689	\N	\N	5367 Wijde Begijnestraat	\N	Tholen	18558	2018-08-02 13:52:31.805549+02	\N
690	690	\N	\N	648 Boulevard De La Duchère	\N	Sommeri	8995	2018-08-02 13:52:31.805549+02	\N
691	691	\N	\N	526 Calle De Ferraz	\N	Sevilla	73034	2018-08-02 13:52:31.805549+02	\N
692	692	\N	\N	Danziger Straße 100	\N	Mayen-Koblenz	54766	2018-08-02 13:52:31.805549+02	\N
693	693	\N	\N	9961 Verkatehtaankatu	\N	Tornio	10231	2018-08-02 13:52:31.805549+02	\N
694	694	\N	\N	Parkstraße 24	\N	Pfungstadt	82642	2018-08-02 13:52:31.805549+02	\N
695	695	\N	\N	478 Rua Doze 	\N	Várzea Paulista	17438	2018-08-02 13:52:31.805549+02	\N
696	696	\N	\N	9410 Bridge Road	\N	Inverness	EQ0R 8GH	2018-08-02 13:52:31.805549+02	\N
697	697	\N	\N	6708 Rørsangervej	\N	Allinge	89208	2018-08-02 13:52:31.805549+02	\N
698	698	\N	\N	8581 St. John’S Road	\N	Stevenage	O5G 3EN	2018-08-02 13:52:31.805549+02	\N
699	699	\N	\N	8655 Rua São Jorge 	\N	Cametá	26771	2018-08-02 13:52:31.805549+02	\N
700	700	\N	\N	9716 Thornridge Cir	\N	Forney	48860	2018-08-02 13:52:31.805549+02	\N
701	701	\N	\N	9686 Fredrikinkatu	\N	Sund	64721	2018-08-02 13:52:31.805549+02	\N
702	702	\N	\N	9762 Silkeborgvej	\N	Allinge	66473	2018-08-02 13:52:31.805549+02	\N
703	703	\N	\N	4195 Bruce St	\N	Dubbo	2437	2018-08-02 13:52:31.805549+02	\N
704	704	\N	\N	7381 Rue Duguesclin	\N	Horw	2533	2018-08-02 13:52:31.805549+02	\N
705	705	\N	\N	7744 Reijolankatu	\N	Salla	89266	2018-08-02 13:52:31.805549+02	\N
706	706	\N	\N	Waldstraße 189	\N	Gerlingen	90932	2018-08-02 13:52:31.805549+02	\N
707	707	\N	\N	38 Neude	\N	Kollumerland En Nieuwkruisland	42082	2018-08-02 13:52:31.805549+02	\N
708	708	\N	\N	5875 Avenida Del Planetario	\N	Valladolid	22580	2018-08-02 13:52:31.805549+02	\N
709	709	\N	\N	9683 Quai Chauveau	\N	Luthern	8243	2018-08-02 13:52:31.805549+02	\N
710	710	\N	\N	1435 Calle Covadonga	\N	Bilbao	37053	2018-08-02 13:52:31.805549+02	\N
711	711	\N	\N	5347 Esplanadi	\N	Rovaniemi	66291	2018-08-02 13:52:31.805549+02	\N
712	712	\N	\N	588 Rua Espirito Santo 	\N	Caraguatatuba	14172	2018-08-02 13:52:31.805549+02	\N
713	713	\N	\N	5003 Rue De Bonnel	\N	Mesocco	5383	2018-08-02 13:52:31.805549+02	\N
714	714	\N	\N	7874 Hillcrest Rd	\N	Sunshine Coast	9335	2018-08-02 13:52:31.805549+02	\N
715	715	\N	\N	7210 Reijolankatu	\N	Kokkola	89590	2018-08-02 13:52:31.805549+02	\N
716	716	\N	\N	Amselweg 70	\N	Sprockhövel	23653	2018-08-02 13:52:31.805549+02	\N
717	717	\N	\N	3510 Rue Paul Bert	\N	Laufen	9092	2018-08-02 13:52:31.805549+02	\N
718	718	\N	\N	5866 Eason Rd	\N	Melbourne	9072	2018-08-02 13:52:31.805549+02	\N
719	719	\N	\N	3734 Haveforeningen Kildegården	\N	Roedovre	95173	2018-08-02 13:52:31.805549+02	\N
720	720	\N	\N	1823 Calle Del Arenal	\N	Vigo	21095	2018-08-02 13:52:31.805549+02	\N
721	721	\N	\N	8288 Avenida De Andalucía	\N	Alcobendas	59406	2018-08-02 13:52:31.805549+02	\N
722	722	\N	\N	4241 Homestead Rd	\N	Sydney	8270	2018-08-02 13:52:31.805549+02	\N
723	723	\N	\N	Mühlenstraße 16	\N	Wallenfels	77018	2018-08-02 13:52:31.805549+02	\N
724	724	\N	\N	9618 Rua Quatro	\N	Araruama	86269	2018-08-02 13:52:31.805549+02	\N
725	725	\N	\N	957 Rua Três	\N	Jacareí	51828	2018-08-02 13:52:31.805549+02	\N
726	726	\N	\N	7496 Mechelininkatu	\N	Kitee	75144	2018-08-02 13:52:31.805549+02	\N
727	727	\N	\N	1955 Ash Dr	\N	Bowral	2113	2018-08-02 13:52:31.805549+02	\N
728	728	\N	\N	5110 Gasthuisstraat	\N	Groesbeek	24314	2018-08-02 13:52:31.805549+02	\N
729	729	\N	\N	5041 Janskerkhof	\N	Ede	39345	2018-08-02 13:52:31.805549+02	\N
730	730	\N	\N	2567 Avenue Paul Eluard	\N	Ligerz	3158	2018-08-02 13:52:31.805549+02	\N
731	731	\N	\N	5757 Itsenäisyydenkatu	\N	Toholampi	94811	2018-08-02 13:52:31.805549+02	\N
732	732	\N	\N	3637 Fairview Road	\N	Newcastle Upon Tyne	W0P 3AX	2018-08-02 13:52:31.805549+02	\N
733	733	\N	\N	8602 Preston Rd	\N	Ballarat	3722	2018-08-02 13:52:31.805549+02	\N
734	734	\N	\N	7198 Park Road	\N	Hereford	QH7 8QN	2018-08-02 13:52:31.805549+02	\N
735	735	\N	\N	9574 Preston Rd	\N	Dubbo	8097	2018-08-02 13:52:31.805549+02	\N
736	736	\N	\N	6692 Grove Road	\N	Oxford	L8 8DF	2018-08-02 13:52:31.805549+02	\N
737	737	\N	\N	5317 Rue Victor-Hugo	\N	Grindel	2728	2018-08-02 13:52:31.805549+02	\N
738	738	\N	\N	2910 Shady Ln Dr	\N	Sacramento	98652	2018-08-02 13:52:31.805549+02	\N
739	739	\N	\N	9414 Tahmelantie	\N	Juupajoki	91396	2018-08-02 13:52:31.805549+02	\N
740	740	\N	\N	9364 Moreelsepark	\N	Utrecht	36869	2018-08-02 13:52:31.805549+02	\N
741	741	\N	\N	9229 Place De L'Abbé-Basset	\N	Nufenen	9642	2018-08-02 13:52:31.805549+02	\N
742	742	\N	\N	Jahnstraße 189	\N	Annaberg-Buchholz	48527	2018-08-02 13:52:31.805549+02	\N
743	743	\N	\N	7531 Agertoften	\N	Esbjerg V	11942	2018-08-02 13:52:31.805549+02	\N
744	744	\N	\N	5389 Rua Duque De Caxias 	\N	Rondonópolis	50374	2018-08-02 13:52:31.805549+02	\N
745	745	\N	\N	2540 Alexander Numankade	\N	Rijnwaarden	31246	2018-08-02 13:52:31.805549+02	\N
746	746	\N	\N	6696 Rue Bossuet	\N	Bätterkinden	7752	2018-08-02 13:52:31.805549+02	\N
747	747	\N	\N	3108 Place De L'Abbé-Georges-Hénocque	\N	Steinach	4127	2018-08-02 13:52:31.805549+02	\N
748	748	\N	\N	575 Elgin St	\N	Bathurst	3186	2018-08-02 13:52:31.805549+02	\N
749	749	\N	\N	3337 Færøvej	\N	Argerskov	24294	2018-08-02 13:52:31.805549+02	\N
750	750	\N	\N	3842 Aleksanterinkatu	\N	Närpes	11389	2018-08-02 13:52:31.805549+02	\N
751	751	\N	\N	3666 Lakeview St	\N	Newark	97164	2018-08-02 13:52:31.805549+02	\N
752	752	\N	\N	4637 Rua Carlos Gomes	\N	Cabo De Santo Agostinho	77628	2018-08-02 13:52:31.805549+02	\N
753	753	\N	\N	2279 Avenue Vauban	\N	Läufelfingen	7638	2018-08-02 13:52:31.805549+02	\N
754	754	\N	\N	2971 Stærevej	\N	Nykøbing F	37715	2018-08-02 13:52:31.805549+02	\N
755	755	\N	\N	7441 Dogwood Ave	\N	Nowra	1546	2018-08-02 13:52:31.805549+02	\N
756	756	\N	\N	9054 Rua Quinze De Novembro 	\N	Valparaíso De Goiás	68446	2018-08-02 13:52:31.805549+02	\N
757	757	\N	\N	3813 Homestead Rd	\N	Maitland	8494	2018-08-02 13:52:31.805549+02	\N
758	758	\N	\N	120 Calle De Bravo Murillo	\N	Vitoria	74099	2018-08-02 13:52:31.805549+02	\N
759	759	\N	\N	Burgstraße 82	\N	Coesfeld	96944	2018-08-02 13:52:31.805549+02	\N
760	760	\N	\N	3047 Albert Road	\N	Preston	K74 2JF	2018-08-02 13:52:31.805549+02	\N
761	761	\N	\N	3592 Avenue Vauban	\N	Gelterfingen	4244	2018-08-02 13:52:31.805549+02	\N
762	762	\N	\N	987 Timber Wolf Trail	\N	Toowoomba	351	2018-08-02 13:52:31.805549+02	\N
763	763	\N	\N	4951 Mcclellan Rd	\N	Reno	98826	2018-08-02 13:52:31.805549+02	\N
764	764	\N	\N	7785 Railroad St	\N	Desoto	45134	2018-08-02 13:52:31.805549+02	\N
765	765	\N	\N	Fasanenweg 64	\N	Neu-Isenburg	18322	2018-08-02 13:52:31.805549+02	\N
766	766	\N	\N	8259 E Sandy Lake Rd	\N	Jacksonville	15246	2018-08-02 13:52:31.805549+02	\N
767	767	\N	\N	8935 Calle Del Pez	\N	Albacete	43791	2018-08-02 13:52:31.805549+02	\N
768	768	\N	\N	341 Rectory Lane	\N	Chester	S4S 2ET	2018-08-02 13:52:31.805549+02	\N
769	769	\N	\N	1921 Rue Paul-Duvivier	\N	Finsterhennen	6549	2018-08-02 13:52:31.805549+02	\N
770	770	\N	\N	6503 Rue De L'Abbé-Roger-Derry	\N	Gurtnellen	8666	2018-08-02 13:52:31.805549+02	\N
771	771	\N	\N	2291 F.C. Dondersstraat	\N	Zoeterwoude	28830	2018-08-02 13:52:31.805549+02	\N
772	772	\N	\N	7364 Suvantokatu	\N	Isojoki	33126	2018-08-02 13:52:31.805549+02	\N
773	773	\N	\N	7615 Miller Ave	\N	Arlington	55810	2018-08-02 13:52:31.805549+02	\N
774	774	\N	\N	3057 Calle De La Democracia	\N	Vitoria	36797	2018-08-02 13:52:31.805549+02	\N
775	775	\N	\N	3815 Taylor St	\N	Bathurst	2853	2018-08-02 13:52:31.805549+02	\N
776	776	\N	\N	605 Veeartsenij-Pad	\N	Bunnik	52358	2018-08-02 13:52:31.805549+02	\N
777	777	\N	\N	1474 Verkatehtaankatu	\N	Kempele	97425	2018-08-02 13:52:31.805549+02	\N
778	778	\N	\N	3425 Beco Dos Namorados	\N	Corumbá	86097	2018-08-02 13:52:31.805549+02	\N
779	779	\N	\N	Ringstraße 8	\N	Rheinfelden (Baden)	71808	2018-08-02 13:52:31.805549+02	\N
780	780	\N	\N	9046 Hjulets Kvarter	\N	Stenderup	99138	2018-08-02 13:52:31.805549+02	\N
781	781	\N	\N	5801 Egehegnet	\N	Randers Nv	67855	2018-08-02 13:52:31.805549+02	\N
782	782	\N	\N	9435 Pyynikintie	\N	Malax	84220	2018-08-02 13:52:31.805549+02	\N
783	783	\N	\N	Wiesenweg 194	\N	Laage	64597	2018-08-02 13:52:31.805549+02	\N
784	784	\N	\N	2849 Rue Dumenge	\N	Niederhasli	8923	2018-08-02 13:52:31.805549+02	\N
785	785	\N	\N	8585 Brick Kiln Road	\N	St Davids	EI2K 7PL	2018-08-02 13:52:31.805549+02	\N
786	786	\N	\N	9064 Park Lane	\N	Leeds	ZZ0 8ST	2018-08-02 13:52:31.805549+02	\N
787	787	\N	\N	7211 Wijde Begijnestraat	\N	Delft	87677	2018-08-02 13:52:31.805549+02	\N
788	788	\N	\N	Parkstraße 147	\N	Kiel	79128	2018-08-02 13:52:31.805549+02	\N
789	789	\N	\N	9010 Calle De Bravo Murillo	\N	Córdoba	13170	2018-08-02 13:52:31.805549+02	\N
790	790	\N	\N	Lindenweg 33	\N	Biedenkopf	55207	2018-08-02 13:52:31.805549+02	\N
791	791	\N	\N	4022 Nobeldwarsstraat	\N	Wormerland	41299	2018-08-02 13:52:31.805549+02	\N
792	792	\N	\N	8794 Rosenhaven	\N	Klitmøller	94611	2018-08-02 13:52:31.805549+02	\N
793	793	\N	\N	4751 Oaks Cross	\N	Wolverhampton	FB3 0HH	2018-08-02 13:52:31.805549+02	\N
794	794	\N	\N	Dorfstraße 135	\N	Germersheim	53563	2018-08-02 13:52:31.805549+02	\N
795	795	\N	\N	5826 James St	\N	Darwin	3215	2018-08-02 13:52:31.805549+02	\N
796	796	\N	\N	6601 Stadionlaan	\N	Dinkelland	99222	2018-08-02 13:52:31.805549+02	\N
797	797	\N	\N	Gartenstraße 15	\N	Hamm	58035	2018-08-02 13:52:31.805549+02	\N
798	798	\N	\N	2284 Robinson Rd	\N	Cape Fear	62683	2018-08-02 13:52:31.805549+02	\N
799	799	\N	\N	6486 Rue De La Barre	\N	Oberegg	3839	2018-08-02 13:52:31.805549+02	\N
800	800	\N	\N	9173 New Road	\N	Chichester	Y4 3GA	2018-08-02 13:52:31.805549+02	\N
801	801	\N	\N	4370 Pirkankatu	\N	Kustavi	63908	2018-08-02 13:52:31.805549+02	\N
802	802	\N	\N	2820 Avenue Debourg	\N	Matzingen	6638	2018-08-02 13:52:31.805549+02	\N
803	803	\N	\N	4113 Grange Road	\N	Preston	R2C 2YA	2018-08-02 13:52:31.805549+02	\N
804	804	\N	\N	4372 Hvedemarken	\N	Ryslinge	13734	2018-08-02 13:52:31.805549+02	\N
805	805	\N	\N	3646 Aastrupvej	\N	Agerbæk	18682	2018-08-02 13:52:31.805549+02	\N
806	806	\N	\N	4817 Strandgårdsvej	\N	Frederiksberg	99180	2018-08-02 13:52:31.805549+02	\N
807	807	\N	\N	7045 Avenida De Salamanca	\N	Toledo	35648	2018-08-02 13:52:31.805549+02	\N
808	808	\N	\N	9129 Møllevænget	\N	Silkeboeg	97338	2018-08-02 13:52:31.805549+02	\N
809	809	\N	\N	2199 The Green	\N	Manchester	FG02 0TT	2018-08-02 13:52:31.805549+02	\N
810	810	\N	\N	2398 Bulevardi	\N	Lumijoki	90191	2018-08-02 13:52:31.805549+02	\N
811	811	\N	\N	9612 Bollinger Rd	\N	Albury	8952	2018-08-02 13:52:31.805549+02	\N
812	812	\N	\N	3849 Dorstige Hartsteeg	\N	Schinnen	72722	2018-08-02 13:52:31.805549+02	\N
813	813	\N	\N	5123 Rua Santa Catarina 	\N	Americana	24027	2018-08-02 13:52:31.805549+02	\N
814	814	\N	\N	3554 Gammel Skolevej	\N	Ølstykke	68509	2018-08-02 13:52:31.805549+02	\N
815	815	\N	\N	3333 Lakeview St	\N	Woodbridge	30131	2018-08-02 13:52:31.805549+02	\N
816	816	\N	\N	6271 Harrison Ct	\N	Bendigo	759	2018-08-02 13:52:31.805549+02	\N
817	817	\N	\N	432 Nobeldwarsstraat	\N	Waddinxveen	25863	2018-08-02 13:52:31.805549+02	\N
818	818	\N	\N	8461 Edwards Rd	\N	Norfolk	32246	2018-08-02 13:52:31.805549+02	\N
819	819	\N	\N	17 Stadion Alle	\N	Oure	29588	2018-08-02 13:52:31.805549+02	\N
820	820	\N	\N	6959 Rue De La Mairie	\N	Buchberg	7797	2018-08-02 13:52:31.805549+02	\N
821	821	\N	\N	1499 Rue Dumenge	\N	Quinto	6034	2018-08-02 13:52:31.805549+02	\N
822	822	\N	\N	8423 North Road	\N	Salisbury	U90 4LJ	2018-08-02 13:52:31.805549+02	\N
823	823	\N	\N	Lindenweg 155	\N	Spree-Neiße	14885	2018-08-02 13:52:31.805549+02	\N
824	824	\N	\N	2747 Dronningensgade	\N	Kongens  Lyngby	42234	2018-08-02 13:52:31.805549+02	\N
825	825	\N	\N	3948 Rue Du Bon-Pasteur	\N	Meilen	9948	2018-08-02 13:52:31.805549+02	\N
826	826	\N	\N	7226 Place De La Mairie	\N	Loveresse	3612	2018-08-02 13:52:31.805549+02	\N
827	827	\N	\N	1205 Rue Gasparin	\N	Kaltbrunn	7938	2018-08-02 13:52:31.805549+02	\N
828	828	\N	\N	5966 Fairview Road	\N	Sheffield	PH6 7JE	2018-08-02 13:52:31.805549+02	\N
829	829	\N	\N	8211 Rua Vinte De Setembro	\N	Guarapuava	18622	2018-08-02 13:52:31.805549+02	\N
830	830	\N	\N	1747 Rua Vinte E Dois 	\N	Ribeirão Das Neves	15214	2018-08-02 13:52:31.805549+02	\N
831	831	\N	\N	6256 Haderslevvej	\N	Nykøbing Sj.	46395	2018-08-02 13:52:31.805549+02	\N
832	832	\N	\N	1773 Chester Road	\N	Sunderland	HR6F 1DT	2018-08-02 13:52:31.805549+02	\N
833	833	\N	\N	9297 Parker Rd	\N	Launceston	7383	2018-08-02 13:52:31.805549+02	\N
834	834	\N	\N	9355 Rautatienkatu	\N	Köyliö	13727	2018-08-02 13:52:31.805549+02	\N
835	835	\N	\N	5707 Paseo De Zorrilla	\N	Murcia	25604	2018-08-02 13:52:31.805549+02	\N
836	836	\N	\N	6877 Rue Saint-Georges	\N	Rottenschwil	5850	2018-08-02 13:52:31.805549+02	\N
837	837	\N	\N	3445 James St	\N	Mobile	68892	2018-08-02 13:52:31.805549+02	\N
838	838	\N	\N	7629 Egeskovvej	\N	København V	90774	2018-08-02 13:52:31.805549+02	\N
839	839	\N	\N	Ringstraße 54	\N	Oppenheim	43118	2018-08-02 13:52:31.805549+02	\N
840	840	\N	\N	158 Blossom Hill Rd	\N	Downey	54342	2018-08-02 13:52:31.805549+02	\N
841	841	\N	\N	8063 West Street	\N	Dundee	SL6 5SD	2018-08-02 13:52:31.805549+02	\N
842	842	\N	\N	656 Wulpstraat	\N	Mill En Sint Hubert	59508	2018-08-02 13:52:31.805549+02	\N
843	843	\N	\N	5298 Stadsbuitengracht	\N	Westland	63322	2018-08-02 13:52:31.805549+02	\N
844	844	\N	\N	1140 Fynsgade	\N	Kvistgaard	84466	2018-08-02 13:52:31.805549+02	\N
845	845	\N	\N	Römerstraße 157	\N	Trebsen/Mulde	26871	2018-08-02 13:52:31.805549+02	\N
846	846	\N	\N	1194 Highfield Road	\N	Southampton	ZI0 3LN	2018-08-02 13:52:31.805549+02	\N
847	847	\N	\N	6685 W 6th St	\N	Shepparton	3075	2018-08-02 13:52:31.805549+02	\N
848	848	\N	\N	6869 Samaritan Dr	\N	Sydney	2178	2018-08-02 13:52:31.805549+02	\N
849	849	\N	\N	206 Kingsway	\N	Westminster	DT6 8LZ	2018-08-02 13:52:31.805549+02	\N
850	850	\N	\N	2292 Photinia Ave	\N	Gresham	29814	2018-08-02 13:52:31.805549+02	\N
851	851	\N	\N	9205 Satakennankatu	\N	Taivassalo	21952	2018-08-02 13:52:31.805549+02	\N
852	852	\N	\N	6536 E Pecan St	\N	West Jordan	97996	2018-08-02 13:52:31.805549+02	\N
853	853	\N	\N	781 Rue Bataille	\N	Nenzlingen	4049	2018-08-02 13:52:31.805549+02	\N
854	854	\N	\N	251 W Belt Line Rd	\N	Gladstone	1417	2018-08-02 13:52:31.805549+02	\N
855	855	\N	\N	548 Samaritan Dr	\N	Thousand Oaks	54998	2018-08-02 13:52:31.805549+02	\N
856	856	\N	\N	1008 Hermiankatu	\N	Sottunga	20936	2018-08-02 13:52:31.805549+02	\N
857	857	\N	\N	4916 Sterrenburg	\N	Coevorden	42575	2018-08-02 13:52:31.805549+02	\N
858	858	\N	\N	9799 Avenue Jean-Jaurès	\N	Härkingen	2139	2018-08-02 13:52:31.805549+02	\N
859	859	\N	\N	4286 North Street	\N	Stevenage	IG7 4RP	2018-08-02 13:52:31.805549+02	\N
860	860	\N	\N	1634 Calle Del Arenal	\N	Vitoria	19600	2018-08-02 13:52:31.805549+02	\N
861	861	\N	\N	5329 Servetstraat	\N	Vianen	12926	2018-08-02 13:52:31.805549+02	\N
862	862	\N	\N	3299 Adriaen Van Ostadelaan	\N	Deventer	48692	2018-08-02 13:52:31.805549+02	\N
863	863	\N	\N	9138 Calle De La Democracia	\N	Torrevieja	41867	2018-08-02 13:52:31.805549+02	\N
864	864	\N	\N	7266 Calle De Alberto Aguilera	\N	Torrente	41029	2018-08-02 13:52:31.805549+02	\N
865	865	\N	\N	7485 W Campbell Ave	\N	Jacksonville	13284	2018-08-02 13:52:31.805549+02	\N
866	866	\N	\N	3579 W Campbell Ave	\N	Red Bluff	54500	2018-08-02 13:52:31.805549+02	\N
867	867	\N	\N	7065 Rua Principal	\N	Aracaju	56176	2018-08-02 13:52:31.805549+02	\N
868	868	\N	\N	6017 The Crescent	\N	Chester	LG41 5WZ	2018-08-02 13:52:31.805549+02	\N
869	869	\N	\N	Bachstraße 17	\N	Bonn	89395	2018-08-02 13:52:31.805549+02	\N
870	870	\N	\N	Kirchgasse 160	\N	Tengen	67525	2018-08-02 13:52:31.805549+02	\N
871	871	\N	\N	1080 Rua José Bonifácio 	\N	Castanhal	75492	2018-08-02 13:52:31.805549+02	\N
872	872	\N	\N	Friedhofstraße 8	\N	Herzogenaurach	14869	2018-08-02 13:52:31.805549+02	\N
873	873	\N	\N	5357 Vesterhavsvej	\N	V.Skerninge	73020	2018-08-02 13:52:31.805549+02	\N
874	874	\N	\N	2087 Apollovej	\N	Rødvig Stevns	66856	2018-08-02 13:52:31.805549+02	\N
875	875	\N	\N	8896 Pirkankatu	\N	Janakkala	45448	2018-08-02 13:52:31.805549+02	\N
876	876	\N	\N	1897 Rue De L'Abbé-Grégoire	\N	Wallbach	3238	2018-08-02 13:52:31.805549+02	\N
877	877	\N	\N	729 Nørrebro	\N	Billum	51906	2018-08-02 13:52:31.805549+02	\N
878	878	\N	\N	5843 Søndergade	\N	Frederiksberg	83052	2018-08-02 13:52:31.805549+02	\N
879	879	\N	\N	8524 Rua Pernambuco 	\N	Campos Dos Goytacazes	25364	2018-08-02 13:52:31.805549+02	\N
880	880	\N	\N	1208 Timber Wolf Trail	\N	Huntington Beach	37479	2018-08-02 13:52:31.805549+02	\N
881	881	\N	\N	8890 White Oak Dr	\N	Sunshine Coast	7626	2018-08-02 13:52:31.805549+02	\N
882	882	\N	\N	7825 Pockrus Page Rd	\N	Ironville	25718	2018-08-02 13:52:31.805549+02	\N
883	883	\N	\N	Jahnstraße 163	\N	Burghausen	59253	2018-08-02 13:52:31.805549+02	\N
884	884	\N	\N	6088 Næstvedvej	\N	Roslev	46190	2018-08-02 13:52:31.805549+02	\N
885	885	\N	\N	8065 Place De L'Europe	\N	Rüschlikon	6560	2018-08-02 13:52:31.805549+02	\N
886	886	\N	\N	6131 Villavej	\N	Randers Nv	53905	2018-08-02 13:52:31.805549+02	\N
887	887	\N	\N	4705 Bruce St	\N	Sydney	7105	2018-08-02 13:52:31.805549+02	\N
888	888	\N	\N	45 Mockingbird Hill	\N	Richmond	17018	2018-08-02 13:52:31.805549+02	\N
889	889	\N	\N	9422 Kanaalweg	\N	Beverwijk	59790	2018-08-02 13:52:31.805549+02	\N
890	890	\N	\N	389 Hickory Creek Dr	\N	Albury	4574	2018-08-02 13:52:31.805549+02	\N
891	891	\N	\N	7415 Beco Dos Namorados	\N	Jaraguá Do Sul	49409	2018-08-02 13:52:31.805549+02	\N
892	892	\N	\N	9579 Springfield Road	\N	Chester	LF3F 7RP	2018-08-02 13:52:31.805549+02	\N
893	893	\N	\N	Ringstraße 73	\N	Brück	65828	2018-08-02 13:52:31.805549+02	\N
894	894	\N	\N	297 Fincher Rd	\N	Darwin	606	2018-08-02 13:52:31.805549+02	\N
895	895	\N	\N	8378 Slagelsevej	\N	Agerbæk	88936	2018-08-02 13:52:31.805549+02	\N
896	896	\N	\N	Eichenweg 168	\N	Waldkappel	63953	2018-08-02 13:52:31.805549+02	\N
897	897	\N	\N	2649 Parcelvej	\N	Århus C.	91426	2018-08-02 13:52:31.805549+02	\N
898	898	\N	\N	6079 Adelgade	\N	Askeby	43035	2018-08-02 13:52:31.805549+02	\N
899	899	\N	\N	3130 Spring St	\N	Hampton	88007	2018-08-02 13:52:31.805549+02	\N
900	900	\N	\N	6226 Crockett St	\N	Elizabeth	54906	2018-08-02 13:52:31.805549+02	\N
901	901	\N	\N	6746 Dalgårdsvej	\N	Snertinge	92456	2018-08-02 13:52:31.805549+02	\N
902	902	\N	\N	4102 Calle De Arganzuela	\N	Orihuela	97746	2018-08-02 13:52:31.805549+02	\N
903	903	\N	\N	700 Mosegårdsvej	\N	Silkeboeg	39464	2018-08-02 13:52:31.805549+02	\N
904	904	\N	\N	3523 Leidseveer	\N	Beverwijk	23795	2018-08-02 13:52:31.805549+02	\N
905	905	\N	\N	6711 Bygvænget	\N	Jerslev Sj	83441	2018-08-02 13:52:31.805549+02	\N
906	906	\N	\N	259 Reijolankatu	\N	Puumala	28429	2018-08-02 13:52:31.805549+02	\N
907	907	\N	\N	7650 Camden Ave	\N	Geraldton	9430	2018-08-02 13:52:31.805549+02	\N
908	908	\N	\N	3278 Avenue Goerges Clémenceau	\N	Degersheim	2640	2018-08-02 13:52:31.805549+02	\N
909	909	\N	\N	6068 Rua São Pedro 	\N	Barreiras	17477	2018-08-02 13:52:31.805549+02	\N
910	910	\N	\N	5028 Grove Road	\N	Stevenage	YG55 4ZA	2018-08-02 13:52:31.805549+02	\N
911	911	\N	\N	1046 Myllypuronkatu	\N	Honkajoki	20673	2018-08-02 13:52:31.805549+02	\N
912	912	\N	\N	3918 Skovduevej	\N	Nykøbing Sj.	29131	2018-08-02 13:52:31.805549+02	\N
913	913	\N	\N	2793 Rautatienkatu	\N	Hattula	12665	2018-08-02 13:52:31.805549+02	\N
914	914	\N	\N	5782 E Center St	\N	Indianapolis	83092	2018-08-02 13:52:31.805549+02	\N
915	915	\N	\N	Danziger Straße 124	\N	Rabenau	27440	2018-08-02 13:52:31.805549+02	\N
916	916	\N	\N	2643 Burgemeester Reigerstraat	\N	Bergen	57865	2018-08-02 13:52:31.805549+02	\N
917	917	\N	\N	2417 Suvantokatu	\N	Kangasniemi	14819	2018-08-02 13:52:31.805549+02	\N
918	918	\N	\N	2254 Lyngevej	\N	København Sv	66060	2018-08-02 13:52:31.805549+02	\N
919	919	\N	\N	7852 Victoria Road	\N	Worcester	PA0 9AF	2018-08-02 13:52:31.805549+02	\N
920	920	\N	\N	9818 Avenida De Salamanca	\N	Cuenca	57242	2018-08-02 13:52:31.805549+02	\N
921	921	\N	\N	4502 Avenida De América	\N	Sevilla	98741	2018-08-02 13:52:31.805549+02	\N
922	922	\N	\N	3038 Calle De Téllez	\N	Cuenca	32195	2018-08-02 13:52:31.805549+02	\N
923	923	\N	\N	Kapellenweg 96	\N	Wanfried	10716	2018-08-02 13:52:31.805549+02	\N
924	924	\N	\N	3051 Rue De L'Abbé-Groult	\N	Herznach	1859	2018-08-02 13:52:31.805549+02	\N
925	925	\N	\N	4264 Blichersvej	\N	Billum	98160	2018-08-02 13:52:31.805549+02	\N
926	926	\N	\N	5072 Tahmelantie	\N	Puumala	63228	2018-08-02 13:52:31.805549+02	\N
927	927	\N	\N	2836 Rua Dom Pedro Ii 	\N	São José Dos Pinhais	57612	2018-08-02 13:52:31.805549+02	\N
928	928	\N	\N	7895 Calle De Tetuán	\N	Murcia	79722	2018-08-02 13:52:31.805549+02	\N
929	929	\N	\N	Erlenweg 108	\N	Bad Berka	88288	2018-08-02 13:52:31.805549+02	\N
930	930	\N	\N	3206 Rua Santa Rita 	\N	Alagoinhas	39153	2018-08-02 13:52:31.805549+02	\N
931	931	\N	\N	1027 Mechelininkatu	\N	Myrskylä	29102	2018-08-02 13:52:31.805549+02	\N
932	932	\N	\N	3840 Queen Street	\N	Liverpool	WI0V 5DL	2018-08-02 13:52:31.805549+02	\N
933	933	\N	\N	4427 Herredsvej	\N	Aarhus N	19765	2018-08-02 13:52:31.805549+02	\N
934	934	\N	\N	8008 Forest Ln	\N	North Charleston	37611	2018-08-02 13:52:31.805549+02	\N
935	935	\N	\N	1856 Main Road	\N	Chichester	ER1I 2EL	2018-08-02 13:52:31.805549+02	\N
936	936	\N	\N	1918 Rua São Pedro 	\N	Jequié	39929	2018-08-02 13:52:31.805549+02	\N
937	937	\N	\N	9008 Dronningensgade	\N	Snertinge	28824	2018-08-02 13:52:31.805549+02	\N
938	938	\N	\N	Uhlandstraße 197	\N	Liebenwalde	52092	2018-08-02 13:52:31.805549+02	\N
939	939	\N	\N	4637 Bollinger Rd	\N	Perth	9767	2018-08-02 13:52:31.805549+02	\N
940	940	\N	\N	6534 Marsh Ln	\N	Maitland	9966	2018-08-02 13:52:31.805549+02	\N
941	941	\N	\N	2985 Grøndalsvej	\N	Ansager	55606	2018-08-02 13:52:31.805549+02	\N
942	942	\N	\N	3725 Hermiankatu	\N	Kannonkoski	92599	2018-08-02 13:52:31.805549+02	\N
943	943	\N	\N	9901 Pirkankatu	\N	Kalajoki	68796	2018-08-02 13:52:31.805549+02	\N
944	944	\N	\N	2584 Syrenvej	\N	Gørløse	86571	2018-08-02 13:52:31.805549+02	\N
945	945	\N	\N	1321 Otavalankatu	\N	Hanko	50440	2018-08-02 13:52:31.805549+02	\N
946	946	\N	\N	5763 First Street	\N	Australian Capital Territory	9390	2018-08-02 13:52:31.805549+02	\N
947	947	\N	\N	8110 Rua Maranhão 	\N	Caraguatatuba	92373	2018-08-02 13:52:31.805549+02	\N
948	948	\N	\N	9302 Ronda De Toledo	\N	Vigo	17664	2018-08-02 13:52:31.805549+02	\N
949	949	\N	\N	5869 Rua São Pedro 	\N	Betim	69288	2018-08-02 13:52:31.805549+02	\N
950	950	\N	\N	9937 Grande Rue	\N	Schlosswil	8125	2018-08-02 13:52:31.805549+02	\N
951	951	\N	\N	4040 Visiokatu	\N	Miehikkälä	41085	2018-08-02 13:52:31.805549+02	\N
952	952	\N	\N	607 Avenue Des Ternes	\N	Eppenberg-Wöschnau	8699	2018-08-02 13:52:31.805549+02	\N
953	953	\N	\N	1285 Rua Vinte E Um	\N	Novo Hamburgo	76229	2018-08-02 13:52:31.805549+02	\N
954	954	\N	\N	7137 Myllypuronkatu	\N	Jakobstad	66193	2018-08-02 13:52:31.805549+02	\N
955	955	\N	\N	8804 Hamilton Ave	\N	Bundaberg	3410	2018-08-02 13:52:31.805549+02	\N
956	956	\N	\N	4629 Saddle Dr	\N	Pompano Beach	55478	2018-08-02 13:52:31.805549+02	\N
957	957	\N	\N	2143 E Center St	\N	Geelong	5694	2018-08-02 13:52:31.805549+02	\N
958	958	\N	\N	6398 Vejlevej	\N	Randers Nv	77731	2018-08-02 13:52:31.805549+02	\N
959	959	\N	\N	6985 Rua Boa Vista 	\N	Balneário Camboriú	96500	2018-08-02 13:52:31.805549+02	\N
960	960	\N	\N	989 Rue Louis-Garrand	\N	Hinterrhein	5049	2018-08-02 13:52:31.805549+02	\N
961	961	\N	\N	Kastanienweg 128	\N	Schierbrok	86714	2018-08-02 13:52:31.805549+02	\N
975	975	\N	\N	Schlossstraße 101	\N	Rüthen	46984	2018-08-02 13:52:31.805549+02	\N
962	962	\N	\N	4539 Green Lane	\N	Nottingham	U3P 7WU	2018-08-02 13:52:31.805549+02	\N
963	963	\N	\N	1174 Rue Bossuet	\N	Montet (Glâne)	2406	2018-08-02 13:52:31.805549+02	\N
964	964	\N	\N	2343 Kildebakken	\N	Viby Sj.	55598	2018-08-02 13:52:31.805549+02	\N
965	965	\N	\N	466 Avenida De Salamanca	\N	Cartagena	90487	2018-08-02 13:52:31.805549+02	\N
966	966	\N	\N	441 Mechelininkatu	\N	Haapajärvi	36816	2018-08-02 13:52:31.805549+02	\N
967	967	\N	\N	7721 Rua Doze 	\N	Linhares	79278	2018-08-02 13:52:31.805549+02	\N
968	968	\N	\N	7740 Itsenäisyydenkatu	\N	Lohja	15815	2018-08-02 13:52:31.805549+02	\N
969	969	\N	\N	6657 Hatanpään Valtatie	\N	Tornio	45409	2018-08-02 13:52:31.805549+02	\N
970	970	\N	\N	2597 Mølleparken	\N	Nørre Sundby	33729	2018-08-02 13:52:31.805549+02	\N
971	971	\N	\N	2226 Pyynikintie	\N	Kauniainen	33217	2018-08-02 13:52:31.805549+02	\N
972	972	\N	\N	3946 Avenida Vinícius De Morais	\N	Camaçari	80404	2018-08-02 13:52:31.805549+02	\N
973	973	\N	\N	1708 Mcgowen St	\N	Costa Mesa	21789	2018-08-02 13:52:31.805549+02	\N
974	974	\N	\N	7604 Lucasbolwerk	\N	Lisse	53503	2018-08-02 13:52:31.805549+02	\N
976	976	\N	\N	212 Boulevard De La Duchère	\N	Seedorf (Be)	9888	2018-08-02 13:52:31.805549+02	\N
977	977	\N	\N	Erlenweg 41	\N	Niesky	24986	2018-08-02 13:52:31.805549+02	\N
978	978	\N	\N	6659 Korkeavuorenkatu	\N	Hämeenlinna	20582	2018-08-02 13:52:31.805549+02	\N
979	979	\N	\N	1380 The Grove	\N	Worcester	WB48 7NE	2018-08-02 13:52:31.805549+02	\N
980	980	\N	\N	4892 Avondale Ave	\N	Sydney	9973	2018-08-02 13:52:31.805549+02	\N
981	981	\N	\N	1351 Oosterkade	\N	Losser	85794	2018-08-02 13:52:31.805549+02	\N
982	982	\N	\N	6665 Nobelstraat	\N	Hendrik-Ido-Ambacht	50844	2018-08-02 13:52:31.805549+02	\N
983	983	\N	\N	8945 Parker Rd	\N	Clarksville	57450	2018-08-02 13:52:31.805549+02	\N
984	984	\N	\N	5106 Avenue Tony-Garnier	\N	Porrentruy	9265	2018-08-02 13:52:31.805549+02	\N
985	985	\N	\N	7950 Lichte Gaard	\N	Amersfoort	54352	2018-08-02 13:52:31.805549+02	\N
986	986	\N	\N	2163 Church Lane	\N	Salford	P3X 7JD	2018-08-02 13:52:31.805549+02	\N
987	987	\N	\N	9756 Lange Nieuwstraat	\N	Ameland	41566	2018-08-02 13:52:31.805549+02	\N
988	988	\N	\N	7420 Rua Castro Alves 	\N	Sete Lagoas	64895	2018-08-02 13:52:31.805549+02	\N
989	989	\N	\N	2794 Avenida De Salamanca	\N	Bilbao	75146	2018-08-02 13:52:31.805549+02	\N
990	990	\N	\N	7506 Rua São Jorge 	\N	Poços De Caldas	30217	2018-08-02 13:52:31.805549+02	\N
991	991	\N	\N	6001 Bruce St	\N	Albury	8183	2018-08-02 13:52:31.805549+02	\N
992	992	\N	\N	4103 Robinson Rd	\N	Athens	29164	2018-08-02 13:52:31.805549+02	\N
993	993	\N	\N	Danziger Straße 199	\N	Wörth An Der Donau	45364	2018-08-02 13:52:31.805549+02	\N
994	994	\N	\N	8701 Brogårdsvej	\N	Sørvad	58940	2018-08-02 13:52:31.805549+02	\N
995	995	\N	\N	7727 Marsh Ln	\N	Townsville	8047	2018-08-02 13:52:31.805549+02	\N
996	996	\N	\N	3838 Main Street	\N	Winchester	BN3I 2HT	2018-08-02 13:52:31.805549+02	\N
997	997	\N	\N	2392 Richmond Road	\N	St Davids	AJ0 0FT	2018-08-02 13:52:31.805549+02	\N
998	998	\N	\N	6961 Rua Três	\N	Fortaleza	40718	2018-08-02 13:52:31.805549+02	\N
999	999	\N	\N	Eichenweg 46	\N	Dömitz	22637	2018-08-02 13:52:31.805549+02	\N
1000	1000	\N	\N	6797 Lakeview St	\N	Bendigo	8934	2018-08-02 13:52:31.805549+02	\N
1001	1001	\N	\N	5547 Calle Nebrija	\N	Gandía	93162	2018-08-02 13:52:31.805549+02	\N
1002	1002	\N	\N	2522 Kings Road	\N	Lincoln	JP1Y 3US	2018-08-02 13:52:31.805549+02	\N
1003	1003	\N	\N	330 Fredrikinkatu	\N	Ikaalinen	99375	2018-08-02 13:52:31.805549+02	\N
1004	1004	\N	\N	9985 Place Paul-Duquaire	\N	Jenaz	3903	2018-08-02 13:52:31.805549+02	\N
1005	1005	\N	\N	8273 Gasthuisstraat	\N	Aa En Hunze	94494	2018-08-02 13:52:31.805549+02	\N
1006	1006	\N	\N	7603 Grove Road	\N	Plymouth	KY4P 3DN	2018-08-02 13:52:31.805549+02	\N
1007	1007	\N	\N	5622 Rotuaari	\N	Laitila	36703	2018-08-02 13:52:31.805549+02	\N
1008	1008	\N	\N	Schützenstraße 134	\N	Neustadt In Sachsen	58263	2018-08-02 13:52:31.805549+02	\N
1009	1009	\N	\N	6571 Elgin St	\N	Jackson	53539	2018-08-02 13:52:31.805549+02	\N
1010	1010	\N	\N	3003 Calle De Alberto Aguilera	\N	Sevilla	19150	2018-08-02 13:52:31.805549+02	\N
1011	1011	\N	\N	8686 Catharijnekade	\N	Leiderdorp	45652	2018-08-02 13:52:31.805549+02	\N
1012	1012	\N	\N	3911 Calle De Téllez	\N	Valladolid	46074	2018-08-02 13:52:31.805549+02	\N
1013	1013	\N	\N	Poststraße 43	\N	Bacharach	77586	2018-08-02 13:52:31.805549+02	\N
1014	1014	\N	\N	Fasanenweg 147	\N	Drebkau	15269	2018-08-02 13:52:31.805549+02	\N
1015	1015	\N	\N	7276 Catharijnesingel	\N	Horst Aan De Maas	23867	2018-08-02 13:52:31.805549+02	\N
1016	1016	\N	\N	3916 E Little York Rd	\N	Devonport	7747	2018-08-02 13:52:31.805549+02	\N
1017	1017	\N	\N	6844 Rotuaari	\N	Hyrynsalmi	15533	2018-08-02 13:52:31.805549+02	\N
1018	1018	\N	\N	4043 Paddock Way	\N	Melbourne	5422	2018-08-02 13:52:31.805549+02	\N
1019	1019	\N	\N	8093 Dalstrøget	\N	Øster Assels	58866	2018-08-02 13:52:31.805549+02	\N
1020	1020	\N	\N	8919 Houtensepad	\N	Lingewaal	98844	2018-08-02 13:52:31.805549+02	\N
1021	1021	\N	\N	4744 Stevens Creek Blvd	\N	Scurry	62084	2018-08-02 13:52:31.805549+02	\N
1022	1022	\N	\N	4779 Rua Da Saudade	\N	Arapongas	25313	2018-08-02 13:52:31.805549+02	\N
1023	1023	\N	\N	7723 Bulevardi	\N	Pieksämäki	87072	2018-08-02 13:52:31.805549+02	\N
1024	1024	\N	\N	7360 Paseo De Extremadura	\N	Las Palmas De Gran Canaria	60639	2018-08-02 13:52:31.805549+02	\N
1025	1025	\N	\N	8098 Rue De La Fontaine	\N	Aegerten	8443	2018-08-02 13:52:31.805549+02	\N
1026	1026	\N	\N	Königsberger Straße 169	\N	Gronau (Westf.)	31005	2018-08-02 13:52:31.805549+02	\N
1027	1027	\N	\N	1715 Fredrikinkatu	\N	Nastola	65962	2018-08-02 13:52:31.805549+02	\N
1028	1028	\N	\N	1300 Westheimer Rd	\N	Garland	86429	2018-08-02 13:52:31.805549+02	\N
1029	1029	\N	\N	Bachstraße 133	\N	Dingolfing-Landau	27175	2018-08-02 13:52:31.805549+02	\N
1030	1030	\N	\N	3476 Rua Paraíba 	\N	Santo André	76242	2018-08-02 13:52:31.805549+02	\N
1031	1031	\N	\N	5443 Queen Street	\N	Leeds	M9U 3WB	2018-08-02 13:52:31.805549+02	\N
1032	1032	\N	\N	Tulpenweg 67	\N	Hechingen	17031	2018-08-02 13:52:31.805549+02	\N
1033	1033	\N	\N	Schützenstraße 198	\N	Riedlingen	79431	2018-08-02 13:52:31.805549+02	\N
202	202	\N	\N	4002 Avenue Debrousse	\N	Bardonnex	4754	2018-08-02 13:52:31.805549+02	\N
1034	1034	\N	\N	573 W 6th St	\N	Chicago	41292	2018-08-02 13:52:31.805549+02	\N
1035	1035	\N	\N	8429 Calle De Alcalá	\N	Gijón	57215	2018-08-02 13:52:31.805549+02	\N
1036	1036	\N	\N	7306 Spring Hill Rd	\N	Concord	62634	2018-08-02 13:52:31.805549+02	\N
1037	1037	\N	\N	6539 Calle Mota	\N	Granada	37030	2018-08-02 13:52:31.805549+02	\N
1038	1038	\N	\N	2456 Rue Louis-Garrand	\N	Winkel	8357	2018-08-02 13:52:31.805549+02	\N
1039	1039	\N	\N	3569 W Sherman Dr	\N	Busselton	6090	2018-08-02 13:52:31.805549+02	\N
1040	1040	\N	\N	229 Brogade	\N	København Ø	11525	2018-08-02 13:52:31.805549+02	\N
1041	1041	\N	\N	7148 Calle Nebrija	\N	Pontevedra	49189	2018-08-02 13:52:31.805549+02	\N
1042	1042	\N	\N	5992 Jernbanevej	\N	Vesterborg	65516	2018-08-02 13:52:31.805549+02	\N
1043	1043	\N	\N	3224 Oak Ridge Ln	\N	Townsville	1069	2018-08-02 13:52:31.805549+02	\N
1044	1044	\N	\N	Im Winkel 2	\N	Lippstadt	84194	2018-08-02 13:52:31.805549+02	\N
1045	1045	\N	\N	7664 Preston Rd	\N	Greeley	46128	2018-08-02 13:52:31.805549+02	\N
1046	1046	\N	\N	6497 Ringstedvej	\N	Sundby	37760	2018-08-02 13:52:31.805549+02	\N
1047	1047	\N	\N	2149 Calle Del Pez	\N	Orihuela	60975	2018-08-02 13:52:31.805549+02	\N
1048	1048	\N	\N	3806 Tværgade	\N	Rødvig Stevns	82139	2018-08-02 13:52:31.805549+02	\N
1049	1049	\N	\N	Königsberger Straße 88	\N	Herrnhut	51405	2018-08-02 13:52:31.805549+02	\N
133	133	\N	\N	814 Rua Vinte De Setembro	\N	Itapetininga	41254	2018-08-02 13:52:31.805549+02	\N
134	134	\N	\N	2008 Rua São Sebastiao 	\N	João Pessoa	24081	2018-08-02 13:52:31.805549+02	\N
135	135	\N	\N	8965 Place Du 22 Novembre 1943	\N	S-Chanf	9046	2018-08-02 13:52:31.805549+02	\N
136	136	\N	\N	1232 Parallelvej	\N	Sundby/Erslev	46740	2018-08-02 13:52:31.805549+02	\N
137	137	\N	\N	6043 Cackson St	\N	Wagga Wagga	4252	2018-08-02 13:52:31.805549+02	\N
138	138	\N	\N	7339 Calle Del Pez	\N	Elche	68308	2018-08-02 13:52:31.805549+02	\N
139	139	\N	\N	5995 Egevænget	\N	Ansager	77476	2018-08-02 13:52:31.805549+02	\N
140	140	\N	\N	2782 Calle De Ángel García	\N	Santiago De Compostela	28628	2018-08-02 13:52:31.805549+02	\N
141	141	\N	\N	8254 Spring Hill Rd	\N	Tamworth	321	2018-08-02 13:52:31.805549+02	\N
142	142	\N	\N	693 Poppelvej	\N	Assens	70091	2018-08-02 13:52:31.805549+02	\N
143	143	\N	\N	Mozartstraße 75	\N	Bad König	10041	2018-08-02 13:52:31.805549+02	\N
144	144	\N	\N	3300 North Street	\N	St Davids	F0 9RJ	2018-08-02 13:52:31.805549+02	\N
145	145	\N	\N	5176 Mechelininkatu	\N	Laihia	67484	2018-08-02 13:52:31.805549+02	\N
146	146	\N	\N	5838 Avenida Da Democracia	\N	Mogi Guaçu	42517	2018-08-02 13:52:31.805549+02	\N
147	147	\N	\N	7978 Valwood Pkwy	\N	Newport News	93401	2018-08-02 13:52:31.805549+02	\N
148	148	\N	\N	7588 Bollenhofsestraat	\N	Oude Ijsselstreek	25308	2018-08-02 13:52:31.805549+02	\N
149	149	\N	\N	957 Rolling Green Rd	\N	Sterling Heights	43674	2018-08-02 13:52:31.805549+02	\N
150	150	\N	\N	9452 Tingstedet	\N	Bælum	41236	2018-08-02 13:52:31.805549+02	\N
151	151	\N	\N	3958 Esplanadi	\N	Iitti	76088	2018-08-02 13:52:31.805549+02	\N
152	152	\N	\N	6695 Northaven Rd	\N	Waco	58944	2018-08-02 13:52:31.805549+02	\N
153	153	\N	\N	1666 E Pecan St	\N	Gladstone	3389	2018-08-02 13:52:31.805549+02	\N
154	154	\N	\N	968 Avenida De Salamanca	\N	Cuenca	37980	2018-08-02 13:52:31.805549+02	\N
155	155	\N	\N	4814 Rue Des Ecrivains	\N	Ballens	3667	2018-08-02 13:52:31.805549+02	\N
156	156	\N	\N	7557 Rua José Bonifácio 	\N	Açailândia	49647	2018-08-02 13:52:31.805549+02	\N
158	158	\N	\N	8861 Dogwood Ave	\N	Orlando	73359	2018-08-02 13:52:31.805549+02	\N
159	159	\N	\N	Hauptstraße 113	\N	Löningen	60082	2018-08-02 13:52:31.805549+02	\N
1050	1050	\N	\N	9248 Rolighedsvej	\N	Frederiksberg	38307	2018-08-02 13:52:31.805549+02	\N
1051	1051	\N	\N	5155 Rue De La Mairie	\N	Préverenges	9256	2018-08-02 13:52:31.805549+02	\N
1052	1052	\N	\N	1063 Myllypuronkatu	\N	Köyliö	67385	2018-08-02 13:52:31.805549+02	\N
1053	1053	\N	\N	2253 Biltstraat	\N	Almere	35939	2018-08-02 13:52:31.805549+02	\N
1054	1054	\N	\N	706 Tåstrupvej	\N	Støvring 	58472	2018-08-02 13:52:31.805549+02	\N
1055	1055	\N	\N	6108 Rua Treze 	\N	Santana	61376	2018-08-02 13:52:31.805549+02	\N
1056	1056	\N	\N	2509 Aleksanterinkatu	\N	Hämeenkyrö	67042	2018-08-02 13:52:31.805549+02	\N
1057	1057	\N	\N	103 Catharijnesingel	\N	Weststellingwerf	31548	2018-08-02 13:52:31.805549+02	\N
1058	1058	\N	\N	Mühlweg 87	\N	Eberswalde	25529	2018-08-02 13:52:31.805549+02	\N
1059	1059	\N	\N	6896 Breedstraat	\N	Leek	38422	2018-08-02 13:52:31.805549+02	\N
1060	1060	\N	\N	920 Esplanadi	\N	Loimaa	96025	2018-08-02 13:52:31.805549+02	\N
1061	1061	\N	\N	4891 Nieuwegracht	\N	Waddinxveen	98152	2018-08-02 13:52:31.805549+02	\N
1062	1062	\N	\N	679 Steenweg	\N	Oldambt	23391	2018-08-02 13:52:31.805549+02	\N
1063	1063	\N	\N	6283 Calle Del Prado	\N	San Sebastián De Los Reyes	92368	2018-08-02 13:52:31.805549+02	\N
1064	1064	\N	\N	7337 Bollinger Rd	\N	Bunbury	971	2018-08-02 13:52:31.805549+02	\N
1065	1065	\N	\N	8595 Rue De L'Abbé-Groult	\N	Pfaffnau	8693	2018-08-02 13:52:31.805549+02	\N
1066	1066	\N	\N	6817 Rue Principale	\N	Dozwil	9112	2018-08-02 13:52:31.805549+02	\N
1067	1067	\N	\N	6666 Pockrus Page Rd	\N	Chula Vista	78722	2018-08-02 13:52:31.805549+02	\N
1068	1068	\N	\N	7289 Avenue Jean-Jaurès	\N	Flawil	7212	2018-08-02 13:52:31.805549+02	\N
1069	1069	\N	\N	4898 Pecan Acres Ln	\N	Bowral	4267	2018-08-02 13:52:31.805549+02	\N
1070	1070	\N	\N	7428 Herenstraat	\N	Veere	69178	2018-08-02 13:52:31.805549+02	\N
1071	1071	\N	\N	4362 Rua Rio De Janeiro 	\N	Catanduva	53365	2018-08-02 13:52:31.805549+02	\N
1072	1072	\N	\N	7017 Pockrus Page Rd	\N	Cairns	4039	2018-08-02 13:52:31.805549+02	\N
1073	1073	\N	\N	4582 Pispalan Valtatie	\N	Lemi	17288	2018-08-02 13:52:31.805549+02	\N
1074	1074	\N	\N	9779 Havremarken	\N	Klitmøller	16741	2018-08-02 13:52:31.805549+02	\N
1075	1075	\N	\N	2646 Fairview St	\N	Bathurst	7785	2018-08-02 13:52:31.805549+02	\N
1076	1076	\N	\N	6950 Church Lane	\N	Westminster	JW7R 2TU	2018-08-02 13:52:31.805549+02	\N
210	210	\N	\N	9899 Calle De Argumosa	\N	Guadalajara	54695	2018-08-02 13:52:31.805549+02	\N
211	211	\N	\N	4189 Valley View Ln	\N	Tweed	6411	2018-08-02 13:52:31.805549+02	\N
212	212	\N	\N	1852 Stevens Creek Blvd	\N	Nowra	705	2018-08-02 13:52:31.805549+02	\N
213	213	\N	\N	5206 Drift	\N	Geldrop-Mierlo	35735	2018-08-02 13:52:31.805549+02	\N
214	214	\N	\N	Breslauer Straße 70	\N	Lauenburg/Elbe	36265	2018-08-02 13:52:31.805549+02	\N
215	215	\N	\N	9932 Calle De Ferraz	\N	Pontevedra	58559	2018-08-02 13:52:31.805549+02	\N
216	216	\N	\N	2046 Rua Amazonas 	\N	Diadema	34611	2018-08-02 13:52:31.805549+02	\N
217	217	\N	\N	4816 Zuilenstraat	\N	Stede Broec	88091	2018-08-02 13:52:31.805549+02	\N
218	218	\N	\N	8855 Rua Duque De Caxias 	\N	Ribeirão Pires	41281	2018-08-02 13:52:31.805549+02	\N
219	219	\N	\N	476 Saddle Dr	\N	Jacksonville	81022	2018-08-02 13:52:31.805549+02	\N
220	220	\N	\N	Grüner Weg 94	\N	Munderkingen	53116	2018-08-02 13:52:31.805549+02	\N
221	221	\N	\N	8937 Rue De L'Abbé-Soulange-Bodin	\N	Buttwil	8442	2018-08-02 13:52:31.805549+02	\N
222	222	\N	\N	8525 Mechelininkatu	\N	Eckerö	32498	2018-08-02 13:52:31.805549+02	\N
223	223	\N	\N	9386 Servetstraat	\N	Rijssen-Holten	51481	2018-08-02 13:52:31.805549+02	\N
224	224	\N	\N	9187 W Dallas St	\N	Edgewood	68153	2018-08-02 13:52:31.805549+02	\N
225	225	\N	\N	6269 Rue Des Jardins	\N	Sessa	3222	2018-08-02 13:52:31.805549+02	\N
226	226	\N	\N	2920 Rua Treze 	\N	Belém	13218	2018-08-02 13:52:31.805549+02	\N
227	227	\N	\N	7766 Monseigneur Van De Weteringstraat	\N	Leudal	15754	2018-08-02 13:52:31.805549+02	\N
228	228	\N	\N	Meisenweg 115	\N	Volkach	22398	2018-08-02 13:52:31.805549+02	\N
229	229	\N	\N	9228 Donkerstraat	\N	Alblasserdam	47041	2018-08-02 13:52:31.805549+02	\N
1094	1094	\N	\N	5843 Boothstraat	\N	Hoogeveen	14589	2018-08-02 13:52:31.805549+02	\N
1095	1095	\N	\N	9684 Rua São Luiz 	\N	Macaé	26014	2018-08-02 13:52:31.805549+02	\N
1096	1096	\N	\N	2617 Majellapark	\N	Drechterland	39404	2018-08-02 13:52:31.805549+02	\N
1097	1097	\N	\N	1481 Mockingbird Hill	\N	Pittsburgh	90265	2018-08-02 13:52:31.805549+02	\N
1098	1098	\N	\N	6330 Rua Dom Pedro Ii 	\N	Curitiba	93701	2018-08-02 13:52:31.805549+02	\N
1099	1099	\N	\N	9752 Mcclellan Rd	\N	Bowral	7150	2018-08-02 13:52:31.805549+02	\N
1100	1100	\N	\N	2354 Avenida D. Pedro Ii	\N	Santa Cruz Do Sul	18649	2018-08-02 13:52:31.805549+02	\N
1101	1101	\N	\N	8652 Twijnstraat Aan De Werf	\N	Kampen	22789	2018-08-02 13:52:31.805549+02	\N
230	230	\N	\N	1147 Granvej	\N	Ishoej	30621	2018-08-02 13:52:31.805549+02	\N
231	231	\N	\N	Breslauer Straße 185	\N	Gronau (Leine)	38510	2018-08-02 13:52:31.805549+02	\N
232	232	\N	\N	3974 Victoria Street	\N	Cardiff	G06 0XD	2018-08-02 13:52:31.805549+02	\N
233	233	\N	\N	8074 Kings Road	\N	Truro	CP32 5WB	2018-08-02 13:52:31.805549+02	\N
157	157	\N	\N	7500 Muntstraat	\N	Maasdriel	21702	2018-08-02 13:52:31.805549+02	\N
1102	102	\N	\N	Kirchgasse 26	\N	Bad Marienberg (Westerwald)	82340	2018-08-02 13:52:31.805549+02	\N
1103	103	\N	\N	6660 Hämeenkatu	\N	Loimaa	54559	2018-08-02 13:52:31.805549+02	\N
1104	104	\N	\N	8978 Church Street	\N	Winchester	X4 0NH	2018-08-02 13:52:31.805549+02	\N
1105	105	\N	\N	9671 Station Road	\N	Cambridge	XR50 3JG	2018-08-02 13:52:31.805549+02	\N
1107	107	\N	\N	6091 Calle De Arganzuela	\N	Murcia	77653	2018-08-02 13:52:31.805549+02	\N
1130	130	\N	\N	6655 Havnegade	\N	Vesterborg	86694	2018-08-02 13:52:31.805549+02	\N
1131	131	\N	\N	9068 Calle De Alberto Aguilera	\N	Logroño	41500	2018-08-02 13:52:31.805549+02	\N
1132	132	\N	\N	2142 Poortstraat	\N	Zaltbommel	17873	2018-08-02 13:52:31.805549+02	\N
1106	106	\N	\N	Wiesenweg 42	\N	Oderberg	67578	2018-08-02 13:52:31.805549+02	\N
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: webshop; Owner: postgres
--

COPY webshop.colors (id, name, rgb) FROM stdin;
3	INDIANRED	#CD5C5C
4	LIGHTCORAL	#F08080
5	SALMON	#FA8072
6	DARKSALMON	#E9967A
7	LIGHTSALMON	#FFA07A
8	CRIMSON	#DC143C
9	RED	#FF0000
10	FIREBRICK	#B22222
11	DARKRED	#8B0000
12	PINK	#FFC0CB
13	LIGHTPINK	#FFB6C1
14	HOTPINK	#FF69B4
15	DEEPPINK	#FF1493
16	MEDIUMVIOLETRED	#C71585
17	PALEVIOLETRED	#DB7093
18	LIGHTSALMON	#FFA07A
19	CORAL	#FF7F50
20	TOMATO	#FF6347
21	ORANGERED	#FF4500
22	DARKORANGE	#FF8C00
23	ORANGE	#FFA500
24	GOLD	#FFD700
25	YELLOW	#FFFF00
26	LIGHTYELLOW	#FFFFE0
27	LEMONCHIFFON	#FFFACD
28	LIGHTGOLDENRODYELLOW	#FAFAD2
29	PAPAYAWHIP	#FFEFD5
30	MOCCASIN	#FFE4B5
31	PEACHPUFF	#FFDAB9
32	PALEGOLDENROD	#EEE8AA
33	KHAKI	#F0E68C
34	DARKKHAKI	#BDB76B
35	LAVENDER	#E6E6FA
36	THISTLE	#D8BFD8
37	PLUM	#DDA0DD
38	VIOLET	#EE82EE
39	ORCHID	#DA70D6
40	FUCHSIA	#FF00FF
41	MAGENTA	#FF00FF
42	MEDIUMORCHID	#BA55D3
43	MEDIUMPURPLE	#9370DB
44	REBECCAPURPLE	#663399
45	BLUEVIOLET	#8A2BE2
46	DARKVIOLET	#9400D3
47	DARKORCHID	#9932CC
48	DARKMAGENTA	#8B008B
49	PURPLE	#800080
50	INDIGO	#4B0082
51	SLATEBLUE	#6A5ACD
52	DARKSLATEBLUE	#483D8B
53	MEDIUMSLATEBLUE	#7B68EE
54	GREENYELLOW	#ADFF2F
55	CHARTREUSE	#7FFF00
56	LAWNGREEN	#7CFC00
57	LIME	#00FF00
58	LIMEGREEN	#32CD32
59	PALEGREEN	#98FB98
60	LIGHTGREEN	#90EE90
61	MEDIUMSPRINGGREEN	#00FA9A
62	SPRINGGREEN	#00FF7F
63	MEDIUMSEAGREEN	#3CB371
64	SEAGREEN	#2E8B57
65	FORESTGREEN	#228B22
66	GREEN	#008000
67	DARKGREEN	#006400
68	YELLOWGREEN	#9ACD32
69	OLIVEDRAB	#6B8E23
70	OLIVE	#808000
71	DARKOLIVEGREEN	#556B2F
72	MEDIUMAQUAMARINE	#66CDAA
73	DARKSEAGREEN	#8FBC8B
74	LIGHTSEAGREEN	#20B2AA
75	DARKCYAN	#008B8B
76	TEAL	#008080
77	AQUA	#00FFFF
78	CYAN	#00FFFF
79	LIGHTCYAN	#E0FFFF
80	PALETURQUOISE	#AFEEEE
81	AQUAMARINE	#7FFFD4
82	TURQUOISE	#40E0D0
83	MEDIUMTURQUOISE	#48D1CC
84	DARKTURQUOISE	#00CED1
85	CADETBLUE	#5F9EA0
86	STEELBLUE	#4682B4
87	LIGHTSTEELBLUE	#B0C4DE
88	POWDERBLUE	#B0E0E6
89	LIGHTBLUE	#ADD8E6
90	SKYBLUE	#87CEEB
91	LIGHTSKYBLUE	#87CEFA
92	DEEPSKYBLUE	#00BFFF
93	DODGERBLUE	#1E90FF
94	CORNFLOWERBLUE	#6495ED
95	MEDIUMSLATEBLUE	#7B68EE
96	ROYALBLUE	#4169E1
97	BLUE	#0000FF
98	MEDIUMBLUE	#0000CD
99	DARKBLUE	#00008B
100	NAVY	#000080
101	MIDNIGHTBLUE	#191970
102	CORNSILK	#FFF8DC
103	BLANCHEDALMOND	#FFEBCD
104	BISQUE	#FFE4C4
105	NAVAJOWHITE	#FFDEAD
106	WHEAT	#F5DEB3
107	BURLYWOOD	#DEB887
108	TAN	#D2B48C
109	ROSYBROWN	#BC8F8F
110	SANDYBROWN	#F4A460
111	GOLDENROD	#DAA520
112	DARKGOLDENROD	#B8860B
113	PERU	#CD853F
114	CHOCOLATE	#D2691E
115	SADDLEBROWN	#8B4513
116	SIENNA	#A0522D
117	BROWN	#A52A2A
118	MAROON	#800000
119	WHITE	#FFFFFF
120	SNOW	#FFFAFA
121	HONEYDEW	#F0FFF0
122	MINTCREAM	#F5FFFA
123	AZURE	#F0FFFF
124	ALICEBLUE	#F0F8FF
125	GHOSTWHITE	#F8F8FF
126	WHITESMOKE	#F5F5F5
127	SEASHELL	#FFF5EE
128	BEIGE	#F5F5DC
129	OLDLACE	#FDF5E6
130	FLORALWHITE	#FFFAF0
131	IVORY	#FFFFF0
132	ANTIQUEWHITE	#FAEBD7
133	LINEN	#FAF0E6
134	LAVENDERBLUSH	#FFF0F5
135	MISTYROSE	#FFE4E1
136	GAINSBORO	#DCDCDC
137	LIGHTGRAY	#D3D3D3
138	SILVER	#C0C0C0
139	DARKGRAY	#A9A9A9
140	GRAY	#808080
141	DIMGRAY	#696969
142	LIGHTSLATEGRAY	#778899
143	SLATEGRAY	#708090
144	DARKSLATEGRAY	#2F4F4F
145	BLACK	#000000
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: webshop; Owner: postgres
--

COPY webshop.labels (id, name, slugname, icon) FROM stdin;
1	A	A	\N
2	A.F.C.A	AFCA	\N
3	A.P.C.Absolut Joy	APCAbsolutJoy	\N
4	Acne Studios	AcneStudios	\N
5	Acqua Limone	AcquaLimone	\N
6	Add	Add	\N
7	adidas	adidas	\N
8	adidas Originals	adidasOriginals	\N
9	Advanta	Advanta	\N
10	Aglini	Aglini	\N
11	Aimé Leon Dore	AiméLeonDore	\N
12	AKOO	AKOO	\N
13	Alaia	Alaia	\N
14	Alain Figaret	AlainFigaret	\N
15	Alberta Ferretti	AlbertaFerretti	\N
16	Alessandro Dell´Acqua	AlessandroDell´Acqua	\N
17	Alessi	Alessi	\N
18	AlexaChung	AlexaChung	\N
19	Alexander McQueen	AlexanderMcQueen	\N
20	Alexander Wang	AlexanderWang	\N
21	Alice & Olivia	AliceOlivia	\N
22	AllSaints	AllSaints	\N
23	Alpha Studio	AlphaStudio	\N
24	Altuzarra	Altuzarra	\N
25	Alysi	Alysi	\N
26	American Eagle Outfitters	AmericanEagleOutfitters	\N
27	Americanflat	Americanflat	\N
28	Ami	Ami	\N
29	André Kim	AndréKim	\N
30	Ann Demeulemeester	AnnDemeulemeester	\N
31	Annarita N.	AnnaritaN	\N
32	Anne Fontaine	AnneFontaine	\N
33	Anne T. Hill	AnneTHill	\N
34	Anthropologie	Anthropologie	\N
35	Antony Morato	AntonyMorato	\N
36	Antthony Mark Hankins	AntthonyMarkHankins	\N
37	Anya Hindmarch	AnyaHindmarch	\N
38	Apalis	Apalis	\N
39	Aquazzura	Aquazzura	\N
40	Arckiv	Arckiv	\N
41	Armani	Armani	\N
42	Armoire Officielle	ArmoireOfficielle	\N
43	Arthur Galan AG	ArthurGalanAG	\N
44	Artopweb	Artopweb	\N
45	artPause	artPause	\N
46	Arty Pie	ArtyPie	\N
47	Ash	Ash	\N
48	Asics	Asics	\N
49	Asos	Asos	\N
50	Asos Petite	AsosPetite	\N
51	Aspesi	Aspesi	\N
52	AT.P. CO	ATPCO	\N
53	Atos Lombardini	AtosLombardini	\N
54	Bailey 44	Bailey44	\N
55	Balenciaga	Balenciaga	\N
56	Ballantyne	Ballantyne	\N
57	Bally	Bally	\N
58	Balmain	Balmain	\N
59	Banana Moon	BananaMoon	\N
60	Barba	Barba	\N
61	Barena	Barena	\N
62	Barneys New York	BarneysNewYork	\N
63	Bellerose	Bellerose	\N
64	Bellerose Belgium	BelleroseBelgium	\N
65	Belstaff	Belstaff	\N
66	Ben Sherman	BenSherman	\N
67	BenchBenetton	BenchBenetton	\N
68	Berna	Berna	\N
69	Berwich	Berwich	\N
70	Bestseller	Bestseller	\N
71	Betty Barclay	BettyBarclay	\N
72	Biba Apparels	BibaApparels	\N
73	Big Art Shop	BigArtShop	\N
74	Big Box Art	BigBoxArt	\N
75	Bigotti	Bigotti	\N
76	BILLIEBLUSH	BILLIEBLUSH	\N
77	Birkenstock	Birkenstock	\N
78	Blanc & Eclare	BlancEclare	\N
79	Blauer	Blauer	\N
80	Blaze of Sweden	BlazeofSweden	\N
81	Blend	Blend	\N
82	Bllack Noir	BllackNoir	\N
83	Bloch	Bloch	\N
84	Blue Les Copains	BlueLesCopains	\N
85	Bluenotes	Bluenotes	\N
86	Blugirl	Blugirl	\N
87	Blumarine	Blumarine	\N
88	Boglioli	Boglioli	\N
89	Bonia	Bonia	\N
90	Bosideng	Bosideng	\N
91	BOSS	BOSS	\N
92	Bottega Veneta	BottegaVeneta	\N
93	Boxfresh	Boxfresh	\N
94	BP Studio	BPStudio	\N
95	Brave Soul	BraveSoul	\N
96	Brax	Brax	\N
97	Brian Dales	BrianDales	\N
98	Brooks Brothers	BrooksBrothers	\N
99	Brooksfield	Brooksfield	\N
100	Brunello Cucinelli	BrunelloCucinelli	\N
101	Buffalo	Buffalo	\N
102	Bugatti	Bugatti	\N
103	Burberry	Burberry	\N
104	Byblos	Byblos	\N
105	C&A	CA	\N
106	Cafènoir	Cafènoir	\N
107	Caliban	Caliban	\N
108	Callisti	Callisti	\N
109	Calvin Klein	CalvinKlein	\N
110	CALVIN KLEIN 205W39NYC	CALVINKLEIN205W39NYC	\N
111	Camel Active	CamelActive	\N
112	Camper	Camper	\N
113	Canali	Canali	\N
114	Cantarelli	Cantarelli	\N
115	Canterbury of New Zealand	CanterburyofNewZealand	\N
116	Caraceni	Caraceni	\N
117	Carbrini Sportswear	CarbriniSportswear	\N
118	Carhartt Work in Progress	CarharttWorkinProgress	\N
119	Carla G.	CarlaG	\N
120	Carlo Palazzi	CarloPalazzi	\N
121	Carven	Carven	\N
122	Casadei	Casadei	\N
123	Cassidi	Cassidi	\N
124	Castro	Castro	\N
125	Catherine Lansfield	CatherineLansfield	\N
126	Catimini	Catimini	\N
127	Celine	Celine	\N
128	Cesare PaciottiChanel	CesarePaciottiChanel	\N
129	Charlotte Olympia	CharlotteOlympia	\N
130	Cheap Monday	CheapMonday	\N
131	Chervo	Chervo	\N
132	Chiara Ferragni	ChiaraFerragni	\N
133	China Heilan Group	ChinaHeilanGroup	\N
134	Chloé	Chloé	\N
135	Christian Louboutin	ChristianLouboutin	\N
136	Christopher Kane	ChristopherKane	\N
137	Clarks	Clarks	\N
138	Closed	Closed	\N
139	Coach	Coach	\N
140	Cockpit USA	CockpitUSA	\N
141	Colmar	Colmar	\N
142	Comma	Comma	\N
143	Comme Des Garçons	CommeDesGarçons	\N
144	Comptoir des Cotonniers	ComptoirdesCotonniers	\N
145	Converse	Converse	\N
146	CornelianiCostume National	CornelianiCostumeNational	\N
147	Countess Mara	CountessMara	\N
148	CristinaeEffe	CristinaeEffe	\N
149	Croc O' Shirt	CrocOShirt	\N
150	Crocs	Crocs	\N
151	Cruciani	Cruciani	\N
152	Cult	Cult	\N
153	Cuplé	Cuplé	\N
154	Current Elliott	CurrentElliott	\N
155	Cycle	Cycle	\N
156	Céline	Céline	\N
157	Dale of Norway	DaleofNorway	\N
158	Damani Dada	DamaniDada	\N
159	Daniel Hechter	DanielHechter	\N
160	Daniele Alessandrini	DanieleAlessandrini	\N
161	Daniele Fiesoli	DanieleFiesoli	\N
162	DC Comics	DCComics	\N
163	Deha	Deha	\N
164	Deknudt Frames	DeknudtFrames	\N
165	Deko Trends	DekoTrends	\N
166	Dekoria	Dekoria	\N
167	Denby	Denby	\N
168	Denver Hayes	DenverHayes	\N
169	Department 5	Department5	\N
170	Derek Lam	DerekLam	\N
171	Design Vicenza	DesignVicenza	\N
172	DesigualDiadora	DesigualDiadora	\N
173	Diane Von Fürstenberg	DianeVonFürstenberg	\N
174	Dickies	Dickies	\N
175	DieselDior	DieselDior	\N
176	Dirk Bikkembergs	DirkBikkembergs	\N
177	Disney	Disney	\N
178	DKNY	DKNY	\N
179	Dockers by Gerli	DockersbyGerli	\N
180	Dolce & Gabbana	DolceGabbana	\N
181	Dolfin Swimwear	DolfinSwimwear	\N
182	Domenico Tagliente	DomenicoTagliente	\N
183	Dondup	Dondup	\N
184	Doppiaa	Doppiaa	\N
185	Dorothee Schumacher	DorotheeSchumacher	\N
186	Dorothy Perkins	DorothyPerkins	\N
187	Doucal's	Doucals	\N
188	Douceur d'Intérieur	DouceurdIntérieur	\N
189	Douuod	Douuod	\N
190	Dr. Martens	DrMartens	\N
191	Draft:Kidbox	Draft:Kidbox	\N
192	Dries Van Noten	DriesVanNoten	\N
193	Drumohr	Drumohr	\N
194	Dsquared2	Dsquared2	\N
195	Dsquared2 Kids	Dsquared2Kids	\N
196	Duchamp	Duchamp	\N
197	Dutch Decor	DutchDecor	\N
198	Duvelleroy	Duvelleroy	\N
199	Duvetica	Duvetica	\N
200	Dwell	Dwell	\N
201	Eastpak	Eastpak	\N
202	Ebarrito	Ebarrito	\N
203	Ecco	Ecco	\N
204	EDC by Esprit	EDCbyEsprit	\N
205	EDUN	EDUN	\N
206	Edwin	Edwin	\N
207	Eglo	Eglo	\N
208	Eiffel Textile	EiffelTextile	\N
209	El Naturalista	ElNaturalista	\N
210	Elaine Kim	ElaineKim	\N
211	Eleventy	Eleventy	\N
212	Elie Tahari	ElieTahari	\N
213	Elisabetta Franchi	ElisabettaFranchi	\N
214	Elizabeth & James	ElizabethJames	\N
215	Ellery	Ellery	\N
216	Elsa Schiaparelli	ElsaSchiaparelli	\N
217	Emanuel Ungaro	EmanuelUngaro	\N
218	Emanuela Passeri	EmanuelaPasseri	\N
219	Emilia Lay	EmiliaLay	\N
220	Emilio Pucci	EmilioPucci	\N
221	Emporio Armani	EmporioArmani	\N
222	Emsa	Emsa	\N
223	English Eccentrics	EnglishEccentrics	\N
224	Entre Amis	EntreAmis	\N
225	Enza Costa	EnzaCosta	\N
226	Equipment	Equipment	\N
227	Erdem	Erdem	\N
228	Eres	Eres	\N
229	Erika Cavallini Semi Couture	ErikaCavalliniSemiCouture	\N
230	Ermanno Scervino	ErmannoScervino	\N
231	Ermenegildo Zegna	ErmenegildoZegna	\N
232	Escada	Escada	\N
233	Esprit	Esprit	\N
234	Essentiel	Essentiel	\N
235	Ethan James	EthanJames	\N
236	Ethika	Ethika	\N
237	Eton	Eton	\N
238	Etro	Etro	\N
239	Eurographics	Eurographics	\N
240	European Culture	EuropeanCulture	\N
241	EVANS	EVANS	\N
242	Excelsa	Excelsa	\N
243	Exclusive Home Curtains	ExclusiveHomeCurtains	\N
244	Exotic India	ExoticIndia	\N
245	Extè	Extè	\N
246	Eyelevel	Eyelevel	\N
247	Eysa	Eysa	\N
248	Fabi	Fabi	\N
249	Fabiana Filippi	FabianaFilippi	\N
250	Fackelmann	Fackelmann	\N
251	Faith Connexion	FaithConnexion	\N
252	Falke	Falke	\N
253	Fashion for Home	FashionforHome	\N
254	Fashion line	Fashionline	\N
255	Fat Face	FatFace	\N
256	FAUSTO PUGLISI	FAUSTOPUGLISI	\N
257	Fay	Fay	\N
258	Febland Group	FeblandGroup	\N
259	Fenchurch	Fenchurch	\N
260	FendiFenty Puma by Rihanna	FendiFentyPumabyRihanna	\N
261	Ferdinando Sarmi	FerdinandoSarmi	\N
262	Ferm Living	FermLiving	\N
263	Fila	Fila	\N
264	FILIPPO DE LAURENTIIS	FILIPPODELAURENTIIS	\N
265	Final Touch Interior Decor	FinalTouchInteriorDecor	\N
266	Firetrap	Firetrap	\N
267	First People First	FirstPeopleFirst	\N
268	Fisico	Fisico	\N
269	FitFlop	FitFlop	\N
270	Flash Furniture	FlashFurniture	\N
271	Fleur du Mal	FleurduMal	\N
272	Fleuresse	Fleuresse	\N
273	FLY London	FLYLondon	\N
274	Forever Lazy	ForeverLazy	\N
275	Fornarina	Fornarina	\N
276	Fornasetti	Fornasetti	\N
277	Forte_Forte	Forte_Forte	\N
278	Fossil	Fossil	\N
279	Fox	Fox	\N
280	Fradi	Fradi	\N
281	Frame Company	FrameCompany	\N
282	Frame Denim	FrameDenim	\N
283	Frames by Post	FramesbyPost	\N
284	Frankie Morello	FrankieMorello	\N
285	Franklin & Marshall	FranklinMarshall	\N
286	Fred Mello	FredMello	\N
287	Fred Perry	FredPerry	\N
288	Fred´s World By Green Cotton	Fred´sWorldByGreenCotton	\N
289	Free People	FreePeople	\N
290	French Connection	FrenchConnection	\N
291	Furla	Furla	\N
292	G-Star	G-Star	\N
293	G-Star Raw	G-StarRaw	\N
294	G2000	G2000	\N
295	Gabor	Gabor	\N
296	Gabs	Gabs	\N
297	Ganni	Ganni	\N
298	GANTGanter	GANTGanter	\N
299	Garage	Garage	\N
300	Garanimals	Garanimals	\N
301	Garcia	Garcia	\N
302	Garcia de Pou	GarciadePou	\N
303	Gas	Gas	\N
304	Gattinoni	Gattinoni	\N
305	Gaudì	Gaudì	\N
306	Gaëlle Paris	GaëlleParis	\N
307	GB Eye Limited	GBEyeLimited	\N
308	GCDS	GCDS	\N
309	Gebrüder Stitch	GebrüderStitch	\N
310	Genny	Genny	\N
311	Gentryportofino	Gentryportofino	\N
312	George J. Love	GeorgeJLove	\N
313	Geox	Geox	\N
314	Gerry Weber	GerryWeber	\N
315	Giambattista Valli	GiambattistaValli	\N
316	Giancarlo Paoli	GiancarloPaoli	\N
317	Gianvito Rossi	GianvitoRossi	\N
318	Giesswein	Giesswein	\N
319	Giorgia & Johns	GiorgiaJohns	\N
320	Giorgio Armani	GiorgioArmani	\N
321	Gioseppo	Gioseppo	\N
322	Giuseppe Zanotti	GiuseppeZanotti	\N
323	Givenchy	Givenchy	\N
324	Glamorous	Glamorous	\N
325	Globo Lighting	GloboLighting	\N
326	Gloria Vanderbilt	GloriaVanderbilt	\N
327	Go International	GoInternational	\N
328	Golden Goose	GoldenGoose	\N
329	Gotha	Gotha	\N
330	Gran Sasso	GranSasso	\N
331	Grishko	Grishko	\N
332	GRUND	GRUND	\N
333	GTA	GTA	\N
334	Gucci	Gucci	\N
335	Gucci Kids	GucciKids	\N
336	Guess	Guess	\N
337	Guglielminotti	Guglielminotti	\N
338	Gunhild	Gunhild	\N
339	Gunne Sax	GunneSax	\N
340	Gunze	Gunze	\N
341	Gözze	Gözze	\N
342	H&M	HM	\N
343	Hackett	Hackett	\N
344	Haider Ackermann	HaiderAckermann	\N
345	Haikure	Haikure	\N
346	Haku Möbel	HakuMöbel	\N
347	Halston Heritage	HalstonHeritage	\N
348	Hamaki-Ho	Hamaki-Ho	\N
349	Han Kjøbenhavn	HanKjøbenhavn	\N
350	Hanita	Hanita	\N
351	Hanro	Hanro	\N
352	Happiness Brand	HappinessBrand	\N
353	Harmont & Blaine	HarmontBlaine	\N
354	Harris Wharf London	HarrisWharfLondon	\N
355	Hartford	Hartford	\N
356	HatleyHaus Alkire	HatleyHausAlkire	\N
357	Havaianas	Havaianas	\N
358	Helmut LangHEMA	HelmutLangHEMA	\N
359	Henry Cotton´s	HenryCotton´s	\N
360	Heritage	Heritage	\N
361	Hermès	Hermès	\N
362	Herno	Herno	\N
363	Herschel	Herschel	\N
364	Hervé Leger	HervéLeger	\N
365	Hield	Hield	\N
366	High	High	\N
367	High Street Design	HighStreetDesign	\N
368	Historic	Historic	\N
369	Hogan	Hogan	\N
370	Hollyberry HomeHOME MAISON	HollyberryHomeHOMEMAISON	\N
371	Honigman	Honigman	\N
372	Honsel Leuchten	HonselLeuchten	\N
373	Hope Collection	HopeCollection	\N
374	HTC	HTC	\N
375	HTnaturals	HTnaturals	\N
376	Huber	Huber	\N
377	Hudson	Hudson	\N
378	HUGO BOSS	HUGOBOSS	\N
379	Hummel	Hummel	\N
380	Husky	Husky	\N
381	Hydrogen	Hydrogen	\N
382	Hérve Léger	HérveLéger	\N
383	Högl	Högl	\N
384	I Saw It First	ISawItFirst	\N
385	I'm Brian	ImBrian	\N
386	I'm Isola Marras	ImIsolaMarras	\N
387	I. & R. Morley	IRMorley	\N
388	Ian Snow	IanSnow	\N
389	IANUX	IANUX	\N
390	Ibili	Ibili	\N
391	iBlues	iBlues	\N
392	Iceberg	Iceberg	\N
393	Ichi	Ichi	\N
394	Icone	Icone	\N
395	Igi & Co	IgiCo	\N
396	Ih Nom Uh Nit	IhNomUhNit	\N
397	iittala	iittala	\N
398	Il Gufo	IlGufo	\N
399	Imperfect	Imperfect	\N
400	Imperial	Imperial	\N
401	Impressions	Impressions	\N
402	Incotex	Incotex	\N
403	Individual	Individual	\N
404	Ingram	Ingram	\N
405	Inov8	Inov8	\N
406	Inside	Inside	\N
407	Inspired Walls	InspiredWalls	\N
408	InterDesign	InterDesign	\N
409	Intropia	Intropia	\N
410	Invicta	Invicta	\N
411	IRIS & INK	IRISINK	\N
412	Iro	Iro	\N
413	Iron Heart	IronHeart	\N
414	Irregular Choice	IrregularChoice	\N
415	Isa Arfen	IsaArfen	\N
416	Isabel Benenato	IsabelBenenato	\N
417	Isabel Marant	IsabelMarant	\N
418	Isaia	Isaia	\N
419	ISC	ISC	\N
420	ISKO	ISKO	\N
421	Islo Isabella Lorusso	IsloIsabellaLorusso	\N
422	Issa	Issa	\N
423	Issey Miyake	IsseyMiyake	\N
424	Italian Bed Linen	ItalianBedLinen	\N
425	Italo Ottinetti	ItaloOttinetti	\N
426	Ivories	Ivories	\N
427	Izod Lacoste	IzodLacoste	\N
428	J Brand	JBrand	\N
429	J-Wear	J-Wear	\N
430	J.Lindeberg	JLindeberg	\N
431	J.W. SAX Milano	JWSAXMilano	\N
432	J.W.Anderson	JWAnderson	\N
433	Jack & Jones	JackJones	\N
434	Jacob Cohen	JacobCohen	\N
435	Jako	Jako	\N
436	James & Nicholson	JamesNicholson	\N
437	James Perse	JamesPerse	\N
438	Janet & Janet	JanetJanet	\N
439	Jean Machine	JeanMachine	\N
440	Jean Paul Gaultier	JeanPaulGaultier	\N
441	Jeckerson	Jeckerson	\N
442	Jeffrey Campbell	JeffreyCampbell	\N
443	Jenny Hellström	JennyHellström	\N
444	Jennyfer	Jennyfer	\N
445	Jeordie's	Jeordies	\N
446	Jigsaw	Jigsaw	\N
447	Jijil	Jijil	\N
448	Jijil Jolie	JijilJolie	\N
449	Jil Sander	JilSander	\N
450	Jimmy Choo London	JimmyChooLondon	\N
451	Joe Browns	JoeBrowns	\N
452	Joe Fresh	JoeFresh	\N
453	John Galliano	JohnGalliano	\N
454	JOHN GALLIANO KIDS	JOHNGALLIANOKIDS	\N
455	John Richmond	JohnRichmond	\N
456	John Varvatos	JohnVarvatos	\N
457	John Weitz	JohnWeitz	\N
458	Joie	Joie	\N
459	Jolie By Edward Spiers	JolieByEdwardSpiers	\N
460	Jon Richard	JonRichard	\N
461	Jonathan Simkhai	JonathanSimkhai	\N
462	Joop	Joop	\N
463	Josef Seibel	JosefSeibel	\N
464	JosephJoshua Sanders	JosephJoshuaSanders	\N
465	Joules	Joules	\N
466	Joykeep Jeans	JoykeepJeans	\N
467	Jucca	Jucca	\N
468	Judge	Judge	\N
469	Julian Bowen	JulianBowen	\N
470	Junya Watanabe	JunyaWatanabe	\N
471	Just Cavalli	JustCavalli	\N
472	Just Contempo	JustContempo	\N
473	JUSTyou	JUSTyou	\N
474	K-Way	K-Way	\N
475	Kahla	Kahla	\N
476	KAISER	KAISER	\N
477	Kalliste	Kalliste	\N
478	Kangaroos	Kangaroos	\N
479	Kangra Cashmere	KangraCashmere	\N
480	Kanz	Kanz	\N
481	Kaos	Kaos	\N
482	Kaporal	Kaporal	\N
483	Kappa	Kappa	\N
484	Karen Millen	KarenMillen	\N
485	Karl Kani	KarlKani	\N
486	Karl Lagerfeld	KarlLagerfeld	\N
487	Kartell	Kartell	\N
488	Katia G.	KatiaG	\N
489	KELA	KELA	\N
490	KEN BARRELL	KENBARRELL	\N
491	Ken Done	KenDone	\N
492	Kendall + Kylie	KendallKylie	\N
493	Kennel & Schmenger	KennelSchmenger	\N
494	Kenneth Cole	KennethCole	\N
495	Kenneth Cole Reaction	KennethColeReaction	\N
496	Kenneth Jay Lane	KennethJayLane	\N
497	Kent & Curwen	KentCurwen	\N
498	KESPER	KESPER	\N
499	Khaadi	Khaadi	\N
500	Khaite	Khaite	\N
501	Ki6? Who are you?	Ki6?Whoareyou?	\N
502	Kickers	Kickers	\N
503	Kidiliz	Kidiliz	\N
504	King Apparel	KingApparel	\N
505	Kipling	Kipling	\N
506	KitchenCraft	KitchenCraft	\N
507	KitonKleine Wolke	KitonKleineWolke	\N
508	Knot	Knot	\N
509	Kocca	Kocca	\N
510	Konstsmide	Konstsmide	\N
511	Kookai	Kookai	\N
512	Koon	Koon	\N
513	Koralline	Koralline	\N
514	Koton	Koton	\N
515	Koziol	Koziol	\N
516	Kudeta	Kudeta	\N
517	Kuhn Rikon	KuhnRikon	\N
518	Kurt Geiger	KurtGeiger	\N
519	L'autre Chose	LautreChose	\N
520	L.B.M. 1911	LBM1911	\N
521	L:Ú L:Ú	L:ÚL:Ú	\N
522	La Bonneterie Cevenole	LaBonneterieCevenole	\N
523	LA Linen	LALinen	\N
524	La Perla	LaPerla	\N
525	La Stupenderia	LaStupenderia	\N
526	La tennis Bensimon	LatennisBensimon	\N
527	Lacor	Lacor	\N
528	Lacoste	Lacoste	\N
529	Lamberto Losani	LambertoLosani	\N
530	Lands End	LandsEnd	\N
531	Laneus	Laneus	\N
532	Lanvin	Lanvin	\N
533	Lardini	Lardini	\N
534	Larusmiani	Larusmiani	\N
535	laviniaturra	laviniaturra	\N
536	Le Château	LeChâteau	\N
537	Le Coq Sportif	LeCoqSportif	\N
538	Le Mont Saint Michel	LeMontSaintMichel	\N
539	Le Silla	LeSilla	\N
540	Leather Crown	LeatherCrown	\N
541	Lee	Lee	\N
542	Lego Wear	LegoWear	\N
543	Leonisa	Leonisa	\N
544	Les Copains	LesCopains	\N
545	LeSportsac	LeSportsac	\N
546	Levi Strauss & Co.	LeviStraussCo	\N
547	Levi's	Levis	\N
548	Liebeskind	Liebeskind	\N
549	LITTLE MARC JACOBS	LITTLEMARCJACOBS	\N
550	LittleBig	LittleBig	\N
551	Liu Jo	LiuJo	\N
552	Liviana Conti	LivianaConti	\N
553	Loewe	Loewe	\N
554	Lonely	Lonely	\N
555	Loro Piana	LoroPiana	\N
556	Lost And Found Rooms	LostAndFoundRooms	\N
557	Louis Philippe	LouisPhilippe	\N
558	Louis Vuitton	LouisVuitton	\N
559	Love Moschino	LoveMoschino	\N
560	Lovely Casa	LovelyCasa	\N
561	Lover	Lover	\N
562	Lovers + Friends	LoversFriends	\N
563	low brand	lowbrand	\N
564	Loyandford	Loyandford	\N
565	LSA International	LSAInternational	\N
566	LTB Jeans	LTBJeans	\N
567	Lucléon	Lucléon	\N
568	Luigi Borrelli	LuigiBorrelli	\N
569	LUIGI BORRELLI NAPOLI	LUIGIBORRELLINAPOLI	\N
570	Lumberjack	Lumberjack	\N
571	Lush Décor	LushDécor	\N
572	Lygia & Nanny	LygiaNanny	\N
573	Lyle & Scott	LyleScott	\N
574	M Missoni	MMissoni	\N
575	Macchia j	Macchiaj	\N
576	Madonna fashion brands	Madonnafashionbrands	\N
577	Magnolia Box	MagnoliaBox	\N
578	Maison Martin Margiela	MaisonMartinMargiela	\N
579	Maison Scotch	MaisonScotch	\N
580	Majestic Filatures	MajesticFilatures	\N
581	Maliparmi	Maliparmi	\N
582	Mallzee	Mallzee	\N
583	Mandarina Duck	MandarinaDuck	\N
584	Mangano	Mangano	\N
585	Mango	Mango	\N
586	Manila Grace	ManilaGrace	\N
587	Manuel Ritz	ManuelRitz	\N
588	Marc Jacobs	MarcJacobs	\N
589	Marc O'Polo	MarcOPolo	\N
590	Marcelo Burlon	MarceloBurlon	\N
591	Marco Tozzi	MarcoTozzi	\N
592	Maria Grazia Severi	MariaGraziaSeveri	\N
593	Marimekko	Marimekko	\N
594	Marina Rinaldi	MarinaRinaldi	\N
595	Marni	Marni	\N
596	Marsèll	Marsèll	\N
597	Mauro Grifoni	MauroGrifoni	\N
598	Mavi Jeans	MaviJeans	\N
599	Max Mara	MaxMara	\N
600	Max Studio	MaxStudio	\N
601	MCS	MCS	\N
602	Meltin Pot	MeltinPot	\N
603	Merc Clothing	MercClothing	\N
604	Merci	Merci	\N
605	Messagerie	Messagerie	\N
606	Met	Met	\N
607	Mexx	Mexx	\N
608	Michael Coal	MichaelCoal	\N
609	Michael Kors	MichaelKors	\N
610	Michael Michael Kors	MichaelMichaelKors	\N
611	Microbe	Microbe	\N
612	Mih Jeans	MihJeans	\N
613	Minimum	Minimum	\N
614	Miss Grant	MissGrant	\N
615	Missoni	Missoni	\N
616	Miu Miu	MiuMiu	\N
617	Miuniku	Miuniku	\N
618	Moncler	Moncler	\N
619	Monica Vinader	MonicaVinader	\N
620	Monnalisa	Monnalisa	\N
621	Moods of Norway	MoodsofNorway	\N
622	Morgan	Morgan	\N
623	Morphsuits	Morphsuits	\N
624	MoschinoMsgm	MoschinoMsgm	\N
625	Mudd Jeans	MuddJeans	\N
626	Muddy Puddles	MuddyPuddles	\N
627	Mustang	Mustang	\N
628	Myths	Myths	\N
629	N.Peal	NPeal	\N
630	Nafnaf	Nafnaf	\N
631	Nakkna	Nakkna	\N
632	Name It	NameIt	\N
633	Nanán	Nanán	\N
634	Napapijri	Napapijri	\N
635	Natasha Zinko	NatashaZinko	\N
636	Naturino	Naturino	\N
637	NBD	NBD	\N
638	Neck & Neck	NeckNeck	\N
639	Neil Barrett	NeilBarrett	\N
640	Neill Katter	NeillKatter	\N
641	New Balance	NewBalance	\N
642	New Era	NewEra	\N
643	New Look	NewLook	\N
644	New York Industrie	NewYorkIndustrie	\N
645	Nicholas Kirkwood	NicholasKirkwood	\N
646	Nike	Nike	\N
647	Nila & Nila	NilaNila	\N
648	Nili Lotan	NiliLotan	\N
649	Nina RicciNine In The Morning	NinaRicciNineInTheMorning	\N
650	Nixon	Nixon	\N
651	No Ka'Oi	NoKaOi	\N
652	No Secrets World	NoSecretsWorld	\N
653	NOBODINOZ	NOBODINOZ	\N
654	Noir	Noir	\N
655	Noisy May	NoisyMay	\N
656	Noko Jeans	NokoJeans	\N
657	Nolita Lace	NolitaLace	\N
658	Noppies	Noppies	\N
659	Nora Barth	NoraBarth	\N
660	Norma Kamali	NormaKamali	\N
661	NORMANN COPENHAGEN	NORMANNCOPENHAGEN	\N
662	Norse Projects	NorseProjects	\N
663	North Sails	NorthSails	\N
664	Notch	Notch	\N
665	Nouvelles Images	NouvellesImages	\N
666	NR Rapisardi	NRRapisardi	\N
667	Nude	Nude	\N
668	Nudie Jeans	NudieJeans	\N
669	Numero 74	Numero74	\N
670	N°21	N°21	\N
671	Nümph	Nümph	\N
672	O.X.S.	OXS	\N
673	Oakley	Oakley	\N
674	Oaks	Oaks	\N
675	Oaks Lighting	OaksLighting	\N
676	OAMC	OAMC	\N
677	ObeyOBLIQUE CREATIONS	ObeyOBLIQUECREATIONS	\N
678	OBVIOUS BASIC	OBVIOUSBASIC	\N
679	Odd Molly	OddMolly	\N
680	Odi Et Amo	OdiEtAmo	\N
681	Off-white	Off-white	\N
682	Office Hippo	OfficeHippo	\N
683	Officina 36	Officina36	\N
684	Officine Creative	OfficineCreative	\N
685	Officine Creative Italia	OfficineCreativeItalia	\N
686	Officine Generale	OfficineGenerale	\N
687	OGGI	OGGI	\N
688	Oilily	Oilily	\N
689	Oliver Peoples	OliverPeoples	\N
690	Olsen	Olsen	\N
691	OLYMPIAH	OLYMPIAH	\N
692	OnePiece	OnePiece	\N
693	Ong Shunmugam	OngShunmugam	\N
694	Onia	Onia	\N
695	Only	Only	\N
696	Only & Sons	OnlySons	\N
697	Ontour	Ontour	\N
698	Opening Ceremony	OpeningCeremony	\N
699	OPUS	OPUS	\N
700	Orca	Orca	\N
701	Orciani	Orciani	\N
702	Original Penguin	OriginalPenguin	\N
703	Original Vintage Style	OriginalVintageStyle	\N
704	Orlebar Brown	OrlebarBrown	\N
705	Oroscuro	Oroscuro	\N
706	Oscar De La Renta	OscarDeLaRenta	\N
707	Osklen	Osklen	\N
708	Osman	Osman	\N
709	Osram	Osram	\N
710	ottod´Ame	ottod´Ame	\N
711	Our Legacy	OurLegacy	\N
712	Ovye By Cristina Lucchi	OvyeByCristinaLucchi	\N
713	Oxo	Oxo	\N
714	P.A.R.O.S.H.	PAROSH	\N
715	Pal Zileri	PalZileri	\N
716	Palm Angels	PalmAngels	\N
717	Paloma Barceló	PalomaBarceló	\N
718	Pantaloni Torino	PantaloniTorino	\N
719	Pantofola D'oro	PantofolaDoro	\N
720	Paola Frani	PaolaFrani	\N
721	Paolo Pecora	PaoloPecora	\N
722	Paoloni	Paoloni	\N
723	Patrizia Pepe	PatriziaPepe	\N
724	Paul & Joe	PaulJoe	\N
725	Paul Smith	PaulSmith	\N
726	Paule Ka	PauleKa	\N
727	Pendleton Woolen Mills	PendletonWoolenMills	\N
728	Pennyblack	Pennyblack	\N
729	People	People	\N
730	Pepe Jeans	PepeJeans	\N
731	Pepe Jeans London	PepeJeansLondon	\N
732	PESERICO	PESERICO	\N
733	Peter Hahn	PeterHahn	\N
734	Peter Pilotto	PeterPilotto	\N
735	Petit Bateau	PetitBateau	\N
736	Peuterey	Peuterey	\N
737	Philipp Plein	PhilippPlein	\N
738	Philippe Model	PhilippeModel	\N
739	Philips	Philips	\N
740	Philosophy di Lorenzo Serafini	PhilosophydiLorenzoSerafini	\N
741	Pianurastudio	Pianurastudio	\N
742	Pieces	Pieces	\N
743	Pierre Hardy	PierreHardy	\N
744	Pingoo Prints	PingooPrints	\N
745	Pinko	Pinko	\N
746	Plein Sport	PleinSport	\N
747	Plein Sud	PleinSud	\N
748	Police	Police	\N
749	Pollini	Pollini	\N
750	Polly Flinders	PollyFlinders	\N
751	Polo Ralph Lauren	PoloRalphLauren	\N
752	Prada	Prada	\N
753	Preen	Preen	\N
754	Premiata	Premiata	\N
755	Premier Housewares	PremierHousewares	\N
756	Proenza Schouler	ProenzaSchouler	\N
757	Project D	ProjectD	\N
758	PT01	PT01	\N
759	Puma	Puma	\N
760	Q/S designed by	QSdesignedby	\N
761	Q/S designed by - s.Oliver	QSdesignedby-sOliver	\N
762	Q1	Q1	\N
763	Q2	Q2	\N
764	Qasimi	Qasimi	\N
765	Qcqc	Qcqc	\N
766	Qdo	Qdo	\N
767	Qed London	QedLondon	\N
768	QEEBOO	QEEBOO	\N
769	Ql2 Quelledue	Ql2Quelledue	\N
770	Qu4ttro	Qu4ttro	\N
771	Quail	Quail	\N
772	Qualy	Qualy	\N
773	Quantum Courage	QuantumCourage	\N
774	QUATTRO.DECIMI	QUATTRODECIMI	\N
775	Quattrobarradodici	Quattrobarradodici	\N
776	Quax	Quax	\N
777	Quay Eyeware	QuayEyeware	\N
778	Quayside	Quayside	\N
779	Queen	Queen	\N
780	Queen Bee	QueenBee	\N
781	Queen Mum	QueenMum	\N
782	Queen Of Love	QueenOfLove	\N
783	Queene and Belle	QueeneandBelle	\N
784	Queens	Queens	\N
785	Queensway	Queensway	\N
786	Querini	Querini	\N
787	Quest	Quest	\N
788	Quetsche	Quetsche	\N
789	Quid	Quid	\N
790	Quiksilver	Quiksilver	\N
791	Quintessence	Quintessence	\N
792	QUIS QUIS	QUISQUIS	\N
793	Quiz	Quiz	\N
794	Quoddy	Quoddy	\N
795	Quodlibet	Quodlibet	\N
796	Qupid	Qupid	\N
797	QURE	QURE	\N
798	Quttin	Quttin	\N
799	R13	R13	\N
800	Rag & Bone	RagBone	\N
801	Rajrang	Rajrang	\N
802	Ralph Lauren	RalphLauren	\N
803	Raoul	Raoul	\N
804	Ray-Ban	Ray-Ban	\N
805	RBV BIRKMANN	RBVBIRKMANN	\N
806	Re-hash	Re-hash	\N
807	Re/Done	ReDone	\N
808	Real Gold	RealGold	\N
809	Rebecca Minkoff	RebeccaMinkoff	\N
810	Red Valentino	RedValentino	\N
811	Red(v)	Red(v)	\N
812	Reebok	Reebok	\N
813	Reflect-please	Reflect-please	\N
814	RefrigiWear	RefrigiWear	\N
815	Reiss	Reiss	\N
816	Relaxdays	Relaxdays	\N
817	Religion	Religion	\N
818	Relish	Relish	\N
819	Renaissance 2000	Renaissance2000	\N
820	Replay	Replay	\N
821	Rick Owens	RickOwens	\N
822	Rieker	Rieker	\N
823	Rip Curl	RipCurl	\N
824	Riva Paoletti	RivaPaoletti	\N
825	River Island	RiverIsland	\N
826	Robert Clergerie	RobertClergerie	\N
827	Roberto Cavalli	RobertoCavalli	\N
828	Roberto Collina	RobertoCollina	\N
829	Roberto Festa Milano	RobertoFestaMilano	\N
830	Rochas	Rochas	\N
831	Roda	Roda	\N
832	Rodo	Rodo	\N
833	Roger Vivier	RogerVivier	\N
834	Roksanda Ilincic	RoksandaIlincic	\N
835	Roland Mouret	RolandMouret	\N
836	Rosasen	Rosasen	\N
837	Rossopuro	Rossopuro	\N
838	Roy Rogers	RoyRogers	\N
839	Royal Republiq	RoyalRepubliq	\N
840	Rta	Rta	\N
841	Ruco Line	RucoLine	\N
842	Rufskin	Rufskin	\N
843	Rêve En Vert	RêveEnVert	\N
844	S.E.H Kelly	SEHKelly	\N
845	s.Oliver	sOliver	\N
846	SABA	SABA	\N
847	sacai	sacai	\N
848	Saint Laurent	SaintLaurent	\N
849	Saint Tropez	SaintTropez	\N
850	Sakis Rouvas Collection	SakisRouvasCollection	\N
851	Salvatore Ferragamo	SalvatoreFerragamo	\N
852	Salvatore Ferragamo S.p.A.	SalvatoreFerragamoSpA	\N
853	Sanetta	Sanetta	\N
854	Santoni	Santoni	\N
855	Schiesser	Schiesser	\N
856	Schutz	Schutz	\N
857	Scotch & Soda	ScotchSoda	\N
858	Scotch and Soda	ScotchandSoda	\N
859	See By Chloé	SeeByChloé	\N
860	Selected	Selected	\N
861	Sendmeamirror	Sendmeamirror	\N
862	Sergio Rossi	SergioRossi	\N
863	Seventy	Seventy	\N
864	Shiatzy Chen	ShiatzyChen	\N
865	Silver Jeans Co.	SilverJeansCo	\N
866	Silvian Heach	SilvianHeach	\N
867	Simonetta	Simonetta	\N
868	SINOIAN	SINOIAN	\N
869	Siviglia	Siviglia	\N
870	Six Deuce	SixDeuce	\N
871	Sixpack France	SixpackFrance	\N
872	Skechers	Skechers	\N
873	Snobby Sheep	SnobbySheep	\N
874	Soleil d'Ocre	SoleildOcre	\N
875	Sonia Rykiel	SoniaRykiel	\N
876	Sophie Paris Vietnam	SophieParisVietnam	\N
877	Space Style Concept	SpaceStyleConcept	\N
878	Springfield	Springfield	\N
879	Star in the Hood	StarintheHood	\N
880	Star Wars	StarWars	\N
881	Starworld	Starworld	\N
882	Stefanel	Stefanel	\N
883	Stella McCartney	StellaMcCartney	\N
884	Sterntaler	Sterntaler	\N
885	Steve Madden	SteveMadden	\N
886	Stick It On Your Wall	StickItOnYourWall	\N
887	Street One	StreetOne	\N
888	Strellson	Strellson	\N
889	Stuart Weitzman	StuartWeitzman	\N
890	Stupell Industries	StupellIndustries	\N
891	Sun 68	Sun68	\N
892	Sundek	Sundek	\N
893	Suoli	Suoli	\N
894	Super Cool Creations	SuperCoolCreations	\N
895	Superdry	Superdry	\N
896	Superga	Superga	\N
897	Swear	Swear	\N
898	T-fal	T-fal	\N
899	Tagliatore	Tagliatore	\N
900	Taifun	Taifun	\N
901	Takeo Kikuchi	TakeoKikuchi	\N
902	Tally WeijlTamaki niime	TallyWeijlTamakiniime	\N
903	Tamaris	Tamaris	\N
904	Tarocash	Tarocash	\N
905	Ted Baker	TedBaker	\N
906	Tescoma	Tescoma	\N
907	The Art Group	TheArtGroup	\N
908	The Fashion Bible	TheFashionBible	\N
909	The Oliver Gal Artist Co.	TheOliverGalArtistCo	\N
910	The Row	TheRow	\N
911	The Stupell Home Décor Collection	TheStupellHomeDécorCollection	\N
912	Theory	Theory	\N
913	Think	Think	\N
914	Thom Browne	ThomBrowne	\N
915	Thomas Sabo	ThomasSabo	\N
916	Three Gun	ThreeGun	\N
917	Tibi	Tibi	\N
918	Tiffany & Co.	TiffanyCo	\N
919	Tiger of Sweden	TigerofSweden	\N
920	Tigha	Tigha	\N
921	Timberland	Timberland	\N
922	TNT	TNT	\N
923	Tod's	Tods	\N
924	Tom Ford	TomFord	\N
925	Tom Tailor	TomTailor	\N
926	Tombolini	Tombolini	\N
927	Tommy Hilfiger	TommyHilfiger	\N
928	Tommy Jeans	TommyJeans	\N
929	Tonello	Tonello	\N
930	Tony Rubino	TonyRubino	\N
931	Tory Burch	ToryBurch	\N
932	Tosca Blu	ToscaBlu	\N
933	Toy G	ToyG	\N
934	Trands	Trands	\N
935	Trendhim	Trendhim	\N
936	Trio Leuchten	TrioLeuchten	\N
937	Triumph	Triumph	\N
938	True Religion	TrueReligion	\N
939	Truenyc	Truenyc	\N
940	Trussardi	Trussardi	\N
941	Twin-Set	Twin-Set	\N
942	Twisted Envy	TwistedEnvy	\N
943	U.S.Polo Association	USPoloAssociation	\N
944	UCLIC	UCLIC	\N
945	UGG	UGG	\N
946	Ugo Cacciatori	UgoCacciatori	\N
947	Ulla Johnson	UllaJohnson	\N
948	Ulla Popken	UllaPopken	\N
949	Ultra Chic	UltraChic	\N
950	Ultracor	Ultracor	\N
951	Uma	Uma	\N
952	Uma Wang	UmaWang	\N
953	Umbra	Umbra	\N
954	Umbro	Umbro	\N
955	Umd	Umd	\N
956	Umit Benan	UmitBenan	\N
957	Un-Namable	Un-Namable	\N
958	Unconditional	Unconditional	\N
959	Under Armour	UnderArmour	\N
960	Undercover	Undercover	\N
961	Uniform	Uniform	\N
962	Uniform Wares	UniformWares	\N
963	Unique21	Unique21	\N
964	Unisa	Unisa	\N
965	United Curtain Co.	UnitedCurtainCo	\N
966	United Nude	UnitedNude	\N
967	Unity	Unity	\N
968	Universal Works	UniversalWorks	\N
969	UNKL347	UNKL347	\N
970	UNLACE	UNLACE	\N
971	Unlimited	Unlimited	\N
972	Unravel	Unravel	\N
973	Unze	Unze	\N
974	Unützer	Unützer	\N
975	Uomolebole	Uomolebole	\N
976	Up Jeans	UpJeans	\N
977	Up To Be	UpToBe	\N
978	Urban Classic	UrbanClassic	\N
979	Urban Code	UrbanCode	\N
980	URBAN LES HOMMES	URBANLESHOMMES	\N
981	Urban Male	UrbanMale	\N
982	Uta Raasch	UtaRaasch	\N
983	Vagabond	Vagabond	\N
984	Valentino	Valentino	\N
985	Valextra	Valextra	\N
986	Vallila	Vallila	\N
987	Vanessa Bruno	VanessaBruno	\N
988	Vanessa Scott	VanessaScott	\N
989	Vans	Vans	\N
990	VB Rocks	VBRocks	\N
991	VDP Collection	VDPCollection	\N
992	Velvet	Velvet	\N
993	Vent du Sud	VentduSud	\N
994	Vero Moda	VeroModa	\N
995	VERSA	VERSA	\N
996	Versace	Versace	\N
997	Versace Jeans Couture	VersaceJeansCouture	\N
998	Versus	Versus	\N
999	VETEMENTS	VETEMENTS	\N
1000	Via Appia Due	ViaAppiaDue	\N
1001	Vic Matié	VicMatié	\N
1002	Vicini	Vicini	\N
1003	Vicolo	Vicolo	\N
1004	Victoria	Victoria	\N
1005	Victoria Beckham	VictoriaBeckham	\N
1006	VIDA	VIDA	\N
1007	Viking	Viking	\N
1008	Vila	Vila	\N
1009	VilebrequinVilla D'Este Home Tivoli	VilebrequinVillaDEsteHomeTivoli	\N
1010	Villeroy & Boch	VilleroyBoch	\N
1011	VILSHENKO	VILSHENKO	\N
1012	Vince	Vince	\N
1013	Vingino	Vingino	\N
1014	Vintage De Luxe	VintageDeLuxe	\N
1015	Vionnet	Vionnet	\N
1016	Visvim	Visvim	\N
1017	Vivance	Vivance	\N
1018	Vivetta	Vivetta	\N
1019	Vivienne Westwood	VivienneWestwood	\N
1020	Vix	Vix	\N
1021	Vneck	Vneck	\N
1022	W118 by Walter Baker	W118byWalterBaker	\N
1023	Waldläufer	Waldläufer	\N
1024	Wall Art	WallArt	\N
1025	Wall Smart Designs	WallSmartDesigns	\N
1026	Wallis	Wallis	\N
1027	Walplus	Walplus	\N
1028	Walter Baker	WalterBaker	\N
1029	Walther Design	WaltherDesign	\N
1030	Warehouse	Warehouse	\N
1031	Wash+Dry	WashDry	\N
1032	Weekday	Weekday	\N
1033	Weili Zheng	WeiliZheng	\N
1034	WENKO	WENKO	\N
1035	WESC	WESC	\N
1036	WESCO	WESCO	\N
1037	Westmark	Westmark	\N
1038	What For	WhatFor	\N
1039	Whats On Your Wall	WhatsOnYourWall	\N
1040	Wheat	Wheat	\N
1041	White Mountaineering	WhiteMountaineering	\N
1042	White Sand 88	WhiteSand88	\N
1043	White Stuff Clothing	WhiteStuffClothing	\N
1044	Who*s Who	Who*sWho	\N
1045	Whyred	Whyred	\N
1046	Wildfox	Wildfox	\N
1047	Wilton	Wilton	\N
1048	Windsor Smith	WindsorSmith	\N
1049	Wise Guy	WiseGuy	\N
1050	WMF	WMF	\N
1051	Wofi Leuchten	WofiLeuchten	\N
1052	Wolford	Wolford	\N
1053	Women'secret	Womensecret	\N
1054	Won Hundred	WonHundred	\N
1055	Wood Wood	WoodWood	\N
1056	Woodwick	Woodwick	\N
1057	Wool & Co	WoolCo	\N
1058	Woolrich	Woolrich	\N
1059	Wrangler	Wrangler	\N
1060	Wtr London	WtrLondon	\N
1061	Wyldr	Wyldr	\N
1062	Wåven	Wåven	\N
1063	X Bionic	XBionic	\N
1064	X by NBD	XbyNBD	\N
1065	X Loop	XLoop	\N
1066	X Socks	XSocks	\N
1067	X&B XAVEM	XBXAVEM	\N
1068	X-Cape	X-Cape	\N
1069	Xacus	Xacus	\N
1070	Xagon Man	XagonMan	\N
1071	Xander Zhou	XanderZhou	\N
1072	Xandres	Xandres	\N
1073	XAVAX	XAVAX	\N
1074	Xavier Danaud	XavierDanaud	\N
1075	XBAKKO	XBAKKO	\N
1076	XBRAND	XBRAND	\N
1077	Xc-Xacaret	Xc-Xacaret	\N
1078	XConcept	XConcept	\N
1079	Xenia	Xenia	\N
1080	XENIA BOUS	XENIABOUS	\N
1081	Xia Home Fashions	XiaHomeFashions	\N
1082	Ximena Kavalekas	XimenaKavalekas	\N
1083	Xirena	Xirena	\N
1084	Xoos	Xoos	\N
1085	Xs Milano	XsMilano	\N
1086	Xsensible	Xsensible	\N
1087	Xti	Xti	\N
1088	Xtreme	Xtreme	\N
1089	XTSY	XTSY	\N
1090	XX Coss Concept	XXCossConcept	\N
1091	Xyxyx	Xyxyx	\N
1092	XZX-Star	XZX-Star	\N
1093	Y / Project	YProject	\N
1094	Y.A.S	YAS	\N
1095	Y.A.S.	YAS	\N
1096	Y.A.S. Tall	YASTall	\N
1097	YAB	YAB	\N
1098	Yan Simmon	YanSimmon	\N
1099	Yang Li	YangLi	\N
1100	Yankee Candle Company	YankeeCandleCompany	\N
1101	Yasmine Eslami	YasmineEslami	\N
1102	Yeezy by Kanye West	YeezybyKanyeWest	\N
1103	Yellow Cab	YellowCab	\N
1104	Yep	Yep	\N
1105	Yeprem	Yeprem	\N
1106	Yerse	Yerse	\N
1107	Yes London	YesLondon	\N
1108	Yes-Zee	Yes-Zee	\N
1109	Yigal AzrouËl	YigalAzrouËl	\N
1110	Ylati	Ylati	\N
1111	Ymc You Must Create	YmcYouMustCreate	\N
1112	Yohji Yamamoto	YohjiYamamoto	\N
1113	Yoko Design	YokoDesign	\N
1114	Yoon	Yoon	\N
1115	YOSHII	YOSHII	\N
1116	Yosi Samra	YosiSamra	\N
1117	Yosuzi	Yosuzi	\N
1118	Young Versace	YoungVersace	\N
1119	Your Turn	YourTurn	\N
1120	Yours Clothing	YoursClothing	\N
1121	YPNO	YPNO	\N
1122	YPORQUÉ	YPORQUÉ	\N
1123	Yshey	Yshey	\N
1124	Yuliya Magdych	YuliyaMagdych	\N
1125	Yumi	Yumi	\N
1126	Yumi Kim	YumiKim	\N
1127	Yummie Tummie	YummieTummie	\N
1128	Yuul Yie	YuulYie	\N
1129	Yuzefi	Yuzefi	\N
1130	Yves Salomon	YvesSalomon	\N
1131	Yvonne Léon	YvonneLéon	\N
1132	Zac Posen	ZacPosen	\N
1133	Zack	Zack	\N
1134	Zadig & Voltaire	ZadigVoltaire	\N
1135	Zaida	Zaida	\N
1136	Zak designs	Zakdesigns	\N
1137	Zanella	Zanella	\N
1138	Zanellato	Zanellato	\N
1139	Zanetti	Zanetti	\N
1140	Zanetti 1965	Zanetti1965	\N
1141	Zanfrini	Zanfrini	\N
1142	Zanieri	Zanieri	\N
1143	Zanone	Zanone	\N
1144	Zassenhaus	Zassenhaus	\N
1145	Zeal	Zeal	\N
1146	Zebra	Zebra	\N
1147	ZEBRA TEXTIL	ZEBRATEXTIL	\N
1148	Zeferino	Zeferino	\N
1149	ZELLER	ZELLER	\N
1150	Zenker	Zenker	\N
1151	Zenobi	Zenobi	\N
1152	ZEP	ZEP	\N
1153	Zero + Maria Cornejo	ZeroMariaCornejo	\N
1154	Zero Construction	ZeroConstruction	\N
1155	Zeus + Dione	ZeusDione	\N
1156	Zeynep Arcay	ZeynepArcay	\N
1157	Zhelda	Zhelda	\N
1158	Ziggy Chen	ZiggyChen	\N
1159	Zilverstad	Zilverstad	\N
1160	Zimmerli	Zimmerli	\N
1161	Zimmermann	Zimmermann	\N
1162	Zinda	Zinda	\N
1163	Zippo	Zippo	\N
1164	Zippy	Zippy	\N
1165	Zizzi	Zizzi	\N
1166	Zoe Karssen	ZoeKarssen	\N
1167	Zucca	Zucca	\N
1168	Zuhair Murad	ZuhairMurad	\N
1169	Zwilling	Zwilling	\N
1170	Zyliss	Zyliss	\N
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: webshop; Owner: postgres
--

COPY webshop.sizes (id, gender, category, size, size_us, size_uk, size_eu) FROM stdin;
1	female	Apparel	XS	[2,4)	[4,6)	[32,36)
2	female	Apparel	S	[4,6)	[6,10)	[36,40)
3	female	Apparel	M	[6,8)	[10,14)	[40,44)
4	female	Apparel	L	[8,10)	[14,18)	[44,46)
5	female	Apparel	XL	[10,12)	[18,22)	[46,50)
6	male	Apparel	XS	[30,32)	[30,32)	[40,42)
7	male	Apparel	S	[32,36)	[32,36)	[42,48)
8	male	Apparel	M	[36,40)	[36,40)	[48,50)
9	male	Apparel	L	[40,44)	[40,44)	[50,54)
10	male	Apparel	XL	[44,50)	[44,50)	[54,58)
11	unisex	Footwear	XS	[6,7)	[5,6)	[38,40)
12	unisex	Footwear	S	[7,8)	[6,7)	[40,42)
13	unisex	Footwear	M	[7,9)	[7,8)	[42,43)
14	unisex	Footwear	L	[9,10)	[8,9)	[43,44)
15	unisex	Footwear	XL	[10,11)	[9,10)	[44,45)
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.address_id_seq', 1132, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.articles_id_seq', 18522, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.colors_id_seq', 145, true);


--
-- Name: customer_id_seq1; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.customer_id_seq1', 1101, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.labels_id_seq', 1170, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.order_id_seq', 2010, true);


--
-- Name: order_positions_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.order_positions_id_seq', 5994, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.products_id_seq', 1049, true);


--
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.sizes_id_seq', 15, true);


--
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.stock_id_seq', 17730, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
