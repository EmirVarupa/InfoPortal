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
public class IzmjenaPost extends HttpServlet {

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
        
        

HttpSession sesija = request.getSession();
//postbean pb = (postbean) sesija.getAttribute("postbean");
postbean pb= new postbean();

System.out.println("nije jos prosao getanje parametara");

int id = Integer.parseInt(request.getParameter("id"));
String title1 = request.getParameter("title");
String title=title1.replaceAll("'","");
String summary1 = request.getParameter("summary");
String summary=summary1.replaceAll("'","");
String postcontent1 = request.getParameter("postcontent");
String postcontent=postcontent1.replaceAll("'","");
String imageurl = request.getParameter("imageurl");
 
System.out.println(postcontent);

System.out.println("prosao getanje parametara title: " + title + " summary: " + summary + " postcontent: " + postcontent + " id:" + id);
System.out.println("ovo je objekat" + pb);

pb.setTitle(title);
pb.setPostContent(postcontent);
pb.setSummary(summary);

System.out.println("ovo je summary " + pb.getSummary());


System.out.println("prosao setanje parametara");

sesija.setAttribute("postbean", pb);

System.out.println("prosao kreiranje sesije");

String upit = "update post set "
        + "title = '" + title + "', "
        + "summary = '" + summary + "', "
        + "postcontent = '" + postcontent + "', "
        + "imageurl = '" + imageurl + "' "
        + "where postID='" + id + "'";

System.out.println("prosao sql query");

Connection con = null;
Statement stmt = null;
String address = "prikazPostedit.jsp";

try {
    con = DB.getConnection();
    stmt = con.createStatement();
    stmt.executeUpdate(upit);
    stmt.close();
    con.close();
    System.out.println("Poslan sql query");
} catch (SQLException e) {
    System.out.println(e.getMessage());
    sesija.invalidate();
    String err = e.getMessage();
    request.setAttribute("errormsg", err);
    address = "error";
System.out.println(e);
}

request.setAttribute("poruka", "Podaci su uspješno izmijenjeni!");
request.setAttribute("id", id);
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
