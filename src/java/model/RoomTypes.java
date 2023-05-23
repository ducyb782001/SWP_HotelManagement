/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class RoomTypes {
    private int typeId;
    private String name;
    private String bed;
    private int totalRoom;
    private int maxOccupancy;
    private double price;
    private String service;
    private String image;
    private String details;

    /**
     *
     */
    public RoomTypes() {
    }

    /**
     *
     * @param typeId
     * @param name
     * @param bed
     * @param totalRoom
     * @param maxOccupancy
     * @param price
     * @param service
     * @param image
     * @param details
     */
    public RoomTypes(int typeId, String name, String bed, int totalRoom, int maxOccupancy, double price, String service, String image, String details) {
        this.typeId = typeId;
        this.name = name;
        this.bed = bed;
        this.totalRoom = totalRoom;
        this.maxOccupancy = maxOccupancy;
        this.price = price;
        this.service = service;
        this.image = image;
        this.details = details;
    }

    /**
     *
     * @param name
     * @param bed
     * @param totalRoom
     * @param maxOccupancy
     * @param price
     * @param service
     * @param image
     * @param details
     */
    public RoomTypes( String name, String bed, int totalRoom, int maxOccupancy, double price, String service, String image, String details) {
        
        this.name = name;
        this.bed = bed;
        this.totalRoom = totalRoom;
        this.maxOccupancy = maxOccupancy;
        this.price = price;
        this.service = service;
        this.image = image;
        this.details = details;
    }

    /**
     *
     * @param typeId
     * @param name
     */
    public RoomTypes(int typeId, String name) {
        this.typeId = typeId;
        this.name = name;
    }

    /**
     *
     * @return
     */
    public int getMaxOccupancy() {
        return maxOccupancy;
    }

    /**
     *
     * @param maxOccupancy
     */
    public void setMaxOccupancy(int maxOccupancy) {
        this.maxOccupancy = maxOccupancy;
    }

    /**
     *
     * @return
     */
    public int getTypeId() {
        return typeId;
    }

    /**
     *
     * @param typeId
     */
    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    public String getBed() {
        return bed;
    }

    /**
     *
     * @param bed
     */
    public void setBed(String bed) {
        this.bed = bed;
    }

    /**
     *
     * @return
     */
    public int getTotalRoom() {
        return totalRoom;
    }

    /**
     *
     * @param totalRoom
     */
    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
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

    /**
     *
     * @return
     */
    public String getService() {
        return service;
    }

    /**
     *
     * @param service
     */
    public void setService(String service) {
        this.service = service;
    }

    /**
     *
     * @return
     */
    public String getImage() {
        return image;
    }

    /**
     *
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     *
     * @return
     */
    public String getDetails() {
        return details;
    }

    /**
     *
     * @param details
     */
    public void setDetails(String details) {
        this.details = details;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "RoomTypes{" + "typeId=" + typeId + ", name=" + name + ", bed=" + bed + ", totalRoom=" + totalRoom + ", price=" + price + ", service=" + service + ", image=" + image + ", details=" + details + '}';
    }
    
    
}
