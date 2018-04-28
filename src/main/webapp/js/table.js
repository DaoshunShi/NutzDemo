
var bstpTable = $('.table');

function tableInit(searchArgs) {

    var resRows;   //  记录返回结果

    // bstpTable.destroy();
    bstpTable.bootstrapTable('destroy');
    // bootstrapTable('destroy');
    //---初始化表格,动态从服务器加载数据---
    bstpTable.bootstrapTable({
        //【发出请求的基础信息】
        url: 'query',
        method: 'post',
        datatype: "json",
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        sidePagination: "server",

        //【查询设置】
        /* queryParamsType的默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                          设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber */
        queryParamsType:'',
        queryParams: function queryParams(params) {
            param = {
                pageNumber: params.pageNumber,
                pageSize: params.pageSize
            };
            for(var key in searchArgs){
                param[key]=searchArgs[key]
            }
            return param;
        },
        responseHandler: function (res) {   //在ajax请求成功后，发放数据前客队返回的数据进行处理，返回什么部分的数据
            //远程数据加载之前,处理程序响应数据格式,对象包含的参数: 我们可以对返回的数据格式进行处理
            //在ajax后我们可以在这里进行一些事件的处理
            var result = {};
            result['rows'] = res['list'];
            result['total'] = res['pager'].recordCount;
            result['pager'] = res['pager'];
            console.log(result);
            resRows = result;   //  将结果传给resRows记录
            return result;
        },

        //【其它设置】
        locale:'zh-CN',//中文支持
        pagination: true,//是否开启分页（*）
        // pageNumber: (resRows == null)? 1 :  resRows['pager'].pageNumber,//初始化加载第一页，默认第一页
        // pageSize: (resRows == null)? 3: resRows['paper'].pageSize,//每页的记录行数（*）
        pageNumber: 1,//初始化加载第一页，默认第一页
        pageSize: 3,//每页的记录行数（*）
        pageList: [2,3,4],//可供选择的每页的行数（*）
        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
        showRefresh:true,//刷新按钮


        //【样式设置】 
        height: 300,//table的高度
        //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
        rowStyle: function (row, index) {
            var style = "";
            if (row.name=="小红") {style='success';}
            return { classes: style }
        },

        //【设置列】
        columns: [
            {field: 'id',title: 'ID'},
            {field: 'name',title: '姓名'},
            {field: 'createTime',title: '创建时间'},
            {field: 'updateTime',title: '更新时间'},
            {field: 'tool',title: '操作', align: 'center',
                formatter:function(value,row,index){
                    var element =
                        "<a class='edit' data-id='"+row.id +"'>编辑</a> "+
                        "<a class='delet' data-id='"+row.id +"'>删除</a> ";
                    return element;
                }
            }
        ],
        onLoadSuccess:function(data){
            //通过对data判断
            // if("rate" in data["rows"][0]){
            //     var result = data["rows"];
            //     $.each(result,function(index,content){
            //         content["rate"] =content["rate"]+"%";ze5year"] =content["authorize5year"]+"%";
            //     })
            //     $("#"+tableId).bootstrapTable("load",data)
            // }
            console.log(data);
            alert("渲染成功");
        }
    })
}

$(".search").click(function(){
    var searchArgs={
        // name:$("input[name='name']").val(),
        // id:$("input[name='id']").val(),
        // comment:$("input[name='comment']").val()
        name:$("input[name='name']").val()
    }
    tableInit(searchArgs)

})



tableInit({});