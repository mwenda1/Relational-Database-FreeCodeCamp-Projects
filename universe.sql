--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: belts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.belts (
    belts_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    age_of_belt_billion_years integer,
    year_discovered integer
);


ALTER TABLE public.belts OWNER TO freecodecamp;

--
-- Name: belts_belts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.belts_belts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.belts_belts_id_seq OWNER TO freecodecamp;

--
-- Name: belts_belts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.belts_belts_id_seq OWNED BY public.belts.belts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_light_years integer,
    constellation character varying(40),
    distance_from_earth integer
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
    name character varying(40) NOT NULL,
    planet_id integer,
    mean_radius numeric,
    discovery_year integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth integer,
    star_id integer
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
    name character varying(40) NOT NULL,
    intergalactic_star boolean,
    part_of_constellation boolean,
    distance_from_earth integer,
    galaxy_id integer
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
-- Name: belts belts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts ALTER COLUMN belts_id SET DEFAULT nextval('public.belts_belts_id_seq'::regclass);


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
-- Data for Name: belts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.belts VALUES (1, 'Kuipert Belt', 9, 5, 1992);
INSERT INTO public.belts VALUES (2, 'Kuipert Belt', 11, 5, 1992);
INSERT INTO public.belts VALUES (3, 'Asteroid Belt', 1, 5, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 14000, 'Dorado/Mensa', 158000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 220000, 'Andromeda', 2500000);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 37000, 'Ursa Major', 11500000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 170000, 'Ursal Major', 20870000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 50000, 'Virgo', 29350000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.267, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 1610);
INSERT INTO public.moon VALUES (8, 'Almathea', 5, 83.5, 1892);
INSERT INTO public.moon VALUES (9, 'Dysnomia', 10, 350, 2005);
INSERT INTO public.moon VALUES (10, 'Hiiaka', 11, 160, 2005);
INSERT INTO public.moon VALUES (11, 'Nakama', 11, 85, 2005);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 606, 1978);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 1353.4, 1846);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 584.7, 1851);
INSERT INTO public.moon VALUES (15, 'Mimas', 6, 198.2, 1789);
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, 252.1, 1789);
INSERT INTO public.moon VALUES (17, 'Tethys', 6, 533.1, 1684);
INSERT INTO public.moon VALUES (18, 'Dione', 6, 561.4, 1684);
INSERT INTO public.moon VALUES (19, 'Rhea', 6, 763.8, 1682);
INSERT INTO public.moon VALUES (20, 'Ariel', 5, 578.9, 1851);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the sun and only astronomical object known to harbor life', true, 0, 2);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Smallest planet in the solar system and closest to the sun', false, 59, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from sun and is named after Roman goddess of love and beauty', false, 116, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from Sun and second smallest planet. Mars is a terrestrial planet with a thin atmosphere', false, 134, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Fifth planet from Sun and is the largest in the solar system. It is a gas giant with a mass more than two and half times that of all the other planets in the solar system combined', false, 486, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun and second largest in the solar system', false, 883, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun', false, 1900, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth and farthest known solar planet from the Sun', false, 2796, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper belt', false, 3141, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'Is the most massive and second largest known dwarf planet in the solar system', false, 8891, 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf planet member of a group of objects that orbit in a disc-like zone beyond the orbit of Neptune', NULL, 4010, 2);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Largest object in the asteroid belt between Mars and Jupiter', true, 324, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alcor', false, true, 82, 6);
INSERT INTO public.star VALUES (2, 'Sun', true, false, 0, 1);
INSERT INTO public.star VALUES (3, 'Mizar', false, true, 83, 6);
INSERT INTO public.star VALUES (4, 'Alpheratz', false, true, 97, 3);
INSERT INTO public.star VALUES (5, 'Tellurium', NULL, true, 78, 1);
INSERT INTO public.star VALUES (6, 'Naledi', true, NULL, 576, 2);
INSERT INTO public.star VALUES (7, 'Chalawan', false, true, 46, 1);


--
-- Name: belts_belts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.belts_belts_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: belts belts_belts_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts
    ADD CONSTRAINT belts_belts_id_key UNIQUE (belts_id);


--
-- Name: belts belts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belts
    ADD CONSTRAINT belts_pkey PRIMARY KEY (belts_id);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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

