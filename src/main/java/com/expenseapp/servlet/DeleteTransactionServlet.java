package com.expenseapp.servlet;

import com.expenseapp.service.TransactionService;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteTransaction")
public class DeleteTransactionServlet extends HttpServlet {
    private TransactionService transactionService = new TransactionService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        transactionService.deleteTransaction(id);
        response.sendRedirect("transactions");
    }
}