package com.expenseapp.servlet;

import com.expenseapp.service.TransactionService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {
    private TransactionService transactionService = new TransactionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("transactions", transactionService.getAllTransactions());
        request.setAttribute("totalExpenses", transactionService.getTotalExpenses());
        request.setAttribute("totalIncomes", transactionService.getTotalIncomes());
        request.setAttribute("netBalance", transactionService.getNetBalance());
        request.getRequestDispatcher("/transactions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String category = request.getParameter("category");
        LocalDate date = LocalDate.parse(request.getParameter("date"), DateTimeFormatter.ISO_LOCAL_DATE);
        String type = request.getParameter("type"); // "expense" or "income"

        transactionService.addTransaction(description, amount, category, date, type);
        response.sendRedirect("transactions");
    }
}