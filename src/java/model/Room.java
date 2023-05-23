/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Room extends RoomTypes{
    private int roomNo;
    
    private String type;
    private String availability;

    /**
     *
     */
    public Room() {
    }

    /**
     *
     * @param roomNo
     * @param type
     * @param availability
     */
    public Room(int roomNo, String type, String availability) {
        this.roomNo = roomNo;
        this.type = type;
        this.availability = availability;
    }

    /**
     *
     * @param typeId
     * @param name
     * @param bed
     * @param numberRoom
     * @param maxOccupancy
     * @param price
     * @param service
     * @param image
     * @param details
     * @param roomNo
     * @param type
     * @param availability
     */
    public Room( int typeId, String name, String bed, int numberRoom, int maxOccupancy, double price, String service, String image, String details,int roomNo, String type, String availability) {
        super(typeId, name, bed, numberRoom, maxOccupancy, price, service, image, details);
        this.roomNo = roomNo;
        this.type = type;
        this.availability = availability;
    }
    
    /**
     *
     * @return
     */
    public int getRoomNo() {
        return roomNo;
    }

    /**
     *
     * @param roomNo
     */
    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }

    /**
     *
     * @return
     */
    public String getType() {
        return type;
    }

    /**
     *
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     *
     * @return
     */
    public String getAvailability() {
        return availability;
    }

    /**
     *
     * @param availability
     */
    public void setAvailability(String availability) {
        this.availability = availability;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return super.toString() +  "Room{" + "roomNo=" + roomNo + ", type=" + type + ", availability=" + availability + '}'+ "name= "+ getName() ;
    }

 
 
    

  

   

   
    
    
    
}
