--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: parks; Type: TABLE; Schema: public; Owner: cooper
--

CREATE TABLE parks (
    park_id integer NOT NULL,
    park_name character varying(100) NOT NULL,
    address character varying(100),
    latitude numeric,
    longitude numeric,
    on_leash boolean,
    off_leash_enclosed boolean,
    off_leash_unenclosed boolean,
    park_url character varying(100)
);


ALTER TABLE parks OWNER TO cooper;

--
-- Name: parks_park_id_seq; Type: SEQUENCE; Schema: public; Owner: cooper
--

CREATE SEQUENCE parks_park_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parks_park_id_seq OWNER TO cooper;

--
-- Name: parks_park_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cooper
--

ALTER SEQUENCE parks_park_id_seq OWNED BY parks.park_id;


--
-- Name: park_id; Type: DEFAULT; Schema: public; Owner: cooper
--

ALTER TABLE ONLY parks ALTER COLUMN park_id SET DEFAULT nextval('parks_park_id_seq'::regclass);


--
-- Data for Name: parks; Type: TABLE DATA; Schema: public; Owner: cooper
--

COPY parks (park_id, park_name, address, latitude, longitude, on_leash, off_leash_enclosed, off_leash_unenclosed, park_url) FROM stdin;
1	ParkName	\N	\N	\N	t	\N	\N	\N
2	ESPRIT PARK	\N	\N	\N	t	\N	\N	\N
3	HOLLY PARK	\N	\N	\N	t	\N	\N	\N
4	Hunter's Point Recreation Center	200 Middle Point Rd	37.73735	-122.37834	t	\N	\N	\N
5	HYDE/VALLEJO MINI PARK	Hyde	37.79763564	-122.41910564	t	\N	\N	\N
6	INA COOLBRITH MINI PARK	Vallejo	37.79816473	-122.41338371	t	\N	\N	\N
7	INDIA BASIN SHORELINE PARK	Evans	37.73366342	-122.37371901	t	\N	\N	\N
8	INTERIOR GREEN BELT	Belmont	37.7585442	-122.45319935	t	\N	\N	\N
12	JAPANTOWN PEACE PLAZA	Post	37.78520911	-122.42975098	t	\N	\N	\N
16	JOOST/BADEN MINI PARK	Joost	37.73273279	-122.4408417	t	\N	\N	\N
18	JOSEPH CONRAD MINI PARK	601 Beach St	37.80667244	-122.41906274	t	\N	\N	\N
19	JOSEPH L. ALIOTO PERFORMING ARTS PIAZZA	Grove	37.77948045	-122.4175995	t	\N	\N	\N
20	JOSEPH LEE RECREATION CENTER	1395 Mendell St	37.73453491	-122.389412	t	\N	\N	\N
23	JURI COMMONS	Guerrero	37.74950391	-122.42199245	t	\N	\N	\N
24	JUSTIN HERMAN/EMBARCADERO PLAZA	Clay	37.79487978	-122.39476577	t	\N	\N	\N
25	KELLOCH VELASCO MINI PARK	Kelloch	37.70854271	-122.41314877	t	\N	\N	\N
26	KID POWER PARK	45 Hoff St	37.76415431	-122.42027989	t	\N	\N	\N
27	KITE HILL	Yukon	37.75824114	-122.44166171	t	\N	\N	\N
28	10TH AVE/CLEMENT MINI PARK	351 9th Ave	37.78184397	-122.46809908	t	\N	\N	\N
29	15TH AVENUE STEPS	15th Ave b w Kirkham	37.75956493	-122.47226783	t	\N	\N	\N
30	24TH/YORK MINI PARK	24th	37.75306042	-122.40857543	t	\N	\N	\N
31	29TH/DIAMOND OPEN SPACE	Diamond	37.74360211	-122.43523589	t	\N	\N	\N
32	ADAM ROGERS PARK	Ingalls	37.73101645	-122.38385466	t	\N	\N	\N
35	ALICE MARBLE TENNIS COURTS	Greenwich	37.80142776	-122.42034327	t	\N	\N	\N
36	ALIOTO MINI PARK	20th	37.75890196	-122.41821702	t	\N	\N	\N
42	MT DAVIDSON PARK	\N	\N	\N	t	\N	\N	\N
44	TELEGRAPH HILL/PIONEER PARK	\N	\N	\N	t	\N	\N	\N
45	BALBOA NATURAL AREA	Balboa	37.77591285	-122.51103949	t	\N	\N	\N
46	BALBOA PARK	Ocean	37.72494861	-122.44462659	t	\N	\N	\N
47	BAY VIEW PARK	\N	\N	\N	t	\N	\N	\N
49	BEIDEMAN/O'FARRELL MINI PARK	O'Farrell	37.78238894	-122.43861654	t	\N	\N	\N
50	BERKELEY WAY OPEN SPACE	298 Berkeley Wy	37.73956697	-122.43995903	t	\N	\N	\N
52	BERNAL HEIGHTS RECREATION CENTER	500 Moultrie	37.73844636	-122.41615685	t	\N	\N	\N
53	BILLY GOAT HILL	30th	37.74140787	-122.43319872	t	\N	\N	\N
54	BROADWAY TUNNEL EAST MINI PARK	BRdway	37.79699682	-122.412901	t	\N	\N	\N
55	BROADWAY TUNNEL WEST MINI PARK	1201 Broadway	37.79643576	-122.41742319	t	\N	\N	\N
56	BROOKS PARK	373 Ramsell St	37.71727397	-122.46676875	t	\N	\N	\N
57	BROTHERHOOD/CHESTER MINI PARK	501 Brotherhood Wy	37.71238249	-122.46990318	t	\N	\N	\N
58	MT OLYMPUS	\N	\N	\N	t	\N	\N	\N
59	BUCHANAN STREET MALL	Buchanan	37.77949531	-122.42856481	t	\N	\N	\N
61	BUSH/BRODERICK MINI PARK	Baker	37.78557814	-122.44253511	t	\N	\N	\N
63	CAMP MATHER	32560 Mather Rd	37.88160218	-119.85076005	t	\N	\N	\N
64	CARL LARSEN PARK	19th Ave	37.73929782	-122.47596603	t	\N	\N	\N
66	CAYUGA/LAMARTINE MINI PARK	Cayuga	37.73033758	-122.43294264	t	\N	\N	\N
67	CHESTNUT/KEARNY OPEN SPACE	Chestnut	37.80454125	-122.4070907	t	\N	\N	\N
68	CHINESE RECREATION CENTER	1101 Washington St	37.79420965	-122.41178577	t	\N	\N	\N
69	COLERIDGE MINI PARK	Coleridge	37.74442266	-122.41966647	t	\N	\N	\N
70	COLLIS P. HUNTINGTON PARK	California	37.79216576	-122.41215294	t	\N	\N	\N
72	COSO/PRECITA MINI PARK	Coso	37.74624354	-122.41812033	t	\N	\N	\N
73	COTTAGE ROW MINI PARK	Sutter	37.78657099	-122.4323102	t	\N	\N	\N
76	DIAMOND/FARNUM OPEN SPACE	Diamond	37.73880241	-122.43431084	t	\N	\N	\N
77	DOROTHY ERSKINE PARK	Martha	37.73391249	-122.43944536	t	\N	\N	\N
80	DUNCAN/CASTRO OPEN SPACE	Duncan	37.74594931	-122.43339409	t	\N	\N	\N
81	DUPONT COURTS	336 31st Ave	37.78268787	-122.4908331	t	\N	\N	\N
82	EDGEHILL MOUNTAIN	Edgehill	37.74203025	-122.45976472	t	\N	\N	\N
84	EVERSON/DIGBY LOTS	61 Everson St	37.73807643	-122.43177574	t	\N	\N	\N
86	FAIRMOUNT PLAZA	Miquel	37.73849226	-122.42913147	t	\N	\N	\N
87	FATHER ALFRED E. BOEDDEKER PARK	295 Eddy St	37.78439513	-122.4120591	t	\N	\N	\N
88	FAY PARK	2366 Leavenworth St	37.80289031	-122.4178443	t	\N	\N	\N
89	FILLMORE/TURK MINI PARK	Fillmore	37.78018588	-122.43178038	t	\N	\N	\N
79	DUBOCE PARK	Duboce	37.769615	-122.43342784	t	f	t	http://sfrecpark.org/destination/duboce-park/duboce-park-dog-play-area/
60	BUENA VISTA PARK	Buena Vista	37.7685639	-122.44137945	t	f	t	http://sfrecpark.org/destination/buena-vista-park/buena-vista-dog-play-area/
71	CORONA HEIGHTS	Roosevelt	37.76497671	-122.43879691	t	f	t	http://sfrecpark.org/destination/corona-heights-park/corona-heights-dog-play-area/
83	EUREKA VALLEY REC CENTER	100 Collingwood St	37.75978957	-122.43648069	t	t	f	http://sfrecpark.org/destination/eureka-valley-rec-center/eureka-valley-dog-play-area/
15	JOHN MCLAREN PARK	Mansell	37.7180842	-122.41907209	t	f	t	http://sfrecpark.org/destination/john-mclaren-park/mclaren-amphitheatre-dog-play-area/
37	ALLYNE PARK	2609 Gough St	37.79746066	-122.42759992	t	t	f	http://www.sfparksalliance.org/our-parks/parks/allyne-park
90	FRANKLIN SQUARE	16th	37.76501506	-122.4093148	t	\N	\N	\N
92	GARFIELD SQUARE	26th	37.75020058	-122.4122356	t	\N	\N	\N
93	GENE FRIEND REC CENTER	270 6th St	37.77863929	-122.40635191	t	\N	\N	\N
94	GENEVA AVENUE STRIP	600 Geneva	37.72046082	-122.44546412	t	\N	\N	\N
97	GLEN PARK	Elk St	37.7400257	-122.44273225	t	\N	\N	\N
98	GOLDEN GATE HEIGHTS PARK	12th Ave (off Pacheco	37.74998538	-122.46940674	t	\N	\N	\N
99	GOLDEN GATE PARK	Stanyan	37.76905891	-122.48094821	t	\N	\N	\N
105	GOLDEN GATE PARK - Section 6	\N	\N	\N	t	\N	\N	\N
106	GOLDEN GATE/STEINER MINI PARK	Golden Gate	37.77958265	-122.43345152	t	\N	\N	\N
107	GRAND VIEW OPEN SPACE	15th Ave	37.75507227	-122.47235155	t	\N	\N	\N
108	GRAND VIEW PARK	Moraga	37.75646571	-122.47180128	t	\N	\N	\N
110	HAMILTON REC CENTER	1900 Geary Blvd	37.78441485	-122.43603929	t	\N	\N	\N
111	HAWK HILL	14th Ave Rivera	37.74657651	-122.46872941	t	\N	\N	\N
116	HILLTOP PARK	La Salle	37.73291728	-122.38347479	t	\N	\N	\N
117	KOSHLAND PARK	Page	37.77324835	-122.42672942	t	\N	\N	\N
120	LAKEVIEW/ASHTON MINI PARK	Ashton	37.71809145	-122.4625727	t	\N	\N	\N
122	LECONTE MINI PARK	845 Meade St	37.71765613	-122.3958507	t	\N	\N	\N
123	LESSING/SEARS MINI PARK	Sickles	37.70860406	-122.4553029	t	\N	\N	\N
124	LINCOLN PARK	34th Ave	37.78423843	-122.49838278	t	\N	\N	\N
125	LITTLE HOLLYWOOD PARK	Lathrop	37.70996909	-122.39820878	t	\N	\N	\N
127	LOWER GREAT HIGHWAY	Great Highway	37.74928062	-122.50817528	t	\N	\N	\N
129	MARITIME PLAZA	285 Washington St	37.79560513	-122.39923889	t	\N	\N	\N
130	MCCOPPIN SQUARE	24th	37.74382723	-122.48007959	t	\N	\N	\N
135	MINNIE & LOVIE WARD REC CENTER	650 Capitol	37.71577016	-122.45757024	t	\N	\N	\N
139	MISSION REC CENTER	2450 Harrison St	37.75813659	-122.41292225	t	\N	\N	\N
140	MOSCONE RECREATION CENTER	1800 Chestnut St	37.8021249	-122.43313532	t	\N	\N	\N
142	MULLEN/PERALTA MINI PARK	Mullen	37.74607638	-122.40880708	t	\N	\N	\N
143	MURIEL LEFF MINI PARK	7th Ave between Geary	37.78006464	-122.46500795	t	\N	\N	\N
144	NOE VALLEY COURTS	24th	37.75140324	-122.43892096	t	\N	\N	\N
145	O'SHAUGHNESSY HOLLOW	\N	\N	\N	t	\N	\N	\N
146	PAGE/LAGUNA MINI PARK	Page	37.77346139	-122.42524781	t	\N	\N	\N
147	PALACE OF FINE ARTS	3601 Lyon St &amp; Marina Blvd	37.80299898	-122.44851272	t	\N	\N	\N
148	PALEGA RECREATION CENTER	500 Felton St	37.72934205	-122.40978	t	\N	\N	\N
149	PALOU/PHELPS PARK	Palou	37.73551382	-122.39472336	t	\N	\N	\N
150	PARK PRESIDIO BLVD	\N	\N	\N	t	\N	\N	\N
151	PARKSIDE SQUARE	28th Ave	37.73794781	-122.48390596	t	\N	\N	\N
152	PARQUE NINOS UNIDOS	23rd	37.75439053	-122.41356906	t	\N	\N	\N
153	PATRICIAS GREEN IN HAYES VALLEY	btw Hayes	37.77622289	-122.42441307	t	\N	\N	\N
156	PORTOLA OPEN SPACE	201 Portola	37.74707797	-122.44406156	t	\N	\N	\N
157	PORTSMOUTH SQUARE	Washington	37.79483492	-122.40535067	t	\N	\N	\N
158	POTRERO DEL SOL PARK	Potrero	37.75060695	-122.40507971	t	\N	\N	\N
159	POTRERO HILL RECREATION CENTER	801 Arkansas St	37.75613966	-122.39688179	t	\N	\N	\N
160	PRECITA PARK	3200 Folsom St	37.74706232	-122.41202466	t	\N	\N	\N
161	PRENTISS MINI PARK	Prentiss	37.74021712	-122.41187368	t	\N	\N	\N
163	RANDOLPH/BRIGHT MINI PARK	Randolph	37.71451213	-122.46369333	t	\N	\N	\N
166	RICHMOND RECREATION CENTER	251 18th Ave	37.78326998	-122.47797676	t	\N	\N	\N
167	RIDGETOP PLAZA	\N	\N	\N	t	\N	\N	\N
169	ROCK OUTCROPPING	Ortega	37.75384487	-122.47086479	t	\N	\N	\N
171	ROOSEVELT/HENRY STEPS	299 Henry St	37.76655956	-122.43732268	t	\N	\N	\N
172	RUSSIAN HILL OPEN SPACE	Hyde	37.80341611	-122.42075699	t	\N	\N	\N
173	SATURN STREET STEPS	Saturn	37.7626853	-122.44055619	t	\N	\N	\N
174	SELBY/PALOU MINI PARK	Palou	37.73886468	-122.40035293	t	\N	\N	\N
175	SEWARD MINI PARK	Seward	37.75761058	-122.44006058	t	\N	\N	\N
176	SGT. JOHN MACAULAY PARK	Larkin	37.78540001	-122.41819743	t	\N	\N	\N
177	SHARP PARK	1 Sharp Park Rd	37.62439438	-122.48189132	t	\N	\N	\N
113	HEAD/BROTHERHOOD MINI PARK	Head St	37.71262222	-122.46422924	t	f	t	http://sfrecpark.org/destination/head-brotherood-mini-park/headbrotherhood-dog-play-area/
101	GOLDEN GATE PARK - Section 2	\N	37.7744918	-122.4549880	t	f	t	http://sfrecpark.org/destination/golden-gate-park/ggp-dog-play-area-2/
118	LAFAYETTE PARK	Gough	37.79154983	-122.42767158	t	f	t	http://sfrecpark.org/destination/lafayette-park/lafayette-park-dog-play-area/
137	MISSION DOLORES PARK	19th	37.75975506	-122.42709405	t	f	t	http://sfrecpark.org/destination/mission-dolores-park/mission-dolores-park-dog-play-area/
155	PINE LAKE PARK	Sloat Blvd	37.7363086	-122.48592744	t	f	t	http://sfrecpark.org/destination/pine-lake-park/pine-lake-park-dog-play-area/
180	SOUTH PARK	64 Park Ave	37.78157949	-122.39395227	t	\N	\N	\N
182	ST MARY'S REC CENTER	Murray	37.73365828	-122.42064294	t	\N	\N	\N
183	ST MARY'S SQUARE	California St	37.79205617	-122.40511712	t	\N	\N	\N
185	SUE BIERMAN PARK	Clay St	37.79592597	-122.3965106	t	\N	\N	\N
186	SUNNYSIDE CONSERVATORY	Monterey	37.73193576	-122.44076127	t	\N	\N	\N
189	TANK HILL	Clarendon	37.75994801	-122.44768643	t	\N	\N	\N
190	TENDERLOIN CHILDREN'S REC CENTER	570 Ellis St	37.78482103	-122.41540228	t	\N	\N	\N
191	TOPAZ OPEN SPACE	\N	\N	\N	t	\N	\N	\N
192	TURK/HYDE MINI PARK	Hyde	37.78274031	-122.41596297	t	\N	\N	\N
193	TWIN PEAKS	\N	\N	\N	t	\N	\N	\N
194	UNION SQUARE	Post	37.78793122	-122.40750049	t	\N	\N	\N
196	UTAH/18TH MINI PARK	18th	37.76251745	-122.40599759	t	\N	\N	\N
197	VICTORIA MANALO DRAVES PARK	Folsom	37.77700947	-122.40595532	t	\N	\N	\N
198	VISITACION VALLEY GREENWAY	Lel	37.71476638	-122.40613194	t	\N	\N	\N
201	WASHINGTON SQUARE	Filbert	37.80083781	-122.41002829	t	\N	\N	\N
202	WASHINGTON/HYDE MINI PARK	Washington	37.79400955	-122.41740007	t	\N	\N	\N
206	WOH HEI YUEN PARK	922 Jackson St	37.79584858	-122.41033649	t	\N	\N	\N
207	YACHT HARBOR AND MARINA GREEN	\N	\N	\N	t	\N	\N	\N
209	GUY PLACE MINI PARK	4 8 Guy Place	37.7750329000483	-122.41916720030605	t	\N	\N	\N
210	Allendale Park	3711 Suter Street	37.789918897138534	-122.20292351192393	\N	f	\N	\N
213	William Wood Park	2920 McKillop Rd	37.795194252421716	-122.22075897864956	\N	f	\N	\N
214	Willow Mini Park	14th Street &amp; Willow Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
215	Nicol Park	Nicol Avenue &amp; Coolidge Avenue	37.80505999961946	-122.27301999967312	\N	f	\N	\N
216	Morgan Plaza Park	21st Avenue &amp; E 26th Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
217	Concordia Park	2901 64th Avenue	37.77123649879155	-122.1839054142294	\N	f	\N	\N
219	Bertha Port Park	Goss/ Wood/8th Street	37.803656041136094	-122.2826304233808	\N	f	\N	\N
220	Carney Park	10501 Acalanes Drive	37.732515172008334	-122.17824611543995	\N	f	\N	\N
221	Driver [Jasper P.] Plaza	5650 Adeline St	37.840858591963595	-122.27451723043384	\N	f	\N	\N
222	Dover St Park	5707 Dover St	37.842709100258446	-122.26776463023646	\N	f	\N	\N
223	Franklin Plaza	418 22nd St	37.81104819559434	-122.2674302584897	\N	f	\N	\N
224	Piedmont Plaza Park	4182 Piedmont Avenue	37.82726743645258	-122.25120255449562	\N	f	\N	\N
225	Beaconsfield Canyon    	Beaconsfield Pl	37.80505999961946	-122.27301999967312	\N	f	\N	\N
226	Fitzgerald Park	Fitzgerald Street &amp; Peralta Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
227	Dunsmuir Estate Park	61 Covington Street	37.73708459137595	-122.13779900356636	\N	f	\N	\N
228	Oak Park	3239 Kempton Avenue	37.81905693088788	-122.25804295909973	\N	f	\N	\N
229	85th Avenue Mini Park	1712 85th Avenue	37.75521221860567	-122.17382484384497	\N	f	\N	\N
230	Wood Park	2920 McKillop Road	37.795194252421716	-122.22075897864956	\N	f	\N	\N
233	McCrea Park	4460 Shepard Street	37.79220747654878	-122.18277212205689	\N	f	\N	\N
234	Tyrone Carney Park	10501 Acalanes Dr	37.732515172008334	-122.17824611543995	\N	f	\N	\N
235	Dolphin Mini Park	1299 73rd Avenue	37.75841435504435	-122.18847991273027	\N	f	\N	\N
236	Maxwell Park	4618 Allendale Avenue	37.78130339209787	-122.20026151871718	\N	f	\N	\N
240	William "Bill" Patterson Park	9175 Edes Avenue	37.73802473854441	-122.18937080159046	\N	f	\N	\N
241	Poplar Park	3131 Union Street	37.823373676628535	-122.2835117589695	\N	f	\N	\N
242	DeFremery Park	1651 Adeline Street	37.81141714212085	-122.28553500546636	\N	f	\N	\N
243	Fruitvale Bridge Park	3205 Alameda Avenue	37.76940222142491	-122.22954772595166	\N	f	\N	\N
244	Peralta Hacienda Park	2500 34th Avenue	37.78752670054064	-122.21682703049692	\N	f	\N	\N
245	Cypress Freeway Memorial Park	14th and Mandela Parkway	37.810846120760345	-122.29174055553761	\N	f	\N	\N
247	Chinese Garden Park	7th Street &amp; Harrison Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
248	Morcom Rose Garden	700 Jean Street	37.819302320445075	-122.24605202369963	\N	f	\N	\N
249	88th Avenue Mini Park	1722 88th Ave	37.7528398498705	-122.17142026123753	\N	f	\N	\N
250	Lazear Park	850 - 29th Avenue	37.77570663822536	-122.23244965266198	\N	f	\N	\N
251	Peralta Park	94 East 10th Street	37.798308912623376	-122.26441531244623	\N	f	\N	\N
252	Vantage Point Park	1198 13th Avenue	37.78914136717913	-122.24808783645528	\N	f	\N	\N
253	Beaumont Park	Beaumont Avenue &amp; East 38th Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
254	Union Plaza	3399 Peralta Street	37.82594913854309	-122.28233539152443	\N	f	\N	\N
255	Clinton Square Park	1230 6th Avenue	37.79439275994709	-122.25374163565417	\N	f	\N	\N
257	Elmhurst Lyons Field	1800 98th Avenue	37.74664352108863	-122.165601647708	\N	f	\N	\N
258	San Antonio Park	1701 E 19th Street	37.79100751139034	-122.23992575719154	\N	f	\N	\N
237	Joaquin Miller Dog Play Area	3590 Sanborn Drive	37.810859987420464	-122.19269090980518	f	f	f	
232	Lakeside Park	666 Bellevue Avenue	37.80795499033483	-122.25885972773281	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
239	Oak Glen Park	3390 Richmond Blvd	37.82030385518474	-122.25837603447687	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
218	Snow Park	19th Street &amp; Harrison Street	37.80505999961946	-122.27301999967312	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
256	Estuary Channel Park	5 Embarcadero	37.79098860532374	-122.26432675894569	t	f	t	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
195	UPPER NOE RECREATION CENTER	Day	37.74243091	-122.42779751	t	t	f	http://sfrecpark.org/destination/upper-noe-rec-center/upper-noe-dog-play-area/
259	25th Street Mini Park	25th Street	37.7957554971087	-122.23564084734986	\N	f	\N	\N
261	Montclair Park	6300 Moraga Avenue	37.828526809031004	-122.21243443299211	\N	f	\N	\N
262	Lincoln Square Park	261 11th Street	37.80043463426119	-122.26800787429386	\N	f	\N	\N
264	Marston Campbell Park	17th Street &amp; West Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
265	Central Reservoir Park	2506 East 29th Street	37.79534173771236	-122.22255924638952	\N	f	\N	\N
266	Manzanita Park	2701 22nd Ave	37.79419966999802	-122.22765486772965	\N	f	\N	\N
267	Arroyo Viejo Park	7701 Krause Avenue	37.762633466769614	-122.17619566121311	\N	f	\N	\N
268	Bella Vista Park	1025 East 28th Street	37.800360025898726	-122.2371337219185	\N	f	\N	\N
269	Columbian Gardens Park	9920 Empire Road	37.7291602543544	-122.18908606505944	\N	f	\N	\N
271	Colby Park	61st &amp; Colby Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
272	Ostrander Park	6151 Broadway Terrace	37.84264760593298	-122.23258233556714	\N	f	\N	\N
273	Wade Johnson Park	1250 Kirkham Street	37.80943614340091	-122.29053747164423	\N	f	\N	\N
276	Foothill Meadows Extension	3705 Foothill Boulevard	37.77979197643333	-122.21763063008204	\N	f	\N	\N
277	Foothill Meadows Extension	1600 38th Avenue	37.7764690733486	-122.21856430531881	\N	f	\N	\N
278	Golden Gate Park 	1075 62nd St	37.80505999961946	-122.27301999967312	\N	f	\N	\N
279	Rancho Peralta Park	34 E 10th Street	37.79746719756953	-122.26230891670201	\N	f	\N	\N
280	FM Smith Park	1969 Park Boulevard	37.80037428039416	-122.24878982067813	\N	f	\N	\N
282	Avenue Terrance Park	4369 Bennett Place	37.80032470133863	-122.19194545231409	\N	f	\N	\N
283	McClymonds Mini Park	2528 Linden Street	37.81764562934065	-122.28076929664121	\N	f	\N	\N
285	Peralta Oaks Park	Peralta Oaks &amp; 106th Avenue	37.80505999961946	-122.27301999967312	\N	f	\N	\N
286	Bushrod Park	560 59th Street	37.84481782053176	-122.26347070769017	\N	f	\N	\N
288	Cresent Park	Chester Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
289	Wood Street Pocket Park	Wood St/14th Street	37.79811632607474	-122.25837284075023	\N	f	\N	\N
290	Rainbow Park	5800 International Blvd	37.76549331082276	-122.20029749159835	\N	f	\N	\N
292	Garber [John] Park	Alvarado Rd &amp; Claremont Ave	37.80505999961946	-122.27301999967312	\N	f	\N	\N
293	Lafayette Square Park	635 11th Street	37.80392583261953	-122.27693305696152	\N	f	\N	\N
294	Glen Echo Park	Panama Court &amp; Monte Vista Avenue	37.80505999961946	-122.27301999967312	\N	f	\N	\N
295	Franklin Park	1010 East 15th Street	37.79269463350681	-122.24861559848168	\N	f	\N	\N
296	Marj Saunders Park 	5750 Ascot Dr	37.821008850028555	-122.19876530869094	\N	f	\N	\N
297	Madison Square Park	810 Jackson Street	37.79791775934754	-122.2676948794654	\N	f	\N	\N
298	Coliseum Gardens Park	966 66th Avenue	37.757671831889056	-122.19949429063371	\N	f	\N	\N
299	Pinto Park	5000 Redwood Road	37.79609723947982	-122.17513446121853	\N	f	\N	\N
300	Holly Mini Park	9830 Holly Street	37.74462107533759	-122.16907842463516	\N	f	\N	\N
301	Durant Mini Park	29th Street &amp; MLK Jr Way	37.80505999961946	-122.27301999967312	\N	f	\N	\N
302	Raimondi Park 	1800 Wood St	37.81599576697341	-122.29554293834275	\N	f	\N	\N
303	Caldecott Field/North Oakland Regional Sports Center	6900 Broadway	37.850484201010566	-122.22239492823022	\N	f	\N	\N
304	Redwood Heights Park	3883 Aliso Avenue	37.79796608109796	-122.1854229963365	\N	f	\N	\N
305	Sequoia Lodge Park	2666 Mountain Blvd	37.81439844277611	-122.20107090854356	\N	f	\N	\N
306	Henery J. Kaiser Memorial Park (Remember Them: Champions For Humanity Monument)	1900 Rashida Muhammad Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
307	Sobrante Park	470 El Paseo Drive	37.728324331351814	-122.17741873917299	\N	f	\N	\N
308	Chabot Park	6850 Chabot Road	37.85070089659142	-122.24128839206891	\N	f	\N	\N
309	Tomas Melero-Smith	65th.International Blvd	37.80505999961946	-122.27301999967312	\N	f	\N	\N
310	Stonehurst Park	10315 E Street	37.73751689383553	-122.17356959719105	\N	f	\N	\N
311	Josie de la Cruz Park	1637 Fruitvale Avenue	37.78041404360486	-122.22450938852612	\N	f	\N	\N
312	Garfield Park	2260 Foothill Boulevard	37.78571932591725	-122.2352867776567	\N	f	\N	\N
313	Rockridge Park	6090 Rockridge Blvd	37.84517160169325	-122.24405267919116	\N	f	\N	\N
314	Bishop Floyd L. Begin Plaza	2251 San Pablo Ave	37.81255105155954	-122.27403863769715	\N	f	\N	\N
315	Officer Willie Wilkins	9700 C Street	37.743196205039595	-122.17533880100486	\N	f	\N	\N
316	Jefferson Square	618 Jefferson Street	37.800331412598446	-122.27804291489684	\N	f	\N	\N
317	Sheffield Village Park	247 Marlow Drive	37.73513219911359	-122.13506067159295	\N	f	\N	\N
318	Splash Pad Park	Grand Avenue &amp; Lakepark	37.80505999961946	-122.27301999967312	\N	f	\N	\N
319	Gateway Gardens Park & Pavillion	Tunnel Rd &amp; Caldecott Ln	37.80505999961946	-122.27301999967312	\N	f	\N	\N
320	Linden Park	998 42nd Steet	37.83276870061304	-122.27576472623106	\N	f	\N	\N
321	Carter-Gilmore/Greenman Field	1390 66th Avenue @Lucille	37.80505999961946	-122.27301999967312	\N	f	\N	\N
322	Temescal Creek Park	Cavour &amp; Clifton Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
323	Saint Andrews Plaza	32nd Street &amp; San Pablo Ave	37.80505999961946	-122.27301999967312	\N	f	\N	\N
324	Willow Mini Park	1368 Willow St	37.812437920752245	-122.29665984703786	\N	f	\N	\N
326	Kennedy Tract Park	26th Avenue &amp; East 9th Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
274	Eastshore Park	550 El Embarcadero &amp; Lakeshore Ave	37.80505999961946	-122.27301999967312	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
260	Hardy Dog Play Area	491 Hardy Street	37.84202012861456	-122.25718721053968	t	t	f	http://www2.oaklandnet.com/government/o/opr/s/Parks/Hardy/index.htm
263	Grove Shafter Dog Play Area	Martin Luther King Jr Way &amp; 36th Street	37.80505999961946	-122.27301999967312	t	t	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
270	Knowland Park	9777 Golf Links Rd	37.753335947280924	-122.15032626989203	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
327	Mosswood Park	3612 Webster Street	37.82388635030956	-122.26190991013061	t	t	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
325	Montclair Railroad Trail	6000 Shepherd Canyon Rd	37.831494	122.197018	t	f	f	http://www.montclairrrtrail.org/trail-location-map.html
287	Mosswood Dog Play Area	3612 Webster Street	37.82388635030956	-122.26190991013061	f	f	f	
328	Rockridge-Temescal Greenbelt (FROG Park)	Along Temescal Creek, Hudson St to Redondo Park	37.80505999961946	-122.27301999967312	t	f	f	http://www.frogpark.org/location/
291	King Estates	8501 Fontaine St	37.76462581458471	-122.15256817383897	t	f	t	http://www.oknia.org/KEOS.html
331	Burckhalter Park	2535 High Street	37.78179169684871	-122.20494279765407	\N	f	\N	\N
332	Helen McGregor Plaza Park	Martin Luther King Jr Way &amp; 5210 West Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
333	Ayala Park	Ayala @ 57th St	37.84263715449612	-122.25925704383928	\N	f	\N	\N
334	Tassafaronga Park	85th Avenue &amp; E Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
335	Redondo Park	Redondo and Clarke	37.83786175452053	-122.26107367433849	\N	f	\N	\N
336	Lowell Park	1180 14th Street&nbsp;	37.80505999961946	-122.27301999967312	\N	f	\N	\N
337	Verdese Carter Park	9600 Sunnyside Street	37.748541090570484	-122.16335334263471	\N	f	\N	\N
338	Frank Ogawa Firescape Garden	6900 Broadway	37.850484201010566	-122.22239492823022	\N	f	\N	\N
339	Firestorm Memorial Garden	Tunnel Road/Hiller Drive	37.855601091569376	-122.2278336497169	\N	f	\N	\N
340	Channel Park	1 10th Street &amp; 21 7th Street	37.80505999961946	-122.27301999967312	\N	f	\N	\N
341	Cesar Chavez Park	Foothill Boulevard	37.775655649753844	-122.21291497966945	\N	f	\N	\N
275	South Prescott Park	3rd Street/Chester Avenue	37.80505999961946	-122.27301999967312	t	f	t	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
246	Dimond Park	3860 Hanly Road	37.807082984075336	-122.21441669084938	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
231	Hardy Park & Dog Park	491 Hardy Street	37.84202012861456	-122.25718721053968	f	f	f	
281	Grove Shafter Park	Martin Luther King Jr Way &amp; 36th Street	37.80505999961946	-122.27301999967312	f	f	f	
178	SIGMUND STERN RECREATION GROVE	19th Ave	37.7369668	-122.4785155	t	f	t	http://sfrecpark.org/destination/sigmund-stern-recreation-grove/stern-grove-dog-play-areas/
238	Jefferson Dog Play Area	618 Jefferson Street	37.800331412598446	-122.27804291489684	t	t	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
329	Joaquin Miller Park	3590 Sanborn Drive	37.810859987420464	-122.19269090980518	t	t	f	http://www2.oaklandnet.com/government/o/opr/s/Parks/JoaquinMiller/index.htm
284	Mandana Plaza Park	600 Mandana Avenue &amp; Lakeshore Ave	37.80505999961946	-122.27301999967312	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
330	Pine Knoll Park	Lakeshore Avenue &amp; Hanover Avenue	37.80505999961946	-122.27301999967312	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
212	Union Point Park	2311 Embarcadero	37.77899051876286	-122.24260248347878	t	f	f	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
211	Park Blvd Plaza Park	2100 Park Blvd	37.80063109648487	-122.24766069655746	t	f	t	http://www2.oaklandnet.com/Government/o/opr/s/DogPlayAreas/index.htm
33	ALAMO SQUARE	Hayes	37.77634875	-122.43467396	t	f	t	http://sfrecpark.org/destination/alamo-square/alamo-square-dog-play-area/
38	ALTA PLAZA	Jackson	37.79117333	-122.43766978	t	f	t	http://sfrecpark.org/destination/alta-plaza-park/alta-plaza-dog-play-areas/
51	BERNAL HEIGHTS PARK	\N	37.7430381	-122.4139578	t	f	t	http://sfrecpark.org/destination/bernal-heights-park/bernal-heights-dog-play-areas/
78	Upper Douglass Dog Park	26th	37.7466982	-122.4389421	t	t	f	http://sfrecpark.org/destination/douglass-playground/douglass-dog-play-area/
102	GOLDEN GATE PARK - Section 3 (Arboretum)	\N	\N	\N	f	f	f	
100	GOLDEN GATE PARK - Section 1	\N	37.7666044	-122.4617463	t	f	t	http://sfrecpark.org/destination/golden-gate-park/ggp-dog-play-area-1/
103	GOLDEN GATE PARK - Section 4	\N	37.7659390	-122.4953686	t	f	t	http://sfrecpark.org/destination/golden-gate-park/ggp-dog-play-area-3/
104	GOLDEN GATE PARK DOG TRAINING AREA	\N	37.7709859	-122.4994299	t	t	f	http://sfrecpark.org/destination/golden-gate-park/ggp-dog-training-area/
13	JEFFERSON SQUARE	Eddy	37.78180034	-122.42565792	t	f	t	http://sfrecpark.org/destination/jefferson-square/jefferson-square-dog-play-area/
119	LAKE MERCED PARK	\N	37.7290778	-122.4879343	t	f	t	http://sfrecpark.org/destination/lake-merced-park/lake-merced-dog-play-area/
131	MCKINLEY SQUARE	20th St	37.75913976	-122.40469058	t	f	t	http://sfrecpark.org/destination/mckinley-square/mckinley-square-dog-play-area/
141	MOUNTAIN LAKE PARK	1 11th Ave	37.78724257	-122.4690454	t	f	t	http://sfrecpark.org/destination/mountain-lake-park/mountain-lake-park-dog-play-area/
43	POTRERO HILL MINI PARK	22nd	37.75744642	-122.3965207	t	f	t	http://sfrecpark.org/destination/potrero-hill-rec-center/potrero-hill-rc-dog-play-areas/
342	ST MARYS DOG PLAY AREA	\N	37.7328026	-122.4208021	t	t	f	http://sfrecpark.org/destination/st-marys-rec-center/st-marys-dog-play-area/
200	WALTER HAAS DOG PLAY AREA	Addison	37.7404288	-122.4353688	t	t	f	http://sfrecpark.org/destination/walter-haas-playground/walter-haas-dog-play-areas/
343	Crocker Amazon Dog Play Area	 Moscow & Geneva	37.7150164	-122.4277578	t	f	t	http://sfrecpark.org/destination/crocker-amazon-playground/crocker-amazon-dog-play-area/
\.


--
-- Name: parks_park_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cooper
--

SELECT pg_catalog.setval('parks_park_id_seq', 343, true);


--
-- Name: parks_pkey; Type: CONSTRAINT; Schema: public; Owner: cooper
--

ALTER TABLE ONLY parks
    ADD CONSTRAINT parks_pkey PRIMARY KEY (park_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

