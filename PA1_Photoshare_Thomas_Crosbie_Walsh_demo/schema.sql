CREATE DATABASE photoshare;
USE photoshare;

CREATE TABLE Users (
    user_id int4  AUTO_INCREMENT,
    email varchar(255) UNIQUE,
    dob date,
    profile_picture longblob,
    gender ENUM ('Male', 'Female', 'Other'),
    hometown varchar(255),
    password varchar(255),
    firstname varchar(255),
    lastname varchar (255),
    bio varchar(255),
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);



CREATE TABLE Friends (
    user_id int4,
    friend_id int4,
    CONSTRAINT friend_pk PRIMARY KEY (user_id, friend_id),
    CONSTRAINT friend_fk FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT friend_fk1 FOREIGN KEY (friend_id) REFERENCES Users(user_id)

);

CREATE TABLE Albums (
    album_id int4 AUTO_INCREMENT,
    albname varchar(255) NOT NULL,
    doc date,
    user_id int4 NOT NULL,
    CONSTRAINT album_pk PRIMARY KEY (album_id),
    CONSTRAINT album_fk FOREIGN KEY (user_id) REFERENCES Users (user_id)

);


CREATE TABLE Pictures
(
  picture_id int4  AUTO_INCREMENT,
  user_id int4,
  album_id int4,
  imgdata longblob,
  caption VARCHAR(255),
  INDEX upid_idx (user_id),
  CONSTRAINT pictures_pk PRIMARY KEY (picture_id),
  CONSTRAINT pictures_pk1 FOREIGN KEY (user_id) REFERENCES Users(user_id),
  CONSTRAINT pictures_fk FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE Tags (
    tag varchar(255) NOT NULL,
    picture_id int4,
    CONSTRAINT tag_pk PRIMARY KEY (tag),
    CONSTRAINT tag_fk FOREIGN KEY (picture_id) REFERENCES Pictures(picture_id)
);

CREATE TABLE Comments (
    comment_id int4 NOT NULL AUTO_INCREMENT,
    comment varchar(255),
    user_id int4,
    comment_doc date,
    picture_id int4,
    CONSTRAINT comment_pk PRIMARY KEY (comment_id),
    CONSTRAINT comment_fk FOREIGN KEY (user_id) REFERENCES Users (user_id),
    CONSTRAINT comment_fk1 FOREIGN KEY (picture_id) REFERENCES Pictures (picture_id)

); 

CREATE TABLE Likes (
    user_id int4,
    picture_id int4,
    CONSTRAINT likes_pk PRIMARY KEY (user_id, picture_id),
    CONSTRAINT likes_fk1 FOREIGN KEY (user_id) REFERENCES Users (user_id),
    CONSTRAINT likes_fk2 FOREIGN KEY (picture_id) REFERENCES Pictures (picture_id)


);

