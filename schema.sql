-- Database schema for Job Card Management System  

CREATE TABLE Users (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    username VARCHAR(255) NOT NULL,  
    password VARCHAR(255) NOT NULL,  
    email VARCHAR(255) NOT NULL,  
    role ENUM('Admin', 'User') DEFAULT 'User',  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

CREATE TABLE Job_Cards (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    job_number VARCHAR(255) NOT NULL,  
    description TEXT NOT NULL,  
    status ENUM('Open', 'Closed') DEFAULT 'Open',  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
    user_id INT,  
    FOREIGN KEY (user_id) REFERENCES Users(id)  
);  

CREATE TABLE Comments (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    job_card_id INT,  
    user_id INT,  
    content TEXT NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (job_card_id) REFERENCES Job_Cards(id),  
    FOREIGN KEY (user_id) REFERENCES Users(id)  
);  

CREATE TABLE Attachments (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    job_card_id INT,  
    file_path VARCHAR(255) NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (job_card_id) REFERENCES Job_Cards(id)  
);  

CREATE TABLE Audit_Log (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    job_card_id INT,  
    action ENUM('Created', 'Updated', 'Closed') NOT NULL,  
    user_id INT,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (job_card_id) REFERENCES Job_Cards(id),  
    FOREIGN KEY (user_id) REFERENCES Users(id)  
);  
