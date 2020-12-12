/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.commentbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DB;

/**
 *
 * @author emir i amad
 */
public class DodavanjeKomentar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


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
        System.out.println("Prosao dopost parametara");
    commentbean cb = new commentbean();
    
    
    System.out.println("Prosao uzimanje parametara");
    int postID = Integer.parseInt(request.getParameter("postID"));
    int userID = Integer.parseInt(request.getParameter("userID"));
    String commentcontent = request.getParameter("commentcontent").replaceAll("'","");

    cb.setPostID(postID);
    cb.setUserID(userID);
    cb.setCommentcontent(commentcontent);

HttpSession sesija = request.getSession();

sesija.setAttribute("commentbean", cb);

System.out.println("Prosao kreiranje sesije");

String upit = "insert into post_comment(postID, userID, commentcontent) values (" + postID + ", " + userID + ", '" + commentcontent + "')";


Connection con = null;
Statement stmt = null;
String address = "prikazPost.jsp?id="+ postID;

try {
    con = DB.getConnection();
    stmt = con.createStatement();
    stmt.executeUpdate(upit);
    stmt.close();
    con.close();
} catch (SQLException e) {
    System.out.println(e.getMessage());
    sesija.invalidate();
    String err = e.getMessage();
    request.setAttribute("errormsg", err);
    address = "error";
      
}

request.setAttribute("poruka", "Comment has been added!"); //mozda nam nece trebati
RequestDispatcher rd = request.getRequestDispatcher(address);
rd.forward(request, response);
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

}
