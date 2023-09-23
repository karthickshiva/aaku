
-- User Management
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('Admin', 'User') NOT NULL
);

-- Schema and Configuration
CREATE TABLE IF NOT EXISTS Schemas (
    SchemaID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    SchemaName VARCHAR(255) NOT NULL,
    Description TEXT,
    CreatedTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE IF NOT EXISTS Tables (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    SchemaID INT NOT NULL,
    TableName VARCHAR(255) NOT NULL,
    Description TEXT,
    FOREIGN KEY (SchemaID) REFERENCES Schemas(SchemaID)
);

CREATE TABLE IF NOT EXISTS Columns (
    ColumnID INT AUTO_INCREMENT PRIMARY KEY,
    TableID INT NOT NULL,
    ColumnName VARCHAR(255) NOT NULL,
    DataType VARCHAR(255) NOT NULL,
    Constraints JSON,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

CREATE TABLE IF NOT EXISTS SampleData (
    SampleDataID INT AUTO_INCREMENT PRIMARY KEY,
    ColumnID INT NOT NULL,
    DataValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (ColumnID) REFERENCES Columns(ColumnID)
);

-- Generated Data
CREATE TABLE IF NOT EXISTS GeneratedData (
    DataID INT AUTO_INCREMENT PRIMARY KEY,
    SchemaID INT NOT NULL,
    TableName VARCHAR(255) NOT NULL,
    ColumnName VARCHAR(255) NOT NULL,
    GeneratedDataValue VARCHAR(255),
    FOREIGN KEY (SchemaID) REFERENCES Schemas(SchemaID)
);
