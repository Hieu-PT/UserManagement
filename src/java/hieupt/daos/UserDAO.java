
package hieupt.daos;

import hieupt.conn.MyConnection;
import hieupt.dtos.UserDTO;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public UserDAO() {
    }
    
    private void closeConnection() throws Exception{
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(conn != null)
            conn.close();
    }
    
    public UserDTO checkLogin(String username, String password) throws Exception {
        UserDTO dto = null;
        String role;
        String name;
        String passwordInSHA256 = toSHA256(password);
        try {
            String sql = "Select Role, Name From tblUsers JOIN tblRoles ON tblUsers.Username = tblRoles.Username"
                + " Where tblUsers.Username = ? and Password = ? and tblUsers.Status = 'Active' and tblRoles.Status = 'Active'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, passwordInSHA256);
            rs = preStm.executeQuery();
            if(rs.next()){
                name = rs.getString("Name");
                role = rs.getString("Role");
                dto = new UserDTO(name, role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<UserDTO> findByLikeName(String name, String role) throws Exception {
        UserDTO dto;
        List<UserDTO> list = null;
        String username, fullname, photo;
        boolean available;
        try{
            String sql = "Select tblUsers.Username, Name, Photo, Available From tblUsers JOIN tblRoles ON tblUsers.Username = tblRoles.Username "
              +  "Where Name LIKE ? and Role LIKE ? and tblUsers.Status = 'Active' and tblRoles.Status = 'Active'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setString(2, "%" + role + "%");
            rs = preStm.executeQuery();
            list = new ArrayList<>();
            while(rs.next()){
                username = rs.getString("Username");
                fullname = rs.getString("Name");
                photo = rs.getString("Photo");
                available = rs.getBoolean("Available");
                dto = new UserDTO(username, fullname, photo);
                dto.setAvailable(available);
                list.add(dto);
            }
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public List<UserDTO> findByLikeName(String name, String role, String username) throws Exception {
        UserDTO dto;
        List<UserDTO> list = null;
        String fullname, photo;
        try{
            String sql = "Select tblUsers.Username, Name, Photo From tblUsers JOIN tblRoles ON tblUsers.Username = tblRoles.Username "
              +  "Where Name LIKE ? and Role LIKE ? and tblUsers.Status = 'Active' and tblRoles.Status = 'Active' and tblUsers.Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setString(2, "%" + role + "%");
            preStm.setString(3, username);
            rs = preStm.executeQuery();
            list = new ArrayList<>();
            while(rs.next()){
                fullname = rs.getString("Name");
                photo = rs.getString("Photo");
                dto = new UserDTO(username, fullname, photo);
                list.add(dto);
            }
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public UserDTO findByPrimaryKey(String key) throws Exception {
        UserDTO dto = null;
        try{
            String sql = "Select tblUsers.Username, Name, Email, Phone, Photo, Role From tblUsers JOIN tblRoles ON tblUsers.Username = tblRoles.Username"
                    + " Where tblUsers.Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, key);
            rs = preStm.executeQuery();
            if(rs.next()){
                String username = rs.getString("Username");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String photo = rs.getString("Photo");
                String role = rs.getString("Role");
                dto = new UserDTO(username, "", name, email, phone, photo, role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean deActiveUser(String username) throws Exception {
        boolean check = false;
        try{
            String sql = "Update tblUsers Set Status = ? Where Username = ? "
                    + "Update tblRoles Set Status = ? Where Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "Inactive");
            preStm.setString(2, username);
            preStm.setString(3, "Inactive");
            preStm.setString(4, username);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insertUser(UserDTO dto) throws Exception{
        boolean check = false;
        String passwordInSHA256 = toSHA256(dto.getPassword());
        try{
            String sql = "Insert INTO tblUsers(Username, Password, Email, Phone, Photo, Name, Status, Available) Values(?,?,?,?,?,?,'Active',1) "
                    + "Insert INTO tblRoles(Username, Role, Status) Values(?,?,'Active')";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, passwordInSHA256);
            preStm.setString(3, dto.getEmail());
            preStm.setString(4, dto.getPhone());
            preStm.setString(5, dto.getPhoto());
            preStm.setString(6, dto.getName());
            preStm.setString(7, dto.getUsername());
            preStm.setString(8, dto.getRole());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updateUser(UserDTO dto) throws Exception {
        boolean check = false;
        String password = "";
        if(!dto.getPassword().equalsIgnoreCase("")){
            password = "Password = '" + toSHA256(dto.getPassword()) + "',";
        }
        try{
            String sql = "Update tblUsers Set " + password + " Name = ?, Email = ?, Phone = ?, Photo = ? Where Username = ? "
                    + "Update tblRoles Set Role = ? Where Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getName());
            preStm.setString(2, dto.getEmail());
            preStm.setString(3, dto.getPhone());
            preStm.setString(4, dto.getPhoto());
            preStm.setString(5, dto.getUsername());
            preStm.setString(6, dto.getRole());
            preStm.setString(7, dto.getUsername());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public static String toSHA256(String base) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            String hexString = "";
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    hexString += "0";
                }
                hexString += hex;
            }

            return hexString;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
