document.addEventListener('turbolinks:load', function(){
	document.getElementById('exchange_form').addEventList('ajax:success', function(event){
       let [result] = event.detail   // result é o json
       document.getElementById('result').value = result.value // o value retornado pelo controller
	})
})

//Inserir o resultado no form