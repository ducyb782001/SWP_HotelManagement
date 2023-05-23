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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.RoomTypes;

/**
 *
 * @author Admin
 */
@WebServlet(name="SearchByAjax", urlPatterns={"/searchajax"})
public class SearchByAjax extends HttpServlet {
   
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
      double price = Double.parseDouble(request.getParameter("searchbyprice"));
        RoomDAO dao = new RoomDAO();
        ArrayList<RoomTypes> listbyprice = dao.searchByPrice(price);
        PrintWriter out = response.getWriter();
        for (RoomTypes o : listbyprice) {
            out.println("<div class=\"col-lg-4 col-md-6\">\n" +
"                <div class=\"room-item\">\n" +
"                    <img src=\""+o.getImage()+"\" alt=\"\">\n" +
"                    <div class=\"ri-text\">\n" +
"                        <div class=\"rd-title \">\n" +
"                            <h4>"+o.getName()+"</h4>\n" +
"                        </div>\n" +
"                        <h3>"+o.getPrice()+" $<span>/Pernight</span></h3>\n" +
"                        <table>\n" +
"                            <tbody>\n" +
"                                <tr>\n" +
"                                    <td class=\"r-o\">Size:</td>\n" +
"                                    <td>30 ft</td>\n" +
"                                </tr>\n" +
"                                <tr>\n" +
"                                    <td class=\"r-o\">Capacity:</td>\n" +
"                                    <td>"+o.getMaxOccupancy()+"</td>\n" +
"                                </tr>\n" +
"                                <tr>\n" +
"                                    <td class=\"r-o\">Bed:</td>\n" +
"                                    <td>"+o.getBed()+"</td>\n" +
"                                </tr>\n" +
"                                 \n" +
"                               \n" +
"                            </tbody>\n" +
"                        </table>\n" +
"                        <a href=\"roomdetail?typeId=${roomt.typeId}\" class=\"primary-btn\">More Details</a>\n" +
"                        \n" +
"                        <a href=\"#\" class=\"primary-btn\" style=\"float: right;\n" +
"	text-align: right;background-color: #dfa974;padding: 3px 3px 3px 3px;text-decoration: none;\"> Booking</a>\n" +
"                       \n" +
"                         \n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>");
            
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
        processRequest(request, response);
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
