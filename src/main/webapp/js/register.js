(function(){
	$('#register').click(function(){
		var standard_id = $('#standard_id').val();
	    var standard_name = $('#standard_name').val();
	    var designer = $('#designer').val();
	    var remark = $('#remark').val();
		var salaryList = "";
		var i;
		$("input[name='salary']").each(function(j,item){
			salaryList += item.value + ",";
			//alert(j);
		});
		//alert(salaryList); //输出input 中的 value 值到控制台
		location.href = "salary_standard/register.do?salaryList="+salaryList
		+"&"+"standard_id="+standard_id+"&"+"standard_name="+standard_name
		+"&"+"designer="+designer+"&"+"remark="+remark;
		submit();
	});
	
	
})();