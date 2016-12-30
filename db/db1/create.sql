CREATE TABLE post(
	id INTEGER PRIMARY KEY,
	title TEXT,
	body TEXT	
);


INSERT INTO post VALUES (NULL, 'Deep in the Heart of Texas', 'The stars at night are big and bright, Deep in the heart of Texas, The prairie sky is wide and high, Deep in the heart of Texas.');


INSERT INTO post (title, body) VALUES (
    'Follow the Drinkin'' Gourd',
    'When the sun goes down
    And the first quail call
    Follow the drinkin'' gourd
    Then it''s time, children
    to come one and all and
    Follow the drinkin'' gourd'
    );

 CREATE TABLE comment(
    id INTEGER PRIMARY KEY,
    body TEXT,
    post_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(id)
    );


 INSERT INTO comment (body, post_id) VALUES ('Follow the Drinking Gourd was published in 1928.', 2);

