/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ReservationDetail;
import model.RoomTypes;
import model.RoomTypesInReservation;

/**
 *
 * @author Admin
 */
@WebServlet(name="BookRoom", urlPatterns={"/bookroom"})
public class BookRoom extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookRoom</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookRoom at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomDAO dao = new RoomDAO();
        ArrayList<RoomTypes> listrt = dao.getAllRoomType();
        Cookie [] arr = request.getCookies();
        String txt="";
        if(arr!=null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt +=o.getValue();
                }
                
            }
        }
        ReservationDetail redetail = new ReservationDetail(txt, listrt);
        ArrayList<RoomTypesInReservation> listrein = redetail.getListIn();
        int n;
        if(listrein != null){
            n=listrein.size();
        }else{
            n=0;
        }
        request.setAttribute("size", n);
        request.setAttribute("listRoomType", listrt);
        request.getRequestDispatcher("roombooking2.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
