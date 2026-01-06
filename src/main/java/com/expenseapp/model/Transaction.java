package com.expenseapp.model;

import java.time.LocalDate;

public class Transaction {
    private int id;
    private String description;
    private double amount;
    private String category;
    private LocalDate date;
    private String type; // "expense" or "income"

    // Constructor
    public Transaction(int id, String description, double amount, String category, LocalDate date, String type) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.category = category;
        this.date = date;
        this.type = type;
    }

    // Getters and setters (generate in IDE)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}