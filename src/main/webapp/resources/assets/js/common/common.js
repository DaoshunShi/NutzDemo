// 查询数据
function query() {
	$('#pageNum').val('1');
	$('#pageForm').submit();
}

// 编辑数据
function edit(name, value) {
	$('#pageForm').attr("action", "edit");
	$('#' + name).val(value);
	$('#pageForm').submit();
}

// 新增数据
function add() {
	$('#pageForm').attr("action", "edit");
	$('#pageForm').submit();
}

// 删除数据
function del(name, value, tipname, tipvalue, title) {
	var confmsg = "确定要删除";
	if (tipname && tipvalue) {
		confmsg += (tipname + "【" + tipvalue + "】");
	}
	confmsg += "？";

	if (!title) {
		title = "提示";
	}
	layer.confirm(confmsg, {
		btn : [ '确定', '取消' ],
		icon : 7,
		title : title
	}, function() {
		$('#pageForm').attr("action", "del");
		$('#' + name).val(value);
		$('#pageForm').submit();
	}, function() {
	});
}