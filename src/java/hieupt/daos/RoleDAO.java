
package hieupt.daos;

import hieupt.conn.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public RoleDAO() {
    }
    
    private void closeConnection() throws Exception{
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(conn != null)
            conn.close();
    }
    
    public List<String> getRoles() throws Exception{
        List<String> result = null;
        try{
            String sql = "Select Role From tblRoles Group by Role";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList();
            while(rs.next()){
                result.add(rs.getString("Role"));
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
