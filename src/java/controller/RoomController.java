/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Room;
import model.RoomType;
import model.User;

/**
 *
 * @author dell
 */
public class RoomController extends HttpServlet {

    int page = 1;
    final int recordsPerPage = 8;
    double maxPrice = 9999999;
    double minPrice = 0;
    int minBed = 1;
    int minPeople = 1;
    int minRoom = 1;
    int minBathRoom = 1;
    Date checkIn;
    Date checkOut;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        RoomDAO rDao = new RoomDAO();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        //check current page of user
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        //list all room id select in cart
        ArrayList<Room> roomSelected = new ArrayList<>();
        if (cookies != null && user != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart_" + user.getTelephone())) {
                    String cookieValue = cookie.getValue();
                    String[] decodedArray = java.net.URLDecoder.decode(cookieValue, "UTF-8").split(";");
                    if (!cookieValue.isEmpty()) {
                        for (String roomID : decodedArray) {
                            roomSelected.add(rDao.getRoomByID(roomID));
                        }
                        request.setAttribute("roomslt", roomSelected);
                    } else {
                        request.setAttribute("roomslt", null);
                    }
                }
            }
        }

        //List all room availalbe in hotel
        ArrayList<Room> roomAvailables = rDao.
                getAllRoomAvailable((page - 1) * recordsPerPage, recordsPerPage,
                        minBed, minPeople, minRoom, minBathRoom, minPrice, maxPrice);
        int noOfRecords = rDao.getTotalRecords(1, minBed, minPeople, minRoom, minBathRoom, minPrice, maxPrice);
        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        //List all type room availalbe in hotel
        RoomTypeDAO rtDao = new RoomTypeDAO();
        ArrayList<RoomType> types = rtDao.getAll();

        request.setAttribute("minBed", minBed);
        request.setAttribute("minPeople", minPeople);
        request.setAttribute("minRoom", minRoom);
        request.setAttribute("minBathRoom", minBathRoom);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);

        ArrayList<Room> sltRoom = (ArrayList<Room>) session.getAttribute("cart");
        session.setAttribute("cart", sltRoom);

        request.setAttribute("types", types);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("listRoom", roomAvailables);
        request.getRequestDispatcher("room.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        RoomDAO rDao = new RoomDAO();
        String action = request.getParameter("action");
        switch (action) {
            case "search":
                try {
                maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
                if (maxPrice > 9999999) {
                    maxPrice = 9999999;
                }
            } catch (Exception e) {
                maxPrice = 9999999;
            }
            try {
                minPrice = Double.parseDouble(request.getParameter("minPrice"));
            } catch (Exception e) {
                if (minPrice > 9999999) {
                    minPrice = 9999999;
                }
            }
            minBed = Integer.parseInt(request.getParameter("minBed"));
            minPeople = Integer.parseInt(request.getParameter("minPeople"));
            minRoom = Integer.parseInt(request.getParameter("minRoom"));
            minBathRoom = Integer.parseInt(request.getParameter("minBathRoom"));
            doGet(request, response);
            break;

            case "book":
                String[] selectedRooms = request.getParameterValues("roomID");
                if (selectedRooms != null) {
                    for (String selectedRoom : selectedRooms) {
                        rDao.bookRoom(selectedRoom);
                    }
                    Cookie userNameCookieRemove = new Cookie("cart_" + user.getTelephone(), "");
                    userNameCookieRemove.setMaxAge(0);
                    response.addCookie(userNameCookieRemove);
                    response.sendRedirect("home");
                }
                break;
            case "find":
                checkIn = Date.valueOf(request.getParameter("datein"));
                checkOut = Date.valueOf(request.getParameter("dateout"));
                
                
                
                
                
                
                
                doGet(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Room getRoomByID(String roomID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
