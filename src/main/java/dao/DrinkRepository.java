package dao;

import java.util.ArrayList;
import dto.Drink;


public class DrinkRepository{
	
	
	private ArrayList<Drink> listOfDrinks = new ArrayList<Drink>();
	
	private static DrinkRepository instance = new DrinkRepository();

	public static DrinkRepository getInstance(){
		return instance;
	} 
	
	
	public DrinkRepository() {
	
		Drink drink1= new Drink("SOJU0001","차미슬 fresh", 1600);
		drink1.setABV("16.0");
		drink1.setDrinkInfo("대나무 숯으로 5번 걸러 더욱 깨끗해졌으며, 트렌디하고 깔끔한 서체 적용과 대나무 심볼 이미지를 강화했다.");
		drink1.setDrinkVolume("360mL");
		drink1.setDrinkCategory("소주");
		drink1.setDrinkStock(94172);	
		drink1.setDrinkPRO("2024-05-20");
		drink1.setFilename("SOJU0001.png");
		
		Drink drink2= new Drink("BEER0001","TRRA", 3000);
		drink2.setABV("4.6");
		drink2.setDrinkInfo("세계 공기질 부문 1위 호주에서 자란 청정맥아와 오직 발효공정에서 나오는 리얼탄산을 100% 사용하여 거품은 조밀하고 탄산은 오래 지속됩니다.");
		drink2.setDrinkVolume("500mL");
		drink2.setDrinkCategory("맥주");
		drink2.setDrinkStock(88745);	
		drink2.setDrinkPRO("2024-05-20");
		drink2.setFilename("BEER0001.png");
		
		Drink drink3= new Drink("VDKA0001","릴러티브 보드카", 30000);
		drink3.setABV("40.0");
		drink3.setDrinkInfo("염가에 판매되는 저가형 보드카보다 향이 무향에 가까우며 뒷맛이 연해서 스트레이트로 즐기기도 좋은 편이다. 술집의 경우, 토닉워터와 함께 얼음을 섞어 하이볼 형식으로 파는 곳이 많다.");
		drink3.setDrinkVolume("700mL");
		drink3.setDrinkCategory("보드카");
		drink3.setDrinkStock(94172);	
		drink3.setDrinkPRO("2024-05-20");
		drink3.setFilename("VDKA0001.png");
		
		listOfDrinks.add(drink1);
		listOfDrinks.add(drink2);
		listOfDrinks.add(drink3);
		
		
	}
	public ArrayList<Drink> getAlldrinks() {
		return listOfDrinks;
	}
	public Drink getDrinkById(String drinkId) {
		Drink drinkById = null;

		for (int i = 0; i < listOfDrinks.size(); i++) {
			Drink drink = listOfDrinks.get(i);
			if (drink != null && drink.getDrinkId() != null && drink.getDrinkId().equals(drinkId)) {
				
				drinkById = drink;
				break;
			}
		}
		return drinkById;
	}
	
	public void addDrink(Drink drink) {
		listOfDrinks.add(drink);
	}

}
