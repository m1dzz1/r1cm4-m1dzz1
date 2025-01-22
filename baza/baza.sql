drop database if exists PetAdoptionPlatform;
create database if not exists PetAdoptionPlatform;

use PetAdoptionPlatform;


-- Tabela za korisnike
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    UserType ENUM('Adopter', 'Shelter', 'Owner') NOT NULL,
    FullName VARCHAR(100),
    Address TEXT,
    PhoneNumber VARCHAR(15),
    Preferences TEXT, -- JSON format for adopter preferences (e.g., {"species": "dog", "age": "young"})
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela za skloništa (azile)
CREATE TABLE Shelters (
    ShelterID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL, -- Povezivanje sa tabelom Users
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    Description TEXT,
    Website VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Tabela za ljubimce
CREATE TABLE Pets (
    PetID INT AUTO_INCREMENT PRIMARY KEY,
    ShelterID INT, -- Ako ljubimac pripada skloništu
    OwnerID INT,   -- Ako ljubimac pripada vlasniku
    Name VARCHAR(50) NOT NULL,
    Species ENUM('Dog', 'Cat', 'Other') NOT NULL,
    Breed VARCHAR(100),
    Age INT NOT NULL,
    Size ENUM('Small', 'Medium', 'Large') NOT NULL,
    HealthStatus TEXT,
    VaccinationStatus BOOLEAN DEFAULT FALSE,
    Behavior TEXT,
    GoodWithChildren BOOLEAN,
    GoodWithPets BOOLEAN,
    PhotoURL TEXT,
    Description TEXT,
    Location VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShelterID) REFERENCES Shelters(ShelterID) ON DELETE SET NULL,
    FOREIGN KEY (OwnerID) REFERENCES Users(UserID) ON DELETE SET NULL
);

-- Tabela za poruke
CREATE TABLE Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    Content TEXT NOT NULL,
    SentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Tabela za recenzije
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ReviewerID INT NOT NULL,
    ReviewedShelterID INT, -- Recenzija azila
    ReviewedUserID INT,    -- Recenzija vlasnika/usvojitelja
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ReviewerID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ReviewedShelterID) REFERENCES Shelters(ShelterID) ON DELETE CASCADE,
    FOREIGN KEY (ReviewedUserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Tabela za donacije
CREATE TABLE Donations (
    DonationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL, -- Korisnik koji donira
    ShelterID INT NOT NULL, -- Sklonište koje prima donaciju
    Amount DECIMAL(10, 2) NOT NULL,
    Message TEXT,
    DonatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ShelterID) REFERENCES Shelters(ShelterID) ON DELETE CASCADE
);

-- Tabela za omiljene ljubimce
CREATE TABLE FavoritePets (
    FavoriteID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PetID INT NOT NULL,
    AddedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID) ON DELETE CASCADE
);

-- Tabela za edukativne članke
CREATE TABLE Articles (
    ArticleID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    AuthorID INT,
    PublishedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID) ON DELETE SET NULL
);
