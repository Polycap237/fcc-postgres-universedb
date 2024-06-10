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
    name character varying NOT NULL,
    description text,
    has_life boolean,
    galaxy_type character varying NOT NULL,
    distance_from_earth numeric,
    temperature integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_property; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_property (
    galaxy_property_id integer NOT NULL,
    name character varying NOT NULL,
    property_value text,
    measurable boolean,
    description text,
    temperature integer,
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.galaxy_property OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    moon_type character varying NOT NULL,
    is_habitable boolean,
    distance_from_earth numeric,
    orbit_duration integer,
    temperature integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    planet_type character varying NOT NULL,
    has_atmosphere boolean,
    distance_from_earth numeric,
    gravity integer,
    temperature integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    temperature integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System.', false, 'Spiral', 26000, 34, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', false, 'Spiral', 253000, 55, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'A massive elliptical galaxy in the Virgo Cluster.', false, 'Elliptical', 543000, 33, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'A small galaxy in the Local Group.', false, 'Spiral', 3000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'A peculiar galaxy with an active galactic nucleus.', false, 'Elliptical', 13000000, 21, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'A spiral galaxy known for its prominent spiral arms.', false, 'Spiral', 31000000, 15, NULL);


--
-- Data for Name: galaxy_property; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_property VALUES (1, 'Size', 'Large', false, 'The galaxy is considered large in size.', 22, NULL, 1);
INSERT INTO public.galaxy_property VALUES (2, 'Spectral Type', 'Spiral', false, 'The galaxy has a spiral spectral type.', 44, NULL, 2);
INSERT INTO public.galaxy_property VALUES (3, 'Brightness', 'High', false, 'The galaxy appears bright in the sky.', 66, NULL, 1);
INSERT INTO public.galaxy_property VALUES (4, 'Redshift', '0.03', true, 'The galaxy has a redshift value of 0.03.', 43, NULL, 4);
INSERT INTO public.galaxy_property VALUES (5, 'Metallicity', 'High', false, 'The galaxy has a high metallicity.', 91, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Earths only natural satellite.', 'Rocky', false, 384400, 27, -20, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger moon of Mars.', 'Rocky', false, 9377, 0, -40, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller moon of Mars.', 'Rocky', false, 23458, 1, -50, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'One of Jupiters moons, believed to have an ocean beneath its icy crust.', 'Rocky', true, 628300, 4, -160, 5);
INSERT INTO public.moon VALUES (5, 'Titan', 'Saturns largest moon, known for its thick atmosphere.', 'Rocky', false, 12570, 15, 90, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter.', 'Rocky', false, 10704, 7, -163, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A moon of Jupiter, known for its ancient and heavily cratered surface.', 'Rocky', false, 18827, 17, 45, 5);
INSERT INTO public.moon VALUES (8, 'Triton', 'Neptunes largest moon', 'Rocky', false, 354759, -6, -235, 8);
INSERT INTO public.moon VALUES (9, 'Charon', 'The largest moon of Pluto, forming a binary system with it.', 'Rocky', false, 19591, 6, -218, 9);
INSERT INTO public.moon VALUES (10, 'Luna', 'The largest moon of the planet Luna.', 'Rocky', false, 0, 0, -273, 10);
INSERT INTO public.moon VALUES (11, 'Gliese 581g', 'An exomoon orbiting the exoplanet Gliese 581d.', 'Rocky', true, 223, 2, 44, 11);
INSERT INTO public.moon VALUES (12, 'PSR B1257+12 A', 'A moon of the pulsar PSR B1257+12.', 'Rocky', false, 344, 3, 23, 12);
INSERT INTO public.moon VALUES (13, 'HAT-P-1b', 'A hot gas giant exomoon.', 'Rocky', false, 645, 4, 17, 10);
INSERT INTO public.moon VALUES (14, 'HD 189733b', 'A hot gas giant exomoon.', 'Rocky', false, 843, 6, 66, 11);
INSERT INTO public.moon VALUES (15, 'TrES-2b', 'A gas giant exomoon.', 'Rocky', false, 23, 7, 65, 1);
INSERT INTO public.moon VALUES (16, 'WASP-12b', 'A hot gas giant exomoon.', 'Rocky', false, 43, 3, 33, 7);
INSERT INTO public.moon VALUES (17, 'HD 209458b', 'A hot gas giant exomoon.', 'Rocky', false, 234, 2, 44, 6);
INSERT INTO public.moon VALUES (18, 'Kepler-16b', 'An exomoon orbiting the binary star Kepler-16.', 'Rocky', false, 543, 6, 99, 8);
INSERT INTO public.moon VALUES (19, 'Kepler-22b', 'An exomoon orbiting the star Kepler-22.', 'Rocky', false, 345, 7, 33, 9);
INSERT INTO public.moon VALUES (20, 'Kepler-69c', 'An exomoon orbiting the star Kepler-69.', 'Rocky', false, 565, 2, 22, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our Solar System.', 'Terrestrial', false, 48000000, 4, 800, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The hottest planet in our Solar System.', 'Terrestrial', true, 38000000, 9, 735, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun, the home of humans.', 'Terrestrial', true, 0, 10, 288, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, often called the Red Planet.', 'Terrestrial', true, 54000000, 4, -63, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our Solar System.', 'Gas Giant', true, 588000000, 25, -145, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second-largest planet in our Solar System, known for its rings.', 'Gas Giant', true, 1200000000, 10, -178, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, characterized by its unique tilted axis.', 'Ice Giant', true, 2600000000, 9, -216, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth and farthest planet from the Sun.', 'Ice Giant', true, 4300000000, 11, -214, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in our Solar System.', 'Dwarf', false, 5900000000, 1, -229, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'An exoplanet orbiting the star Kepler-452.', 'Terrestrial', true, NULL, 355, 44, 3);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'A hot gas giant exoplanet.', 'Gas Giant', true, NULL, 22, 5, 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'An exoplanet orbiting the star TRAPPIST-1.', 'Terrestrial', true, NULL, 22, 4, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 4600, true, NULL, 5778, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 6000, false, NULL, 3042, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 8000, false, NULL, 3600, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'The brightest star in the night sky.', 250, true, NULL, 9940, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'The primary component of the closest star system to the Sun.', 6000, true, NULL, 5790, 2);
INSERT INTO public.star VALUES (6, 'Polaris', 'The North Star, located at the end of the handle of the Little Dipper.', 70, true, NULL, 5896, 1);


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
-- Name: galaxy_property galaxy_property_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_property
    ADD CONSTRAINT galaxy_property_name_key UNIQUE (name);


--
-- Name: galaxy_property galaxy_property_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_property
    ADD CONSTRAINT galaxy_property_pkey PRIMARY KEY (galaxy_property_id);


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
-- Name: galaxy_property galaxy_property_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_property
    ADD CONSTRAINT galaxy_property_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

