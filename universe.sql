--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: edf_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.edf_station (
    edf_station_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    operational_status boolean NOT NULL,
    personnel_count integer,
    defense_rating numeric,
    has_marker_research boolean NOT NULL,
    has_wmd_capabilities boolean NOT NULL,
    has_intergalactic_capabilities boolean NOT NULL,
    has_necromorph_weaponization_research boolean NOT NULL
);


ALTER TABLE public.edf_station OWNER TO freecodecamp;

--
-- Name: edf_station_edf_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.edf_station_edf_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edf_station_edf_station_id_seq OWNER TO freecodecamp;

--
-- Name: edf_station_edf_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.edf_station_edf_station_id_seq OWNED BY public.edf_station.edf_station_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean NOT NULL,
    has_runaway_black_hole boolean NOT NULL,
    has_brethren_moons boolean NOT NULL,
    has_necromoprhs boolean NOT NULL,
    number_of_stars integer,
    number_of_suns integer,
    number_of_inogoing_cec_expiditions integer,
    number_of_ongoing_edf_defensive_operations integer,
    number_of_ongoing_scaf_offensive_operations integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric,
    diameter_km integer,
    is_a_brethren_moon boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    description text,
    has_life boolean NOT NULL,
    planet_type character varying(255),
    distance_from_star_km numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    temperature_kelvin integer,
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: edf_station edf_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.edf_station ALTER COLUMN edf_station_id SET DEFAULT nextval('public.edf_station_edf_station_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: edf_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.edf_station VALUES (1, 'Celestial Eagle', 5, true, 15000, 9.9, false, true, true, false);
INSERT INTO public.edf_station VALUES (2, 'Aldrin Stronghold', 3, true, 18000, 9.9, false, true, true, false);
INSERT INTO public.edf_station VALUES (3, 'Armstrong Memorial Station', 1, true, 12500, 9.2, true, true, true, true);
INSERT INTO public.edf_station VALUES (4, 'Liberty Bastion', 5, true, 14200, 8.7, false, true, false, false);
INSERT INTO public.edf_station VALUES (5, 'Sovereign Shield', 3, true, 16800, 9.5, false, true, true, false);
INSERT INTO public.edf_station VALUES (6, 'The Last Line', 7, false, 0, 2.1, true, false, false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Ishimura Cluster', 8524, false, true, true, true, 185230644, 1297600382, 2, 3, 4);
INSERT INTO public.galaxy VALUES (2, 'CEC Sector', 3556, true, true, false, false, 1852644, 1290382, 98524, 0, 0);
INSERT INTO public.galaxy VALUES (3, 'Celestial Shield', 38923, true, false, false, false, 625644, 422859, 525, 0, 13);
INSERT INTO public.galaxy VALUES (4, 'Convergence Cluster', 85298230644, false, false, true, true, 2, 0, 0, 0, 0);
INSERT INTO public.galaxy VALUES (5, 'USG Sector', 38923, true, false, false, false, 625644, 422859, 525, 9, 58);
INSERT INTO public.galaxy VALUES (6, 'Extraterrestrial Linebreaker', 61918252, true, true, false, true, 132829, 82825216, 846, 121, 1973);
INSERT INTO public.galaxy VALUES (7, 'Quarantine Expanse', 132258291, false, true, false, false, 24, 8, 0, 11, 49);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Red Marker Site', 1, true, 4500, 3200, false);
INSERT INTO public.moon VALUES (2, 'Mining Outpost Luna', 1, true, 4500, 2800, false);
INSERT INTO public.moon VALUES (3, 'Codex Fragment', 3, true, 8200, 1900, false);
INSERT INTO public.moon VALUES (4, 'The Frozen Sentinel', 3, true, 8200, 4200, false);
INSERT INTO public.moon VALUES (5, 'Harvest Alpha', 6, true, 5100, 3600, false);
INSERT INTO public.moon VALUES (6, 'Corporate Asset One', 6, true, 5100, 2400, false);
INSERT INTO public.moon VALUES (7, 'Extraction Moon', 6, true, 5100, 1800, false);
INSERT INTO public.moon VALUES (8, 'Station Tether', 6, false, 5100, 950, false);
INSERT INTO public.moon VALUES (9, 'The Convergence', 8, true, 3800, 8500, true);
INSERT INTO public.moon VALUES (10, 'Evacuation Point', 8, true, 3800, 2200, false);
INSERT INTO public.moon VALUES (11, 'Patient Zero Moon', 12, true, 4100, 7200, true);
INSERT INTO public.moon VALUES (12, 'Necrotic Satellite', 12, false, 4100, 1200, false);
INSERT INTO public.moon VALUES (13, 'The Dead Moon', 12, true, 4100, 9100, true);
INSERT INTO public.moon VALUES (14, 'Marker Moon Prime', 11, true, 9500, 6800, true);
INSERT INTO public.moon VALUES (15, 'Signal Origin', 11, true, 9500, 3100, false);
INSERT INTO public.moon VALUES (16, 'The Last Witness', 4, true, 6200, 5400, false);
INSERT INTO public.moon VALUES (17, 'Ruins Satellite', 4, false, 6200, 850, false);
INSERT INTO public.moon VALUES (18, 'Terra-One', 2, true, 3200, 2900, false);
INSERT INTO public.moon VALUES (19, 'Drill Site Moon', 5, true, 4800, 2100, false);
INSERT INTO public.moon VALUES (20, 'Processing Station', 5, true, 4800, 1600, false);
INSERT INTO public.moon VALUES (21, 'Defense Grid Alpha', 7, true, 4300, 3400, false);
INSERT INTO public.moon VALUES (22, 'Relay Satellite', 10, false, 4600, 780, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Aegis VII', 1, 'Mining colony where the Red Marker was discovered', false, 'Rocky', 149000000);
INSERT INTO public.planet VALUES (2, 'New Horizons', 1, 'Failed terraforming project with abandoned settlements', false, 'Desert', 227000000);
INSERT INTO public.planet VALUES (3, 'Tau Volantis', 4, 'Frozen world containing ancient alien machine', false, 'Ice', 180000000);
INSERT INTO public.planet VALUES (4, 'Extinction Site', 4, 'Barren wasteland where civilization collapsed', false, 'Rocky', 95000000);
INSERT INTO public.planet VALUES (5, 'Resource Beta', 2, 'Active CEC mining operations with rich mineral deposits', false, 'Rocky', 168000000);
INSERT INTO public.planet VALUES (6, 'Profit Margin', 2, 'Gas giant with valuable atmospheric harvesting', false, 'Gas Giant', 520000000);
INSERT INTO public.planet VALUES (7, 'Sanctuary Prime', 3, 'Fortified military outpost protecting trade routes', false, 'Rocky', 142000000);
INSERT INTO public.planet VALUES (8, 'Outer Haven', 3, 'EarthGov evacuation center for refugee populations', true, 'Oceanic', 198000000);
INSERT INTO public.planet VALUES (9, 'Naval Station Omega', 5, 'Strategic military base with weapons testing facilities', false, 'Desert', 215000000);
INSERT INTO public.planet VALUES (10, 'Command Outpost Seven', 5, 'Communications hub coordinating fleet movements', false, 'Rocky', 134000000);
INSERT INTO public.planet VALUES (11, 'First Discovery', 6, 'Unexplored world with mysterious alien structures', false, 'Rocky', 380000000);
INSERT INTO public.planet VALUES (12, 'Outbreak World', 7, 'Quarantined necromoph infestation zone with no survivors', false, 'Urban Ruins', 156000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Isaac''s Star', 1, 6200, true);
INSERT INTO public.star VALUES (2, 'The Dead Sun', 4, 4200, false);
INSERT INTO public.star VALUES (3, 'Extraction Prime', 2, 5600, true);
INSERT INTO public.star VALUES (4, 'Guardian Light', 3, 6500, true);
INSERT INTO public.star VALUES (5, 'USG Kellion', 5, 5900, true);
INSERT INTO public.star VALUES (6, 'The Breach Point', 6, 12000, true);
INSERT INTO public.star VALUES (7, 'The Silenced Sun', 7, 4500, false);


--
-- Name: edf_station_edf_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.edf_station_edf_station_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: edf_station edf_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.edf_station
    ADD CONSTRAINT edf_station_name_key UNIQUE (name);


--
-- Name: edf_station edf_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.edf_station
    ADD CONSTRAINT edf_station_pkey PRIMARY KEY (edf_station_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: edf_station edf_station_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.edf_station
    ADD CONSTRAINT edf_station_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

