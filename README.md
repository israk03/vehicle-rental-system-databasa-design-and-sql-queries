# Vehicle Rental System - Database Design

## 📋 Project Overview

This project demonstrates the design and implementation of a **Vehicle Rental System Database** using MySQL. The system manages users, vehicles, and bookings with proper relational database design principles, including primary keys, foreign keys, and normalized table structures.

## 🎯 Project Objectives

The main objectives of this project are:

- Design an Entity-Relationship Diagram (ERD) with proper relationships
- Implement database tables with appropriate constraints
- Write SQL queries to retrieve and analyze data
- Demonstrate understanding of database concepts like JOINs, aggregation, and subqueries

## 🗄️ Database Schema

The database consists of three main tables:

### 1. Users Table
Stores information about customers and administrators.

| Column   | Type         | Constraints           |
|----------|--------------|------------------------|
| user_id  | INT          | PRIMARY KEY, AUTO_INCREMENT |
| name     | VARCHAR(100) | NOT NULL              |
| email    | VARCHAR(100) | UNIQUE, NOT NULL      |
| password | VARCHAR(255) | NOT NULL              |
| phone    | VARCHAR(15)  | NOT NULL              |
| role     | ENUM         | 'Admin', 'Customer'   |

### 2. Vehicles Table
Stores information about available rental vehicles.

| Column               | Type         | Constraints                    |
|----------------------|--------------|--------------------------------|
| vehicle_id           | INT          | PRIMARY KEY, AUTO_INCREMENT    |
| name                 | VARCHAR(100) | NOT NULL                       |
| type                 | ENUM         | 'car', 'bike', 'truck'         |
| model                | VARCHAR(50)  | NOT NULL                       |
| registration_number  | VARCHAR(20)  | UNIQUE, NOT NULL               |
| rental_price         | DECIMAL(10,2)| NOT NULL                       |
| status               | ENUM         | 'available', 'rented', 'maintenance' |

### 3. Bookings Table
Stores rental booking transactions.

| Column      | Type          | Constraints           |
|-------------|---------------|-----------------------|
| booking_id  | INT           | PRIMARY KEY, AUTO_INCREMENT |
| user_id     | INT           | FOREIGN KEY → Users(user_id) |
| vehicle_id  | INT           | FOREIGN KEY → Vehicles(vehicle_id) |
| start_date  | DATE          | NOT NULL              |
| end_date    | DATE          | NOT NULL              |
| status      | ENUM          | 'pending', 'confirmed', 'completed', 'cancelled' |
| total_cost  | DECIMAL(10,2) | NOT NULL              |

## 🔗 Entity Relationship Diagram (ERD)

The complete ERD showing all tables, relationships, primary keys, and foreign keys can be viewed here:

**ERD Link:** [https://drawsql.app/teams/israk-1/diagrams/vehicle-rental-system](https://drawsql.app/teams/israk-1/diagrams/vehicle-rental-system)

### Relationships

- **Users → Bookings**: One-to-Many (One user can make many bookings)
- **Vehicles → Bookings**: One-to-Many (One vehicle can have many bookings)
- **Bookings**: Each booking connects exactly one user with one vehicle

## 📊 SQL Queries

All SQL queries are available in the `queries.sql` file. Below is a summary of the implemented queries:

### Query 1: JOIN - Retrieve Booking Details with Customer and Vehicle Names
Retrieves comprehensive booking information by joining Users, Vehicles, and Bookings tables.

**Concepts Used:** INNER JOIN, Multiple Table Joins

### Query 2: EXISTS - Find Vehicles Never Booked
Identifies vehicles that have no booking records using a subquery with NOT EXISTS.

**Concepts Used:** NOT EXISTS, Subquery

### Query 3: WHERE - Filter Available Vehicles by Type
Retrieves all available vehicles of a specific type (e.g., cars) using conditional filtering.

**Concepts Used:** SELECT, WHERE, Multiple Conditions

### Query 4: GROUP BY and HAVING - Count Bookings per Vehicle
Finds vehicles with more than 2 bookings using aggregation and group filtering.

**Concepts Used:** GROUP BY, HAVING, COUNT, Aggregate Functions

## 🚀 How to Use

### Prerequisites
- MySQL Server (version 5.7 or higher)
- MySQL Workbench or any MySQL client

### Setup Instructions

1. **Create the database:**
CREATE DATABASE vehicle_rental_system;
USE vehicle_rental_system;

2. **Create tables:**
Run the SQL schema from the ERD or create tables using the structure defined above.

3. **Insert sample data:**
Insert test data for Users, Vehicles, and Bookings tables.

4. **Execute queries:**
Run the queries from `queries.sql` to retrieve and analyze data.

## 📁 Project Structure
```
vehicle-rental-system/
│
├── README.md # Project documentation (this file)
├── queries.sql # All SQL queries with solutions
└── ERD Link # Link to Entity Relationship Diagram
```



## 💡 Key Features

- **Normalized Database Design**: Tables follow proper normalization principles
- **Data Integrity**: Primary keys and foreign keys ensure referential integrity
- **Unique Constraints**: Email and registration numbers are unique
- **Status Tracking**: ENUM types for user roles, vehicle status, and booking status
- **Flexible Queries**: Demonstrates various SQL techniques (JOINs, subqueries, aggregation)

## 🎓 Learning Outcomes

Through this project, I have demonstrated understanding of:

- Database design principles and ERD creation
- Primary and foreign key relationships
- SQL query writing (JOINs, WHERE, GROUP BY, HAVING, EXISTS)
- Data constraints and integrity
- Relational database concepts


---

**Note:** This project is part of the Apollo Level 2 Web Development curriculum focusing on database fundamentals and SQL query skills.
