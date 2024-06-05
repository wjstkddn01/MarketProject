package dto;

import java.io.Serializable;

public class Drink implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String drinkId; 		    //한잔해 페이지 술 코드
	private String drinkName;			//술 이름
	private int  drinkPrice; 	        //술 가격
	private String ABV;			        //술 도수
	private String drinkInfo; 	        //술 정보
	private String drinkVolume;	            //술 용량
	private String drinkCategory; 		//술 분류
	private long   drinkStock; 	        //술 재고개수
	private String drinkPRO;            //생산일(월/년)
	private String drinkAged; 		    //몇년산 정보
	private String filename;            //이미지
	private int drinkQuantity;          //장바구니에 담은 개수
	
	
	public Drink() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Drink(String drinkId, String drinkName, int drinkPrice) {
		super();
		this.drinkId = drinkId;
		this.drinkName = drinkName;
		this.drinkPrice = drinkPrice;
	}


	public String getDrinkId() {
		return drinkId;
	}


	public void setDrinkId(String drinkId) {
		this.drinkId = drinkId;
	}


	public String getDrinkName() {
		return drinkName;
	}


	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}


	public int getDrinkPrice() {
		return drinkPrice;
	}


	public void setDrinkPrice(int drinkPrice) {
		this.drinkPrice = drinkPrice;
	}


	public String getABV() {
		return ABV;
	}


	public void setABV(String ABV) {
		this.ABV = ABV;
	}


	public String getDrinkInfo() {
		return drinkInfo;
	}


	public void setDrinkInfo(String drinkInfo) {
		this.drinkInfo = drinkInfo;
	}


	public String getDrinkVolume() {
		return drinkVolume;
	}


	public void setDrinkVolume(String drinkVolume) {
		this.drinkVolume = drinkVolume;
	}


	public String getDrinkCategory() {
		return drinkCategory;
	}


	public void setDrinkCategory(String drinkCategory) {
		this.drinkCategory = drinkCategory;
	}


	public long getDrinkStock() {
		return drinkStock;
	}


	public void setDrinkStock(long drinkStock) {
		this.drinkStock = drinkStock;
	}


	public String getDrinkPRO() {
		return drinkPRO;
	}


	public void setDrinkPRO(String drinkPRO) {
		this.drinkPRO = drinkPRO;
	}


	public String getDrinkAged() {
		return drinkAged;
	}


	public void setDrinkAged(String drinkAged) {
		this.drinkAged = drinkAged;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getDrinkQuantity() {
		return drinkQuantity;
	}


	public void setDrinkQuantity(int drinkQuantity) {
		this.drinkQuantity = drinkQuantity;
	}
	

}