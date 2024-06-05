create table if not exists hanjanhae (
	h_drinkId VARCHAR(10) NOT NULL,
	h_drinkName VARCHAR(20),
	h_drinkPrice INTEGER,
	h_ABV VARCHAR(20),
	h_drinkInfo TEXT,
	h_drinkVolume VARCHAR(20),
	h_drinkCategory VARCHAR(20),
	h_drinkStock LONG,
	h_drinkPRO VARCHAR(20),
	h_drinkAged VARCHAR(20),
	h_filename VARCHAR(20),
	PRIMARY KEY (h_drinkId)
	) default CHARSET=utf8; 