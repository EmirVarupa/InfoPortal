/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * @author Merisa
 */
public class Login extends HttpServlet {

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
        korisnik k = new korisnik();
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        
        String poruka = "";
        if (username.isEmpty() || pass.isEmpty()) {
            poruka = "Username or password is empty!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
        
        Connection con = null;
        Statement stmt = null;
        String address = "listaPostova.jsp";
        String upit = "select * from korisnikinfo where BINARY username = '" + username + "' and password = '" + pass + "'";
        ResultSet rs = null;
        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit);
            
            if (rs.next() && rs.getString("STATUS").equals("ACTIVE")) {
                System.out.println(rs.getString("STATUS"));
                k.setUsername(rs.getString("username"));
                k.setEmail(rs.getString("email"));
                k.setIme(rs.getString("ime"));
                k.setPrezime(rs.getString("prezime"));
                k.setTelefon(rs.getString("telefon"));
                k.setRole(rs.getString("role"));
                stmt.close();
                
                sesija.setAttribute("korisnik", k);
                
            } else {
                poruka = "Wrong username or password, or the user is marked as inactive.";
                request.setAttribute("poruka", poruka);
                address = "index.jsp";
                stmt.close();
            }
            
            stmt.close();
            con.close();
        } catch (SQLException e) {
            sesija.invalidate();
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error";
            
        }
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
