
package hieupt.controllers;

import hieupt.daos.UserDAO;
import hieupt.dtos.UserDTO;
import hieupt.dtos.UserErrorObj;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.log4j.Logger;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 *50,
        maxRequestSize = 1024 * 1024 * 50)
public class UpdateUserController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final Logger LOGGER = Logger.getLogger(UpdateUserController.class);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String responsePage = null;
            String role = request.getParameter("role");
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String name = request.getParameter("txtName");
            String email = request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone");
            String photo = request.getParameter("txtPhoto");
            Part imagePart = request.getPart("image");
            
            UserDAO dao = new UserDAO();
            UserDTO dto;
            String validEmail = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
            
            UserErrorObj errorObj = new UserErrorObj();
            boolean valid = true;
            
            if(!(password.length() == 0)){
                if (confirm.equals(password) == false) {
                    errorObj.setConfirmError("Confirm must match Password");
                    valid = false;
                }
            }
            
            if(name.length() == 0){
                errorObj.setNameError("Name can't be blank");
                valid = false;
            }
            if(!(email.matches(validEmail))){
                errorObj.setEmailError("Email is invalid");
                valid = false;
            }
            if(email.length() == 0){
                errorObj.setEmailError("Email can't be blank");
                valid = false;
            }
            if(phone.length() == 0){
                errorObj.setPhoneError("Phone can't be blank");
                valid = false;
            }
            
            int lastIndexBeforeExtension = imagePart.getSubmittedFileName().lastIndexOf(".");
            String imageExtension = imagePart.getSubmittedFileName().substring(lastIndexBeforeExtension + 1);
            HttpSession session = request.getSession();
            if(session.getAttribute("ROLE").equals("Admin"))
                if(session.getAttribute("USERNAME").equals(username) && role.equals("Sub"))
                    responsePage = "LogoutController";
                else responsePage = "updateUser.jsp";
            else if(session.getAttribute("ROLE").equals("Sub")){
                role = "Sub";
                responsePage = "updateProfile.jsp";
            }
                
            dto = new UserDTO(username, "", name, email, phone, photo, role);
            if(!(password.length() == 0)) dto.setPassword(password);
            if(valid){
                if(!(imageExtension.equals(""))){
                    ServletContext sc = getServletContext();
                    String imageName = username + "." + imageExtension;
                    String imageFolder = (String) sc.getAttribute("IMAGE_FOLDER");
                    imagePart.write(imageFolder + imageName);

                    String relativePath = sc.getInitParameter("imageFolderName") + File.separator + imageName;
                    dto.setPhoto(relativePath);
                }
                if(dao.updateUser(dto)){
                    url = responsePage;
                    request.setAttribute("MESSAGE", "Update Successfully");
                } else{
                    request.setAttribute("ERROR", "Update Failed");
                }
            }else {
                url = responsePage;
                request.setAttribute("INVALID", errorObj);
            }
            request.setAttribute("Role", role);
            request.setAttribute("DTO", dto);
        } catch (Exception e) {
            LOGGER.error("ERROR at CreateUserController: " + e.getMessage());
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
