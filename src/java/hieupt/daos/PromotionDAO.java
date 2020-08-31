
package hieupt.daos;

import hieupt.conn.MyConnection;
import hieupt.dtos.PromotionHistoryDTO;
import hieupt.dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class PromotionDAO {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public PromotionDAO() {
    }
    
    private void closeConnection() throws Exception{
        if(rs != null)
            rs.close();
        if(preStm != null)
            preStm.close();
        if(conn != null)
            conn.close();
    }
    
    public int addNewPromotion(String creatorID, String creatorName) throws Exception {
        int promoID = 0;
        Timestamp time = new Timestamp(Calendar.getInstance().getTimeInMillis());
        try {
            String sql = "Insert into tblPromotions(CreatorID, CreatorName, DateCreated) values(?,?,?);SELECT SCOPE_IDENTITY() as PromoID;";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preStm.setString(1, creatorID);
            preStm.setString(2, creatorName);
            preStm.setTimestamp(3, time);
            preStm.executeUpdate();
            rs = preStm.getGeneratedKeys();
            if (rs.next()) {
                promoID = rs.getInt("PromoID");
            }
        } finally {
            closeConnection();
        }
        return promoID;
    }
    
    public boolean addNewPromotionDetail(int promoID, HashMap<String, UserDTO> list) throws Exception{
        boolean check = false;
        try{
            String sql = "Insert into tblPromotionDetails(Username, PromotionID, Name, Photo, Rank) Values(?,?,?,?,?)"
                    + " Update tblUsers Set Available = 0 Where Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            for (Map.Entry<String, UserDTO> dto : list.entrySet()) {
                preStm.setString(1, dto.getKey());
                preStm.setInt(2, promoID);
                preStm.setString(3, dto.getValue().getName());
                preStm.setString(4, dto.getValue().getPhoto());
                preStm.setDouble(5, dto.getValue().getRank());
                preStm.setString(6, dto.getKey());
                preStm.addBatch();
            }
            int[] result = preStm.executeBatch();
            check = result.length > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<PromotionHistoryDTO> getPromotionHistory(String name) throws Exception{
        List<PromotionHistoryDTO> result = null;
        PromotionHistoryDTO dto;
        int promoID;
        String creatorID, creatorName;
        Timestamp dateCreated;
        try {
            String sql = "Select PromotionID, CreatorID, CreatorName, DateCreated From tblPromotions Where CreatorName like ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while(rs.next()){
                promoID = rs.getInt("PromotionID");
                creatorID = rs.getString("CreatorID");
                creatorName = rs.getString("CreatorName");
                dateCreated = rs.getTimestamp("DateCreated");
                dto = new PromotionHistoryDTO(promoID, creatorID, creatorName, dateCreated);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
