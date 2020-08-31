
package hieupt.controllers;

import hieupt.daos.PromotionDAO;
import hieupt.dtos.PromotionDTO;
import hieupt.dtos.UserDTO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class ConfirmPromotionController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "SearchPromotionController";
    private static final String SUCCESS = "viewPromotionHistory.jsp";
    private static final Logger LOGGER = Logger.getLogger(ConfirmPromotionController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
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
                    url = INVALID;
                }
                if(rank < 1 || rank >10){
                    request.setAttribute("RANKMESSAGE", "Rank must between 1-10");
                    url = INVALID;
                }else promotion.update(listUsername[i],rank);
            }
            if(!url.equals(INVALID)){
                PromotionDAO dao = new PromotionDAO();
                String username = (String) session.getAttribute("USERNAME");
                String fullname = (String) session.getAttribute("NAME");
                HashMap<String, UserDTO> listPromotion = promotion.getPromotionList();
                int promoID = dao.addNewPromotion(username, fullname);
                if (dao.addNewPromotionDetail(promoID, listPromotion)) {
                    url = SUCCESS;
                    promotion.clearPromotion();
                    session.setAttribute("promotion", promotion);
                } else {
                    request.setAttribute("ERROR", "Something went wrong. Please try again later!");
                }
            }
            
            
        } catch (Exception e) {
            LOGGER.error("ERROR at ConfirmPromotionController: " + e.getMessage());
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
