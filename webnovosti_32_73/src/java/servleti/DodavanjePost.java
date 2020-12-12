/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.postbean;
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
public class DodavanjePost extends HttpServlet {

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
        
      postbean pb = new postbean();

    String title = request.getParameter("title").replaceAll("'","");
    String summary = request.getParameter("summary").replaceAll("'","");
    String postcontent = request.getParameter("postcontent").replaceAll("'","");
    String imageurl = request.getParameter("imageurl");

System.out.println("Prosao uzimanje parametara");

pb.setTitle(title);
pb.setSummary(summary);
pb.setPostContent(postcontent);

System.out.println(pb.getTitle());
System.out.println(pb.getSummary());
System.out.println(pb.getPostContent());

HttpSession sesija = request.getSession();
sesija.setAttribute("postbean", pb);

System.out.println("Prosao kreiranje sesije");

String upit = "insert into post(title, postcontent, summary, imageurl) values ('" + title + "', '" + postcontent + "', '" + summary + "', '" + imageurl + "')";


Connection con = null;
Statement stmt = null;
String address = "/listaPostova.jsp";

try {
    con = DB.getConnection();
    stmt = con.createStatement();
    stmt.executeUpdate(upit);
    stmt.close();
    con.close();
} catch (SQLException e) {
    sesija.invalidate();
    String err = e.getMessage();
    request.setAttribute("errormsg", err);
    address = "error";

}

request.setAttribute("poruka", "Post has been added!"); //mozda nam nece trebati
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
