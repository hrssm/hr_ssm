(function(){
	$('#register').click(function(){
		var standard_id = $('#standard_id').val();
	    var standard_name = $('#standard_name').val();
	    var designer = $('#designer').val();
	    var remark = $('#remark').val();
	    var register = $('#register').val();
		var salaryList = "";
		var itemIdList = "";
		var itemNameList = "";
		var i;
		$("input[name='salary']").each(function(j,item){
			salaryList += item.value + ",";
			//alert(j);
		});
		$("input[name='item_id']").each(function(j,item){
			itemIdList += item.value + ",";
			//alert(j);
		});
		$("input[name='item_name']").each(function(j,item){
			itemNameList += item.value + ",";
			//alert(j);
		});
		//alert(salaryList); //输出input 中的 value 值到控制台
		location.href = "salary_standard/register.do?salaryList="+salaryList+"&"+"itemIdList="+itemIdList+"&"+"itemNameList="+itemNameList
		+"&"+"standard_id="+standard_id+"&"+"standard_name="+standard_name+"&"+"register="+register
		+"&"+"designer="+designer+"&"+"remark="+remark;
		submit();
	});
	
	
})();