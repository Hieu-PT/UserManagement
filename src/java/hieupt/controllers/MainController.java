
package hieupt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class MainController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final Logger LOGGER = Logger.getLogger(MainController.class);
    
    private static final String SEARCH = "SearchUserController";
    private static final String DELETE = "DeleteUserController";
    private static final String EDIT = "EditUserController";
    private static final String UPDATE = "UpdateUserController";
    private static final String INSERT = "InsertUserController";
    
    private static final String ADD = "AddPromotionController";
    private static final String SAVE = "UpdatePromotionController";
    private static final String CONFIRM = "ConfirmPromotionController";
    private static final String REMOVE = "RemovePromotionController";
    
    private static final String SEARCH_HISTORY = "SearchPromotionHistoryController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String action = request.getParameter("action");
            if(action.equalsIgnoreCase("Login"))
                url = LOGIN;
            else if(action.equalsIgnoreCase("Search"))
                url = SEARCH;
            else if(action.equalsIgnoreCase("Delete"))
                url = DELETE;
            else if(action.equalsIgnoreCase("Update"))
                url = UPDATE;
            else if(action.equalsIgnoreCase("Create"))
                url = INSERT;
            else if(action.equalsIgnoreCase("Edit"))
                url = EDIT;
            else if(action.equalsIgnoreCase("Add"))
                url = ADD;
            else if(action.equalsIgnoreCase("Save"))
                url = SAVE;
            else if(action.equalsIgnoreCase("Confirm"))
                url = CONFIRM;
            else if(action.equalsIgnoreCase("Remove"))
                url = REMOVE;
            else if(action.equalsIgnoreCase("Search "))
                url = SEARCH_HISTORY;
            else {
                request.setAttribute("ERROR", "Your action is invalid");
            }
        }
        catch (Exception e){
            LOGGER.error("ERROR at Maincontroller: " + e.getMessage());
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
