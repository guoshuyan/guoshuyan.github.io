function browerInfo(openMode){
	if (openMode == ""){
		console.log("_blank - URL加载到一个新的窗口。这是默认");
		console.log("_parent - URL加载到父框架");
		console.log("_self - URL替换当前页面");
		console.log("_top - URL替换任何可加载的框架集");
	}
	else if (openMode != "_blank" && openMode != "_parent" && openMode != "_self" && openMode != "_top"){
		console.log("方法错误！");
		console.log("_blank - URL加载到一个新的窗口。这是默认");
		console.log("_parent - URL加载到父框架");
		console.log("_self - URL替换当前页面");
		console.log("_top - URL替换任何可加载的框架集");
	}
	else{
		window.open("https:/guoshuyan.github.io/brower_info.html", openMode)
	}
}
