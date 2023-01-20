var EmailError=document.getElementById("email-error");
function validateEmail(){
	var email= document.getElementById('email').value;
	if(email.length ==0){
		EmailError.innerHTML="Email required"
		return false;
	}
	if(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
		EmailError.innerHTML="Email Invalid"
		return false;
	}
	
}