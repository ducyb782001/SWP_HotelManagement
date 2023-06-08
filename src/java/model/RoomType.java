/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class RoomType {
    private int id;
    private String name;
    private double price;
    private boolean status;
    private String description;
    private int maxPeople;
    private int bed;
    private int numberOfRoom;
    private int bathroom;

    public RoomType() {
    }

    public RoomType(int id, String name, double price, boolean status, String description, int maxPeople, int bed, int numberOfRoom, int bathroom) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.status = status;
        this.description = description;
        this.maxPeople = maxPeople;
        this.bed = bed;
        this.numberOfRoom = numberOfRoom;
        this.bathroom = bathroom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getBed() {
        return bed;
    }

    public void setBed(int bed) {
        this.bed = bed;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }

    public int getBathroom() {
        return bathroom;
    }

    public void setBathroom(int bathroom) {
        this.bathroom = bathroom;
    }
    
    
}
