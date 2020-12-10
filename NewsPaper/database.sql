CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT NOT NULL,
    time_in DATETIME NOT NULL,
    time_out DATETIME,
    cost FLOAT NOT NULL,
    take_away INT NOT NULL,
    staff INT NOT NULL,

    PRIMARY KEY (order_id),
    FOREIGN KEY (staff) REFERENCES STAFF (staff_id)
);

CREATE TABLE PRODUCTS (
    product_id INT AUTO_INCREMENT NOT NULL,
    name CHAR(255) NOT NULL,
    price FLOAT NOT NULL,

    PRIMARY KEY (product_id)
);

CREATE TABLE STAFF (
    staff_id INT AUTO_INCREMENT NOT NULL,
    full_name CHAR(255) NOT NULL,
    position CHAR(255) NOT NULL,
    labor_contract INT NOT NULL,

    PRIMARY KEY (staff_id)
);

CREATE TABLE PRODUCTS_ORDERS (
    product_order_id INT AUTO_INCREMENT NOT NULL,
    product INT NOT NULL,
    in_order INT NOT NULL,
    amount INT NOT NULL,

    PRIMARY KEY (product_order_id),
    FOREIGN KEY (product) REFERENCES PRODUCTS (product_id),
    FOREIGN KEY (in_order) REFERENCES ORDERS (order_id)
);

CREATE TABLE AUTHOR (
    username_id INT AUTO_INCREMENT NOT NULL,
    username CHAR(255) NOT NULL,
    rating INT,

    PRIMARY KEY (username_id)
);

CREATE TABLE CATEGORY (
    category_id INT AUTO_INCREMENT NOT NULL,
    theme CHAR(255) NOT NULL
);

CREATE TABLE POST (
    post_id INT AUTO_INCREMENT NOT NULL
    username CHAR(255) NOT NULL,
    selection_box CHAR(255) NOT NULL,
    auto_time DATETIME NOT NULL,
    heading CHAR(255) NOT NULL,
    post_text CHAR(255) NOT NULL,
    rating INT,

    PRIMARY KEY (post_id),
    FOREIGN KEY (username) REFERENCES AUTHOR (username_id)
);

CREATE TABLE POST_CATEGORY (
    post_category_id INT AUTO_INCREMENT NOT NULL,
    username CHAR(255) NOT NULL,
    theme CHAR(255) NOT NULL,

    PRIMARY KEY (post_category_id),
    FOREIGN KEY (username) REFERENCES POST (post_id),
    FOREIGN KEY (theme) REFERENCES CATEGORY (category_id)

);

CREATE TABLE COMMENT (
    comment_id INT AUTO_INCREMENT NOT NULL,
    username CHAR(255) NOT NULL,
    another_name CHAR(255) NOT NULL,
    article_text CHAR(255) NOT NULL,
    auto_time DATETIME NOT NULL,
    rating INT,

    PRIMARY KEY (comment_id),
    FOREIGN KEY (username) REFERENCES POST (post_id),
    FOREIGN KEY (another_name) REFERENCES USER (user_id)
);
