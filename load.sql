--Loading the data
COPY closed_deals
FROM '~\olist_closed_deals_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY customers
FROM '~\olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY geolocation
FROM '~\olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY mql
FROM '~\olist_marketing_qualified_leads_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY order_items
FROM '~\olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY order_payments
FROM '~\olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY order_reviews
FROM '~\olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY orders
FROM '~\olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY product_category_translation
FROM '~\product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;

COPY products
FROM '~\olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
FROM '~\olist_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY sellers
FROM '~\olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;



--Adding constraints
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers 
FOREIGN KEY (customer_id) 
REFERENCES customers (customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_product 
FOREIGN KEY (product_id) 
REFERENCES products (product_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_seller 
FOREIGN KEY (seller_id) 
REFERENCES sellers (seller_id);


ALTER TABLE closed_deals
ADD CONSTRAINT fk_deals_seller 
FOREIGN KEY (seller_id) 
REFERENCES sellers (seller_id);

ALTER TABLE customers
ADD CONSTRAINT fk_cust_zip 
FOREIGN KEY (customer_zip_code_prefix) 
REFERENCES geolocation (geolocation_zip_code_prefix);


ALTER TABLE sellers
ADD CONSTRAINT fk_seller_zip 
FOREIGN KEY (seller_zip_code_prefix) 
REFERENCES geolocation (geolocation_zip_code_prefix);

ALTER TABLE closed_deals
ADD CONSTRAINT fk_closed_mql
FOREIGN KEY (mql_id) 
REFERENCES mql (mql_id);


