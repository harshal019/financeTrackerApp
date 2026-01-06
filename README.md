
# Expense Tracker

A robust Java-based expense tracking application built with Maven, designed to help users manage personal finances efficiently.

## Features
- **Expense Logging**: Easily add, edit, and delete expenses with categories and dates.
- **Categorization**: Organize expenses into predefined categories (e.g., Food, Transport, Entertainment).
- **Reporting**: Generate monthly or yearly reports with summaries and charts.
- **Data Persistence**: Store data in a local database (e.g., H2 or SQLite).
- **User-Friendly Interface**: Simple CLI or web-based UI for easy interaction.

## Prerequisites
- Java 17 or higher
- Maven 3.8+
- (Optional) IDE like IntelliJ IDEA or VS Code

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/expense-tracker.git
   cd expense-tracker
   ```
2. Install dependencies and build:
   ```bash
   mvn clean install
   ```

## Usage
### Running the Application
- **CLI Mode**:
  ```bash
  mvn exec:java -Dexec.mainClass="com.example.expensetracker.Main"
  ```
- **Web Mode** (if applicable):
  ```bash
  mvn spring-boot:run  # Assuming Spring Boot
  ```
  Access at `http://localhost:8080`.

### Example Commands
- Add an expense: Follow on-screen prompts or use API endpoints.
- View reports: Navigate to the reports section in the UI.

## Screenshots
- **Dashboard**: Overview of total expenses and recent entries.  
  ![Dashboard](screenshots/dashboard.png)
- **Add Expense**: Form to input new expenses.  
  ![Add Expense](screenshots/add-expense.png)
- **Monthly Report**: Visual breakdown of expenses.  
  ![Report](screenshots/monthly-report.png)

*Replace with actual images in the `screenshots/` directory.*

## API Endpoints (if web-based)
- `GET /api/transactions` - Fetch all expenses
- `POST /api/transactions` - Create a new expense
- `PUT /api/transactions/{id}` - Update an expense
- `DELETE /api/transactions/{id}` - Delete an expense

## Contributing
1. Fork the repo.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit changes: `git commit -m 'Add feature'`.
4. Push: `git push origin feature-name`.
5. Submit a Pull Request.

## Testing
Run tests with:
```bash
mvn test
```





