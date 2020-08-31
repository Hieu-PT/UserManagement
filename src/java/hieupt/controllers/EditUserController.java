
package hieupt.controllers;

import hieupt.daos.UserDAO;
import hieupt.dtos.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;


public class EditUserController extends HttpServlet {
    private static final String ADMIN = "updateUser.jsp";
    private static final String SUB = "updateProfile.jsp";
    private static final Logger LOGGER = Logger.getLogger(EditUserController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = null;
        try {
            String id = request.getParameter("id");
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.findByPrimaryKey(id);
            request.setAttribute("Role", dto.getRole());
            request.setAttribute("DTO", dto);
            
            HttpSession session = request.getSession();
            if(session.getAttribute("ROLE").equals("Admin"))
                url = ADMIN;
            else if(session.getAttribute("ROLE").equals("Sub"))
                url = SUB;
        } catch (Exception e) {
            LOGGER.error("ERROR at EditUserController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
