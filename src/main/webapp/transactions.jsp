<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark"> <!-- Enable Bootstrap dark theme -->
<head>
    <meta charset="UTF-8">
    <title>Expense & Income Tracker</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body { background-color: #121212; color: #ffffff; } /* Dark background and light text */
        .container { max-width: 1000px; margin-top: 50px; }
        .summary { margin-bottom: 20px; }
        .card { background-color: #1e1e1e; border: 1px solid #333; } /* Dark cards */
        .card-header { background-color: #2a2a2a; border-bottom: 1px solid #333; }
        .form-control, .form-select { background-color: #2a2a2a; color: #ffffff; border: 1px solid #555; }
        .form-control:focus, .form-select:focus { background-color: #2a2a2a; color: #ffffff; border-color: #007bff; }
        .btn-danger { background-color: #dc3545; border-color: #dc3545; }
        .btn-success { background-color: #28a745; border-color: #28a745; }
        .badge { font-size: 0.8em; }
        .table { color: #ffffff; } /* Ensure table text is light */
        .table-dark { background-color: #1e1e1e; }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Expense Tracker</h1>

        <!-- Enhanced Analysis Section -->
        <div class="row summary">
            <div class="col-md-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5>Total Income</h5>
                        <h3>$<fmt:formatNumber value="${totalIncomes}" pattern="0.00"/></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5>Total Expenses</h5>
                        <h3>$<fmt:formatNumber value="${totalExpenses}" pattern="0.00"/></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white ${netBalance >= 0 ? 'bg-primary' : 'bg-warning'}">
                    <div class="card-body">
                        <h5>Net Balance</h5>
                        <h3>$<fmt:formatNumber value="${netBalance}" pattern="0.00"/></h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Category Breakdown Table -->
        <div class="card mb-4">
            <div class="card-header">Category Breakdown</div>
            <div class="card-body">
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
                            <th>Category</th>
                            <th>Type</th>
                            <th>Total Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="transaction" items="${transactions}">
                            <tr>
                                <td>${transaction.category}</td>
                                <td><span class="badge ${transaction.type == 'income' ? 'bg-success' : 'bg-danger'}">${transaction.type}</span></td>
                                <td>$<fmt:formatNumber value="${transaction.amount}" pattern="0.00"/></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty transactions}">
                            <tr>
                                <td colspan="3" class="text-muted">No transactions yet.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Single Form for Adding Transaction -->
        <div class="card mb-4">
            <div class="card-header">Add Transaction</div>
            <div class="card-body">
                <form id="transactionForm" action="transactions" method="post">
                    <div class="mb-3">
                        <label class="form-label">Type</label>
                        <div>
                            <input type="radio" id="expenseType" name="type" value="expense" checked> <label for="expenseType">Expense</label>
                            <input type="radio" id="incomeType" name="type" value="income" class="ms-3"> <label for="incomeType">Income</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount ($)</label>
                        <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-select" id="category" name="category" required>
                            <!-- Expense categories by default -->
                            <option value="Food">Food</option>
                            <option value="Transport">Transport</option>
                            <option value="Entertainment">Entertainment</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Transaction</button>
                </form>
            </div>
        </div>

        <!-- Transactions List -->
        <div class="card">
            <div class="card-header">All Transactions</div>
            <div class="card-body">
                <c:if test="${empty transactions}">
                    <p class="text-muted">No transactions yet.</p>
                </c:if>
                <c:forEach var="transaction" items="${transactions}">
                    <div class="d-flex justify-content-between align-items-center border-bottom py-2" style="border-color: #333 !important;">
                        <div>
                            <strong>${transaction.description}</strong> - ${transaction.category} - $<fmt:formatNumber value="${transaction.amount}" pattern="0.00"/> on ${transaction.date}
                            <span class="badge ${transaction.type == 'income' ? 'bg-success' : 'bg-danger'}">${transaction.type}</span>
                        </div>
                        <form action="deleteTransaction" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${transaction.id}">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script>
        // Dynamic category options based on type
        const categorySelect = document.getElementById('category');
        const expenseCategories = ['Food', 'Transport', 'Entertainment', 'Other'];
        const incomeCategories = ['Salary', 'Freelance', 'Investment', 'Other'];

        document.querySelectorAll('input[name="type"]').forEach(radio => {
            radio.addEventListener('change', function() {
                categorySelect.innerHTML = '';
                const categories = this.value === 'expense' ? expenseCategories : incomeCategories;
                categories.forEach(cat => {
                    const option = document.createElement('option');
                    option.value = cat;
                    option.textContent = cat;
                    categorySelect.appendChild(option);
                });
            });
        });

        // Validation for positive amounts
        document.getElementById('transactionForm').addEventListener('submit', function(e) {
            const amount = parseFloat(this.amount.value);
            if (amount <= 0) {
                alert('Amount must be positive.');
                e.preventDefault();
            }
        });
    </script>
</body>
</html>