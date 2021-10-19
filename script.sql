CREATE TABLE restaurant(
  id integer PRIMARY KEY,
  name varchar(20),
  description varchar(100),
  rating decimal,
  telephone char(10),
  hours varchar(100)
);

CREATE TABLE address(
  id integer PRIMARY KEY,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state varchar(15),
  google_map_link varchar(50),
  restaurant_id integer REFERENCES restaurant(id) UNIQUE
);

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'restaurant';

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'address';

CREATE TABLE category(
  id char(2) PRIMARY KEY,
  name varchar(20),
  description varchar(200)
);

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'category';

CREATE TABLE dish(
  id integer PRIMARY KEY,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean
);

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'dish';

CREATE TABLE review(
  id integer PRIMARY KEY,
  rating decimal,
  description varchar(100),
  date date,
  restaurant_id integer REFERENCES restaurant(id)
);

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'review';

CREATE TABLE categories_dishes(
  category_id char(2) REFERENCES category(id),
  dish_id integer REFERENCES dish(id),
  price money,
  PRIMARY KEY(category_id, dish_id)
);

SELECT constraint_name, table_name, column_name
FROM
  information_schema.key_column_usage
WHERE table_name = 'categories_dishes';