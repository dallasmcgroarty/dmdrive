CREATE DATABASE IF NOT EXISTS dmdrive;

Use dmdrive;

/* sql schema for cloud drive

   run with:  mysql> source path/to/file.sql; 

*/
CREATE TABLE Users
(
 UserID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 UserName VARCHAR(50) NOT NULL UNIQUE,
 FirstName CHAR(50),
 Email VARCHAR(255) NOT NULL,
 PasswordHash VARCHAR(255) NOT NULL
);

CREATE TABLE Folders
(
  FolderID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  UserID INT NOT NULL,
  FolderName VARCHAR(255) NOT NULL UNIQUE,
  FolderPath VARCHAR(255) NOT NULL,

  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Files
(
 FileID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 UserID INT NOT NULL,
 FileName VARCHAR(255) NOT NULL,
 FilePath VARCHAR(255) NOT NULL,
 Extension VARCHAR(15) NOT NULL,
 LastUpdated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 UploadDate DATE,

 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (UserName, FirstName, Email, PasswordHash)
VALUES('TomCat245', 'Tom', 'Tom@gmail.com', 'ddfmweof2424p2$');

INSERT INTO FILES (UserID, FileName, FilePath, Extension, UploadDate)
VALUES(1, 'myupload', 'users/files/', '.jpg', CURDATE());