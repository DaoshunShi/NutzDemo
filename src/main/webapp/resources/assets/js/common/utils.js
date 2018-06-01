$.namespace = function() {
    var a=arguments, o=null, i, j, d;
    for (i=0; i<a.length; i=i+1) {
        d=a[i].split(".");
        o=window;
        for (j=0; j<d.length; j=j+1) {
            o[d[j]]=o[d[j]] || {};
            o=o[d[j]];
        }
    }
    return o;
};

$.namespace("Wssip.util");

/**
 * targetUrl:提交的action params:附加参数 method:POST 或者GET completeFunction：成功回调
 * failureFunction：失败回调 waitMsg:等待信息 timeout:超时设置 ms数
 */
Wssip.util.request = function(targetUrl, params, method, completeFunction,
		failureFunction, waitMsg, timeout) {
	if (!method) {
		method = "POST";
	}
	$.ajaxSetup({
		url : targetUrl,
		global : false,
		dataType:'json',
		traditional:true,
		type : method
	});
	
	if(!params){
		params={};
	}
	
	if(typeof(completeFunction) !='function'){
		completeFunction=function(){
			mini.alert("操作成功!");
		}
	}
	
	if(typeof(failureFunction) !='function'){
		failureFunction=function(){
			mini.alert("操作失败!");
		}
	}
	
	$.ajax({
		data:params,
		success: function (json) {
	    	if(json.success || json.success === undefined){
	    		if(json.result){
	    			completeFunction(json.result);
	    		} else {
	    			completeFunction(json);
	    		}
	    	}else{
	    		if(json.errors) {
	    			failureFunction(json.errors);
	    		} else {
	    			failureFunction(json);
	    		}
	    	}
	    },
	    error: function (json) {
	    	console.error(json);
	    	if(json.errors) {
    			failureFunction(json.errors);
    		} else {
    			failureFunction(json);
    		}
	    },
	    statusCode:{
	    	404: function() {
	    		alert( "404接口不存在。" );
	    	},
	    	500: function() {
	    		alert( "500中心程序错误。" );
	    	}
	    }
	});
}


Wssip.util.submit =function(url,params,completeFunction,failureFunction,waitMsg,timeout){
	Wssip.util.request(url,params,"POST",completeFunction,failureFunction,waitMsg,timeout);
}

$.namespace("Wssip.utils");
Wssip.utils.request=Wssip.util.request;