
package hieupt.controllers;

import hieupt.dtos.PromotionDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class UpdatePromotionController extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(UpdatePromotionController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String[] listUsername = request.getParameterValues("txtUsername");
            String[] txtRank = request.getParameterValues("txtRank");
            
            HttpSession session = request.getSession();
            PromotionDTO promotion = (PromotionDTO)session.getAttribute("promotion");
            for (int i = 0; i < listUsername.length; i++) {
                double rank = 5.0;
                try{
                    rank = Double.parseDouble(txtRank[i]);
                } catch (NumberFormatException e){
                    request.setAttribute("RANKMESSAGE", "Rank must between 1-10");
                }
                if(rank < 1 || rank >10){
                        request.setAttribute("RANKMESSAGE", "Rank must between 1-10");
                }else promotion.update(listUsername[i],rank);
            }
            session.setAttribute("promotion", promotion);
            
        } catch (Exception e) {
            LOGGER.error("ERROR at UpdatePromotionController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("SearchPromotionController").forward(request, response);
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
