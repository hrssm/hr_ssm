(function(){
	$('#register').click(function(){
		var obj = document.getElementsByName("bike");
		var table = $('#table').val();
		var s = "";
		var i = 0;
		for ( i in obj) {
			if (obj[i].checked) {
				s += obj[i].value+",";
			}
		}
		location.href = "keyword/table.do?s="+s+"&"+"table="+table;
		submit();
	});
	
	
})();