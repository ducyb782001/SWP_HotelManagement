/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ReservationDetail {
    private ArrayList<RoomTypesInReservation> listIn;

    /**
     *
     */
    public ReservationDetail(){
        listIn = new ArrayList<>();
    }

    /**
     *
     * @return
     */
    public ArrayList<RoomTypesInReservation> getListIn() {
        return listIn;
    }

    /**
     *
     * @param typeId
     * @return
     */
    public int getNumberRoomByID(int typeId){
        return getRoomtypeById(typeId).getNumber();
    }
    private RoomTypesInReservation getRoomtypeById(int typeID){
        for(RoomTypesInReservation i:listIn){
            if(i.getRoomtypes().getTypeId()== typeID){
                return i;
            }
        }
        return null;
    }

    /**
     *
     * @param r
     */
    public void addRoomtypeIn(RoomTypesInReservation r){
        if(getRoomtypeById(r.getRoomtypes().getTypeId())!= null){
            RoomTypesInReservation rt = getRoomtypeById(r.getRoomtypes().getTypeId());
            rt.setNumber(rt.getNumber()+ r.getNumber());
        }else{
            listIn.add(r);
        }
    }

    /**
     *
     * @param typeId
     */
    public void removeRoomType(int typeId){
        if(getRoomtypeById(typeId)!=null){
            listIn.remove(getRoomtypeById(typeId));
        }
        
    }

    /**
     *
     * @return
     */
    public double getTotalMoney(){
        double t=0;
        for(RoomTypesInReservation i:listIn){
            t+=(i.getNumber()*i.getPrice());
        }
        return t;
    }
    private RoomTypes getRoomTypeById(int typeId, ArrayList<RoomTypes> list){
        for (RoomTypes i : list) {
            if(i.getTypeId()==typeId){
                return i;
            }
        }
        return null;
    }

    /**
     *
     * @param txt
     * @param list
     */
    public ReservationDetail(String txt, ArrayList<RoomTypes> list){
        listIn = new ArrayList<>();
        try{
        if(txt!=null && txt.length()!=0){
            String [] s = txt.split(",");
            for (String i : s) {
                String[] n= i.split(":");
                int id = Integer.parseInt(n[0]);
                int number=Integer.parseInt(n[1]);
                RoomTypes r = getRoomTypeById(id, list);
                RoomTypesInReservation t = new RoomTypesInReservation(r, number, r.getPrice()*2);
                addRoomtypeIn(t);
                
            }
            
        }
        }catch(NumberFormatException e){
            
        }
    }
    
    

    
    
    
    
}
