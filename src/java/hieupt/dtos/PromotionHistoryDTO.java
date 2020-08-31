
package hieupt.dtos;

import java.sql.Timestamp;

public class PromotionHistoryDTO {
    private int promoID;
    private String creatorID, creatorName;
    private Timestamp assignmentDate;

    public PromotionHistoryDTO() {
    }

    public PromotionHistoryDTO(int promoID, String creatorID, String creatorName, Timestamp assignmentDate) {
        this.promoID = promoID;
        this.creatorID = creatorID;
        this.creatorName = creatorName;
        this.assignmentDate = assignmentDate;
    }
    
    

    public int getPromoID() {
        return promoID;
    }

    public void setPromoID(int promoID) {
        this.promoID = promoID;
    }

    public String getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(String creatorID) {
        this.creatorID = creatorID;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public Timestamp getAssignmentDate() {
        return assignmentDate;
    }

    public void setAssignmentDate(Timestamp assignmentDate) {
        this.assignmentDate = assignmentDate;
    }
    
    
}
