-- Database: public

-- DROP DATABASE IF EXISTS public;

--CREATE DATABASE workshop_springboot
--  WITH
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    LC_COLLATE = 'pt_BR.UTF-8'
--    LC_CTYPE = 'pt_BR.UTF-8'
--    TABLESPACE = pg_default
--    CONNECTION LIMIT = -1
--    IS_TEMPLATE = False;

--COMMENT ON DATABASE workshop_springboot
--    IS 'Workshop DevSuperior - SpringBoot3';
	
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)


--
-- Name: tb_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_category (
    id bigint NOT NULL,
    name character varying(255)
);


--
-- Name: tb_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_category_id_seq OWNED BY public.tb_category.id;


--
-- Name: tb_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_order (
    id bigint NOT NULL,
    date timestamp(6) with time zone,
    order_status integer,
    client_id bigint
);


--
-- Name: tb_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_order_id_seq OWNED BY public.tb_order.id;


--
-- Name: tb_order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_order_item (
    price double precision,
    quantity integer,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL
);


--
-- Name: tb_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_payment (
    moment timestamp(6) with time zone,
    order_id bigint NOT NULL
);


--
-- Name: tb_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product (
    id bigint NOT NULL,
    description character varying(255),
    img_url character varying(255),
    name character varying(255),
    price double precision
);


--
-- Name: tb_product_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product_category (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: tb_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_product_id_seq OWNED BY public.tb_product.id;


--
-- Name: tb_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_user (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255)
);


--
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_user_id_seq OWNED BY public.tb_user.id;


--
-- Name: tb_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_category ALTER COLUMN id SET DEFAULT nextval('public.tb_category_id_seq'::regclass);


--
-- Name: tb_order id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order ALTER COLUMN id SET DEFAULT nextval('public.tb_order_id_seq'::regclass);


--
-- Name: tb_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product ALTER COLUMN id SET DEFAULT nextval('public.tb_product_id_seq'::regclass);


--
-- Name: tb_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id SET DEFAULT nextval('public.tb_user_id_seq'::regclass);


--
-- Name: tb_category tb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_category
    ADD CONSTRAINT tb_category_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item tb_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT tb_order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: tb_order tb_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT tb_order_pkey PRIMARY KEY (id);


--
-- Name: tb_payment tb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT tb_payment_pkey PRIMARY KEY (order_id);


--
-- Name: tb_product_category tb_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT tb_product_category_pkey PRIMARY KEY (product_id, category_id);


--
-- Name: tb_product tb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_pkey PRIMARY KEY (id);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item fk4h5xid5qehset7qwe5l9c997x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fk4h5xid5qehset7qwe5l9c997x FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_product_category fk5r4sbavb4nkd9xpl0f095qs2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fk5r4sbavb4nkd9xpl0f095qs2a FOREIGN KEY (category_id) REFERENCES public.tb_category(id);


--
-- Name: tb_product_category fkgbof0jclmaf8wn2alsoexxq3u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fkgbof0jclmaf8wn2alsoexxq3u FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_order_item fkgeobgl2xu916he8vhljktwxnx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fkgeobgl2xu916he8vhljktwxnx FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


--
-- Name: tb_order fki0x0rv7d65vsceuy33km9567n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT fki0x0rv7d65vsceuy33km9567n FOREIGN KEY (client_id) REFERENCES public.tb_user(id);


--
-- Name: tb_payment fkokaf4il2cwit4h780c25dv04r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT fkokaf4il2cwit4h780c25dv04r FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO public.tb_category (name)
	VALUES
    ('Eletronics'),
    ('Books'),
    ('Computers');


INSERT INTO public.tb_user (name, email, phone, password)
	VALUES
    ('Maria Brown', 'maria@gmail.com', '988888888', '123456'),
    ('Alex Green', 'alex@gmail.com', '977777777', '123456');

INSERT INTO public.tb_product (name, description, price, img_url)
	VALUES
    ('The Lord of the Rings', 'Lorem ipsum dolor sit amet, consectetur.', 90.5, ''),
    ('Smart TV', 'Nulla eu imperdiet purus. Maecenas ante.', 2190.0, ''),
    ('Macbook Pro', 'Nam eleifend maximus tortor, at mollis.', 1250, ''),
    ('PC Gamer', 'Donec aliquet odio ac rhoncus cursus.', 1200, ''),
    ('Rails for Dummies', 'Cras fringilla convallis sem vel faucibus.', 100.99, '');

INSERT INTO public.tb_product_category (product_id, category_id)
	VALUES
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 2);

INSERT INTO public.tb_order (client_id, date, order_status)
	VALUES
    (1, '2019-06-20', 2),
    (2, '2019-07-21', 1),
    (1, '2019-07-22', 1);

INSERT INTO public.tb_order_item (order_id, product_id, quantity, price)
	VALUES
    (1, 1, 2, 90.5),
    (1, 3, 1, 1250.0),
    (2, 3, 2, 1250.0),
    (3, 5, 2, 100.99);

INSERT INTO public.tb_payment (order_id, moment)
	VALUES
    (1, '2019-06-20');
