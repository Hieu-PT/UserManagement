
package hieupt.controllers;

import hieupt.daos.UserDAO;
import hieupt.dtos.UserDTO;
import java.io.IOException;
import java.util.List;
import org.apache.log4j.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SearchUserController extends HttpServlet {
    private static final String ADMIN = "admin.jsp";
    private static final String SUB = "sub.jsp";
    private static final Logger LOGGER = Logger.getLogger(SearchUserController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = null;
        try {
            HttpSession session = request.getSession();
            String userRole = (String) session.getAttribute("ROLE");
            String search = request.getParameter("txtSearch");
            String role = request.getParameter("role");
            List<UserDTO> result = null;
            UserDAO dao = new UserDAO();
            if(userRole.equalsIgnoreCase("Admin")){
                url = ADMIN;
                if (role.equals("All")) {
                    result = dao.findByLikeName(search, "");
                } else {
                    result = dao.findByLikeName(search, role);
                }
            }
            else if (userRole.equalsIgnoreCase("Sub")) {
                url = SUB;
                result = dao.findByLikeName(search, "Sub", (String) session.getAttribute("USERNAME"));
            }

            
            request.setAttribute("Role", role);
            request.setAttribute("INFO", result);
            
            
            
        } catch (Exception e) {
            LOGGER.error("ERROR at SearchUserController: " + e.getMessage());
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
