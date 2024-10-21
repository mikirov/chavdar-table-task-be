# Table Task Backend

This repository contains the backend code for the Table Task application.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/)
- [MySQL](https://www.mysql.com/)

### Installation

1. Clone the repository:
  ```sh
  git clone https://github.com/yourusername/table-task-be.git
  cd table-task-be
  ```

2. Install dependencies:
  ```sh
  npm install
  ```

3. Import the database schema:
  ```sh
  mysql -u yourusername -p yourpassword yourdatabase < db.sql
  ```

4. Configure environment variables:
  Create a `.env` file in the root directory and add the following:
  ```env
  DB_HOST=localhost
  DB_USER=yourusername
  DB_PASSWORD=yourpassword
  DB_NAME=yourdatabase
  ```

### Running the Application

Start the development server:
```sh
npm start
```


## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.