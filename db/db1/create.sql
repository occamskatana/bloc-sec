CREATE TABLE user(
id INTEGER PRIMARY KEY,
full_name text,
email text);


CREATE TABLE post(
	id INTEGER PRIMARY KEY,
	title TEXT,
	body TEXT,
	user_id INTEGER NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id)
);

INSERT INTO user (full_name, email) VALUES (
	'John Carter',
	'Johngallweycarter@gmail.com'
);


INSERT INTO post (title, body, user_id) VALUES ('Deep in the Heart of Texas', 'The stars at night are big and bright, Deep in the heart of Texas, The prairie sky is wide and high, Deep in the heart of Texas.', 1);


INSERT INTO post (title, body, user_id) VALUES (
    'Follow the Drinkin'' Gourd',
    'When the sun goes down
    And the first quail call
    Follow the drinkin'' gourd
    Then it''s time, children
    to come one and all and
    Follow the drinkin'' gourd', 1
    );

 CREATE TABLE comment(
    id INTEGER PRIMARY KEY,
    body TEXT,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(id),
    FOREIGN KEY(user_id) REFERENCES user(id)
    );


 INSERT INTO comment (body, post_id, user_id) VALUES ('Follow the Drinking Gourd was published in 1928.', 2, 1);

