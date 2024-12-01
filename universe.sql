--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    type character varying(30),
    size_in_kpc integer NOT NULL
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
    name character varying(30) NOT NULL,
    radius_in_km integer NOT NULL,
    equator_temperature_in_k integer,
    epoch character varying(20),
    spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    radius_in_earths numeric(4,1),
    description text,
    name_origin text,
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_earths integer NOT NULL,
    has_planets boolean,
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'Barred spiral', 27);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Sagittarius', 'Barred spiral', 47);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 'Ursa major', 'Unbarred spiral', 52);
INSERT INTO public.galaxy VALUES (4, 'Hoags object', 'Serpens caput', 'Ring', 45);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Virgo', 'Supergiant elliptical', 41);
INSERT INTO public.galaxy VALUES (6, 'NGC 7537', 'Pisces', 'Spiral', 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (12, 'Mimas', 198, 64, '', true, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 252, 75, '', true, 6);
INSERT INTO public.moon VALUES (11, 'Callisto', 2410, 134, '', true, 5);
INSERT INTO public.moon VALUES (14, 'Tethys', 531, 86, '', true, 6);
INSERT INTO public.moon VALUES (2, 'Deimos', 6, 233, 'JD 2456191.5', false, 4);
INSERT INTO public.moon VALUES (1, 'Moon', 1737, 250, 'J2000', true, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 11, 233, 'J2000', false, 4);
INSERT INTO public.moon VALUES (15, 'Dione', 561, 87, '', true, 6);
INSERT INTO public.moon VALUES (4, 'Io', 1822, 110, '', true, 5);
INSERT INTO public.moon VALUES (16, 'Rhea', 764, 76, '', true, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 1561, 102, '8 January 2004', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 110, '', true, 5);
INSERT INTO public.moon VALUES (17, 'Titan', 2575, 94, '', true, 6);
INSERT INTO public.moon VALUES (18, 'Iapetus', 734, 110, '', true, 6);
INSERT INTO public.moon VALUES (19, 'Miranda', 236, 60, '', true, 7);
INSERT INTO public.moon VALUES (10, 'Thebe', 49, 124, '', false, 5);
INSERT INTO public.moon VALUES (9, 'Adrastea', 8, 122, '', false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 84, 120, '', false, 5);
INSERT INTO public.moon VALUES (7, 'Metis', 22, 123, '', false, 5);
INSERT INTO public.moon VALUES (20, 'Ariel', 579, 60, '', true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'WASP-17b', false, 1.0, 'WASP-17b is an exoplanet in the constellation Scorpius that is orbiting the star WASP-17.', '', 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', false, 1.0, 'Proxima Centauri d is a candidate exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun and part of the Alpha Centauri triple star system.', '', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 3.9, 'Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth.', 'In Roman mythology, Neptune was the god of the sea, identified with the Greek Poseidon.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 4.0, 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which astronomy calls "ice" or volatiles.', 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which astronomy calls "ice" or volatiles.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, 1.2, 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of the larger triple star system Alpha Centauri.', 'The three planets of the Proxima Centauri system are called Proxima Centauri b, c and d.', 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', false, 7.0, 'Proxima Centauri c is a controversial exoplanet candidate whose detection could not be recreated, claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system.', 'The three planets of the Proxima Centauri system are called Proxima Centauri b, c and d.', 2);
INSERT INTO public.planet VALUES (1, 'Mercury', false, 0.4, 'Mercury is one of four terrestrial planets in the Solar System, which means it is a rocky body like Earth. It is the smallest planet in the Solar System, with an equatorial radius of 2,439.7 kilometres (1,516.0 mi).[4] Mercury is also smaller-albeit more massive-than the largest natural satellites in the Solar System, Ganymede and Titan.', 'It is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0.9, 'Venus is one of the four terrestrial planets in the Solar System, meaning that it is a rocky body like Earth. It is similar to Earth in size and mass and is often described as Earth''s "sister" or "twin".', 'Romans named Venus after their goddess of love, who in turn was based on the ancient Greek goddess of love Aphrodite.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1.0, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth''s water is contained in its global ocean, covering 70.8% of Earth''s crust.', 'Historically, "Earth" has been written in lowercase. Beginning with the use of Early Middle English, its definite sense as "the globe" was expressed as "the earth".', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 0.5, 'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet".', 'It was the Romans who named the planet Mars, for their god of war, often represented by the sword and shield of the planet''s namesake.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 10.5, 'Jupiter is a gas giant, meaning its chemical composition is primarily hydrogen and helium. These materials are classified as gasses in planetary geology, a term that does not denote the state of matter. It is the largest planet in the Solar System, with a diameter of 142,984 km (88,846 mi) at its equator, giving it a volume 1,321 times that of the Earth.', 'In both the ancient Greek and Roman civilizations, Jupiter was named after the chief god of the divine pantheon: Zeus to the Greeks and Jupiter to the Romans.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 9.1, 'Saturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant, with an average radius of about nine times that of Earth.', 'Saturn is named after the Roman god of wealth and agriculture, who was the father of the god Jupiter.', 1);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'International Space Station', 3);
INSERT INTO public.satellite VALUES (2, 'Hubble Space Telescope', 3);
INSERT INTO public.satellite VALUES (3, 'James Webb Space Telescope', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 332950, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 40653, true, 1);
INSERT INTO public.star VALUES (3, 'Altair', 619287, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 686876, false, 1);
INSERT INTO public.star VALUES (6, 'Procyon A', 492100, false, 1);
INSERT INTO public.star VALUES (5, 'Sirius B', 338943, false, 1);
INSERT INTO public.star VALUES (7, 'WASP 17', 399540, true, 1);


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq UNIQUE (name);


--
-- Name: satellite table5_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT table5_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite table5_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT table5_unq UNIQUE (name);


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
-- Name: satellite satellites_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

