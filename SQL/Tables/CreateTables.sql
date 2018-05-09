CREATE TABLE INTERESTS (
	interest_id INT PRIMARY KEY IDENTITY(1,1),
	interestname nvarchar(50)
);

CREATE TABLE TOKEN (
	token_id INT PRIMARY KEY IDENTITY(1,1),
	token nvarchar(32)
);

CREATE TABLE USERS (
	users_id INT PRIMARY KEY IDENTITY(1,1),
	firstname nvarchar(50),
	lastname nvarchar(50),
	email nvarchar(50),
	pass nvarchar(64),
	street nvarchar(75),
	token_id INT FOREIGN KEY (token_id) REFERENCES TOKEN(token_id) 
);

CREATE TABLE ADMINS (
	admin_id INT PRIMARY KEY IDENTITY(1,1),
	admin_rights nvarchar(50),
	users_id INT FOREIGN KEY (users_id) REFERENCES USERS(users_id)
);

CREATE TABLE dbo.REGULAR_USERS (
	regular_users_id INT PRIMARY KEY IDENTITY (1,1),
	user_rights nvarchar(50),
	users_id INT REFERENCES dbo.USERS (users_id)
);

CREATE TABLE REGULAR_USERS_INTERESTS (
	interest_id INT FOREIGN KEY (interest_id) REFERENCES INTERESTS(interest_id),
	regular_users_id INT FOREIGN KEY (regular_users_id) REFERENCES REGULAR_USERS(regular_users_id)
);

CREATE TABLE dbo.API_EVENT (
	api_event_id INT PRIMARY KEY IDENTITY (1,1),
	title nvarchar(50),
  event_date nvarchar(50),
  event_start nvarchar(50),
  event_end nvarchar(50),
  start_timestamp int,
  end_timestamp int,
  venue nvarchar(100),
  entrance nvarchar(50),
  cost nvarchar(50),
  website nvarchar(100),
  info nvarchar(250),
  introduction nvarchar(150),
  image nvarchar(200),
  content nvarchar(max),
	);

CREATE TABLE dbo.USER_EVENT (
	user_event_id INT PRIMARY KEY IDENTITY (1,1),
	title nvarchar(50),
  event_date nvarchar(50),
  event_start nvarchar(50),
  event_end nvarchar(50),
  start_timestamp int,
  end_timestamp int,
  venue nvarchar(100),
  entrance nvarchar(50),
  cost nvarchar(50),
  website nvarchar(100),
  info nvarchar(250),
  introduction nvarchar(150),
  image nvarchar(200),
  content nvarchar(max),
  regular_users_id INT REFERENCES dbo.REGULAR_USERS (regular_users_id),
	);

CREATE TABLE dbo.COMMENTS (
	comment_id INT PRIMARY KEY IDENTITY (1,1),
	comment_content nvarchar (max),
	regular_users_id INT REFERENCES dbo.REGULAR_USERS (regular_users_id)
	);

CREATE TABLE dbo.ALL_EVENTS (
	event_id INT PRIMARY KEY IDENTITY (1,1),
	title nvarchar(50),
  event_date nvarchar(50),
  event_start nvarchar(50),
  event_end nvarchar(50),
  start_timestamp int,
  end_timestamp int,
  venue nvarchar(100),
  entrance nvarchar(50),
  cost nvarchar(50),
  website nvarchar(100),
  info nvarchar(250),
  introduction nvarchar(150),
  image nvarchar(200),
  content nvarchar(max),
  api_event_id INT REFERENCES dbo.API_EVENT (api_event_id),
  user_event_id INT REFERENCES dbo.USER_EVENT (user_event_id),
  comment_id INT REFERENCES dbo.COMMENTS (comment_id)
	);
 
CREATE TABLE dbo.EVENT_REGULAR_USERS (
	event_id INT REFERENCES dbo.ALL_EVENTS (event_id),
	regular_users_id INT REFERENCES dbo.REGULAR_USERS (regular_users_id),
	);