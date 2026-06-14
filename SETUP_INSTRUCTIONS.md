# Student Information Management App - Setup Guide

## Backend Setup

### 1. Database Setup
- Open XAMPP Control Panel
- Start Apache and MySQL services
- Open phpMyAdmin (http://localhost/phpmyadmin)
- Import the `database.sql` file or create database manually:
  ```sql
  CREATE DATABASE student_management;
  USE student_management;
  CREATE TABLE students (
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL,
      roll_number VARCHAR(50) NOT NULL UNIQUE,
      email VARCHAR(100) NOT NULL,
      cgpa DECIMAL(3, 2) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
  ```

### 2. PHP Files Setup
- Navigate to XAMPP htdocs folder (usually C:\xampp\htdocs or /opt/lampp/htdocs)
- Create a folder named `student_api`
- Copy the PHP files:
  - `config.php`
  - `insert_student.php`
  - `fetch_students.php`

### 3. Verify Backend
- Test insert_student.php: http://localhost/student_api/insert_student.php
- Test fetch_students.php: http://localhost/student_api/fetch_students.php

## Frontend Setup

### 1. Install Flutter
- Download Flutter SDK from flutter.dev
- Add Flutter to PATH
- Run `flutter doctor` to verify installation

### 2. Project Setup
- Navigate to flutter_project folder
- Run `flutter pub get` to install dependencies
- Update API endpoint in `lib/services/api_service.dart` if needed

### 3. Run Application
- Connect Android/iOS device or start emulator
- Run `flutter run`

## API Endpoints

### Insert Student
- **URL**: http://localhost/student_api/insert_student.php
- **Method**: POST
- **Body**:
  ```json
  {
    "name": "John Doe",
    "roll_number": "001",
    "email": "john@example.com",
    "cgpa": 3.8
  }
  ```
- **Response**:
  ```json
  {
    "status": true,
    "message": "Student added successfully"
  }
  ```

### Fetch Students
- **URL**: http://localhost/student_api/fetch_students.php
- **Method**: GET
- **Response**:
  ```json
  {
    "status": true,
    "data": [
      {
        "id": 1,
        "name": "John Doe",
        "roll_number": "001",
        "email": "john@example.com",
        "cgpa": "3.80"
      }
    ]
  }
  ```

## Troubleshooting

- **Connection refused**: Make sure XAMPP MySQL and Apache are running
- **Database not found**: Import the SQL script
- **API not responding**: Check PHP files are in correct htdocs folder
- **Flutter connection error**: Update baseUrl in api_service.dart to your machine's IP if testing on physical device
