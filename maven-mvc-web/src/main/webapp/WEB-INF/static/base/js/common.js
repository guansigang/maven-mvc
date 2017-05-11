
/**一些插件的全局配置-start-*/
var CURRENT_PAGE=1;/**当前所在页数*/
var PAGE_SIZE=4;/***每月显示条目/
$.extend( $.fn.dataTable.defaults,{//初始化datatables全局配置
    searching : true,//默认打开搜索功能
    ordering : false,//默认关闭排序功能
    bSort : false,//是否排序 false / true(default)
    paging: false,//默认不适用分页
    bInfo:false//默认不展示记录信息（总共多少条，当前是第多少页等）
} );

/**一些公共的变量-start-*/
/**
 * 生成服务入参，对于特殊符号做了处理
 * @param parameters
 * @param pageNumber
 * @param pageSize
 * @returns {___anonymous482_667}
 */
function createPageResult(parameters,pageNumber,pageSize){
	var pageResult = {
		"pageNow":pageNumber,
		"pageSize":pageSize,
		"totalRecord":0 ,
		"totalPage" : 0,
		"startDate" : "",
		"endDate" : "",
		"resultList" : [],
		"parameters" : parameters
	};
	return pageResult;
}

function setIframeHeight(iframe) {
	if (iframe) {
		/* var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		if (iframeWin.document.body) {
			iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
		} */
		
		var bHeight = iframe.contentWindow.document.body.scrollHeight;  
	    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;  
	    var height = Math.max(bHeight, dHeight); 
		iframe.height = height; 
		
//    		 iframe.height=document.documentElement.clientHeight;
	}
};

/**
 * table属性为空会有弹出框提示，此方法重写js弹出框，解决之
 */
window.alert = function(str){ return ; }