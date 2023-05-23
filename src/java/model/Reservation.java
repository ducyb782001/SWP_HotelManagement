/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author Admin
 */
public class Reservation {
    private int reservationId;
    private int accountId;
    private int typeId;
    private int guest;
    private int numberRoom;
    private String bookingDate;
    private String checkIn;
    private String checkOut;
    private String status;
    
    /**
     *
     */
    public Reservation() {
    }

    /**
     *
     * @param reservationId
     * @param accountId
     * @param typeId
     * @param guest
     * @param numberRoom
     * @param bookingDate
     * @param checkIn
     * @param checkOut
     * @param status
     */
    public Reservation(int reservationId, int accountId, int typeId, int guest, int numberRoom, String bookingDate, String checkIn, String checkOut, String status) {
        this.reservationId = reservationId;
        this.accountId = accountId;
        this.typeId = typeId;
        this.guest = guest;
        this.numberRoom = numberRoom;
        this.bookingDate = bookingDate;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.status = status;
    }

    /**
     *
     * @return
     */
    public int getReservationId() {
        return reservationId;
    }

    /**
     *
     * @param reservationId
     */
    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    /**
     *
     * @return
     */
    public int getAccountId() {
        return accountId;
    }

    /**
     *
     * @param accountId
     */
    public void setAccountId(int accountId) {
        this.accountId = accountId;
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
    public int getGuest() {
        return guest;
    }

    /**
     *
     * @param guest
     */
    public void setGuest(int guest) {
        this.guest = guest;
    }

    /**
     *
     * @return
     */
    public int getNumberRoom() {
        return numberRoom;
    }

    /**
     *
     * @param numberRoom
     */
    public void setNumberRoom(int numberRoom) {
        this.numberRoom = numberRoom;
    }

    /**
     *
     * @return
     */
    public String getBookingDate() {
        return bookingDate;
    }

    /**
     *
     * @param bookingDate
     */
    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    /**
     *
     * @return
     */
    public String getCheckIn() {
        return checkIn;
    }

    /**
     *
     * @param checkIn
     */
    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    /**
     *
     * @return
     */
    public String getCheckOut() {
        return checkOut;
    }

    /**
     *
     * @param checkOut
     */
    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    /**
     *
     * @return
     */
    public String getStatus() {
        return status;
    }

    /**
     *
     * @param status
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "Reservation{" + "reservationId=" + reservationId + ", accountId=" + accountId + ", typeId=" + typeId + ", guest=" + guest + ", numberRoom=" + numberRoom + ", bookingDate=" + bookingDate + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", status=" + status + '}';
    }

    
   
   
    
    
}
