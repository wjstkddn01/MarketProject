function CheckAddBook() {

	var drinkId = document.getElementById("drinkId");
	var drinkName = document.getElementById("drinkName");
	var drinkPrice = document.getElementById("drinkPrice");
	var drinkStock = document.getElementById("drinkStock");
	var drinkInfo = document.getElementById("drinkInfo");

	
	
	// 주류아아디 체크
	if (!check(/^[A-Z]{4}[0-9]{4,11}$/, drinkId,
			"[주류 코드]\n영어와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 ISBN로 시작하세요"))
		return false;
		
	// 주류명 체크	
	if (drinkName.value.length < 4 || drinkName.value.length > 12) {
		alert("[주류명]\n최소 4자에서 최대 50자까지 입력하세요");
		//drinkName.select();
		drinkName.focus();
		return false;
	}
	// 주류 가격 체크
	if (drinkPrice.value.length == 0 || isNaN(drinkPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		//drinkPrice.select();
		drinkPrice.focus();
		return false;
	}

	if (drinkPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		//drinkPrice.select();
		drinkPrice.focus();
		return false;
	} 

	// 재고 수 체크
	if (isNaN(drinkStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		//drinkStock.select();
		drinkStock.focus();
		return false;
	}
	
	if (drinkInfo.value.length < 40) {
		alert("[상세설명]\n최소 60자이상 입력하세요");
		//drinkInfo.select();
		drinkInfo.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		//e.select();
		e.focus();
		return false;
	}

	 document.newDrink.submit()
}
