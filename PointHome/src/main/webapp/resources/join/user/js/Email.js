/**
 *  이메일과 주소를 합쳐주는 JS
 */
 $( () => {
	//이메일주소 가져오기
	$("#Email").blur(function(){
	   email();
	});
	
	$("#userEmailSelect").change(function(){
	   email();
	});

})

function email() {

	let email = $("#Email").val();
	let address =  $("#userEmailSelect").val();
	
	if (address == '직접입력') {
		address = '';	
	}
	
	if(address != '' && email.includes('@')) {
		var res = email.indexOf("@")
		console.log("res : " + res)
		
		const new_email = email.substring(0, res);
		console.log("new_email : " + new_email)
		
		$("#userEmail").val(new_email + address);
		$("#Email").val(new_email);		
		
	}else{
		$("#userEmail").val(email + address);
	}
};