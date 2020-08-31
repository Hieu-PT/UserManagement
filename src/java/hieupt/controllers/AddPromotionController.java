
package hieupt.controllers;

import hieupt.daos.UserDAO;
import hieupt.dtos.PromotionDTO;
import hieupt.dtos.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class AddPromotionController extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(AddPromotionController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            PromotionDTO promotion = (PromotionDTO) session.getAttribute("promotion");
            if(promotion == null){
                promotion = new PromotionDTO((String) session.getAttribute("USERNAME"));
            }
            String username = request.getParameter("username");
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.findByPrimaryKey(username);
            dto.setRank(5.0);
            
            promotion.addToPromotion(dto);
            
            session.setAttribute("promotion", promotion);
        } catch (Exception e) {
            LOGGER.error("ERROR at AddPromotionController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("SearchUserController").forward(request, response);
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
