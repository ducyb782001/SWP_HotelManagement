/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class RoomTypesInReservation {
    private RoomTypes roomtypes;
    private int number;
    private double price;

    /**
     *
     * @param roomtypes
     * @param number
     * @param price
     */
    public RoomTypesInReservation(RoomTypes roomtypes, int number, double price) {
        this.roomtypes = roomtypes;
        this.number = number;
        this.price = price;
    }

    /**
     *
     */
    public RoomTypesInReservation() {
    }

    /**
     *
     * @return
     */
    public RoomTypes getRoomtypes() {
        return roomtypes;
    }

    /**
     *
     * @param roomtypes
     */
    public void setRoomtypes(RoomTypes roomtypes) {
        this.roomtypes = roomtypes;
    }

    /**
     *
     * @return
     */
    public int getNumber() {
        return number;
    }

    /**
     *
     * @param number
     */
    public void setNumber(int number) {
        this.number = number;
    }

    /**
     *
     * @return
     */
    public double getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
