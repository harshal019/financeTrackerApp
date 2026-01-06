package com.expenseapp.service;

import com.expenseapp.model.Transaction;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class TransactionService {
    private final List<Transaction> transactions = new ArrayList<>();
    private final AtomicInteger idCounter = new AtomicInteger(1);

    public void addTransaction(String description, double amount, String category, LocalDate date, String type) {
        Transaction transaction = new Transaction(idCounter.getAndIncrement(), description, amount, category, date, type);
        transactions.add(transaction);
    }

    public List<Transaction> getAllTransactions() {
        return new ArrayList<>(transactions);
    }

    public List<Transaction> getExpenses() {
        return transactions.stream().filter(t -> "expense".equals(t.getType())).collect(Collectors.toList());
    }

    public List<Transaction> getIncomes() {
        return transactions.stream().filter(t -> "income".equals(t.getType())).collect(Collectors.toList());
    }

    public boolean deleteTransaction(int id) {
        return transactions.removeIf(transaction -> transaction.getId() == id);
    }

    public double getTotalExpenses() {
        return getExpenses().stream().mapToDouble(Transaction::getAmount).sum();
    }

    public double getTotalIncomes() {
        return getIncomes().stream().mapToDouble(Transaction::getAmount).sum();
    }

    public double getNetBalance() {
        return getTotalIncomes() - getTotalExpenses();
    }
}