--Creating the database and the tables
CREATE DATABASE "E Commerce Data"
	WITH 
	OWNER = postgres    
	ENCODING = 'UTF8'
	CONNECTION LIMIT = -1;

CREATE TABLE public.customers
	(customer_id character varying,
	 customer_zip_code_prefix bigint,
	 PRIMARY KEY (customer_id));

CREATE TABLE public.geolocation
	(geolocation_zip_code_prefix bigint,
	 geolocation_city character varying,
	 geolocation_state character varying,
	 PRIMARY KEY (geolocation_zip_code_prefix));

CREATE TABLE public.order_items
	(order_id character varying,   
	 order_item_id integer,
	 product_id character varying,
	 seller_id character varying,
	 price numeric,
	 PRIMARY KEY (order_id, order_item_id));

CREATE TABLE public.order_payments
	(order_id character varying,
	 payment_sequential integer,  
	 payment_type character varying,   
	 payment_installments integer,
	 payment_value numeric,
	 PRIMARY KEY (order_id, payment_sequential));

CREATE TABLE public.orders
	(order_id character varying,
	 customer_id character varying,
	 order_status character varying,
    order_purchase_timestamp timestamp without time zone,
    order_approved_at timestamp without time zone,
    order_delivered_carrier_date timestamp without time zone,
    order_delivered_customer_data timestamp without time zone,
    PRIMARY KEY (order_id)
	);

CREATE TABLE public.products
(
    product_id character varying,
    product_category_name character varying,
    PRIMARY KEY (product_id)
);

CREATE TABLE public.reviews
(
    review_id character varying,
    review_score integer,
    review_creation_date timestamp without time zone,
    review_answer_timestamp timestamp without time zone,
    PRIMARY KEY (review_id)
);

CREATE TABLE public.sellers
(
    seller_id character varying,
    seller_zip_code_prefix integer,
    PRIMARY KEY (seller_id)
);

CREATE TABLE public.product_category_translation
(
    product_category_name character varying,
    product_category_name_english character varying,
    PRIMARY KEY (product_category_name)
);

CREATE TABLE public.mql
(
    mql_id character varying,
    first_contact_date date,
    origin character varying,
    PRIMARY KEY (mql_id)
);

CREATE TABLE public.closed_deals
(
    mql_id character varying,
    seller_id character varying,
    won_date timestamp without time zone,
    business_segment character varying,
    lead_type character varying,
    lead_behavior_profile character varying,
    business_type character varying,
    PRIMARY KEY (mql_id)
);

