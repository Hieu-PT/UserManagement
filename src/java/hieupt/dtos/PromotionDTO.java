
package hieupt.dtos;

import java.util.HashMap;

public class PromotionDTO {
    private String creator;
    private HashMap<String, UserDTO> promotionList;

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    
    
    public HashMap<String, UserDTO> getPromotionList() {
        return promotionList;
    }

    public PromotionDTO(String creator) {
        //
        this.creator = creator;
        this.promotionList = new HashMap<>();
    }
    
    public void addToPromotion(UserDTO dto) throws Exception{
        this.promotionList.put(dto.getUsername(), dto);
    }
    
    public boolean delete(String username) throws Exception {
        if(this.promotionList.containsKey(username)) {
            this.promotionList.remove(username);
            return true;
        }
        return false;
    }
    
    public boolean update(String username, double rank) throws Exception {
        if(this.promotionList.containsKey(username)) {
            this.promotionList.get(username).setRank(rank);
            return true;
        }
        return false;
    }
    
    public void clearPromotion() throws Exception{
        promotionList.clear();
    }
}
