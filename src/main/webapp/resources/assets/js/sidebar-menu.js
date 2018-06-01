(function($) {
	$.fn.sidebarMenu = function(options) {
		options = $.extend({}, $.fn.sidebarMenu.defaults, options || {});		
		var target = $(this);
		target.addClass('nav');
		target.addClass('nav-list');
		if (options.data) {
			init(target, options.data);
		} else {
			if (!options.url)
				return;
			//important: get json from url
			$.getJSON(options.url, options.param, function(data) {
				init(target, data);
			});
		}
		var url = window.location.pathname;
		//menu = target.find("[href='" + url + "']");
		//menu.parent().addClass('active');
		//menu.parent().parentsUntil('.nav-list', 'li').addClass('active').addClass('close');
				
		function init(target, data) {
			$.each(data, function(i, item) {
				var li = $('<li id=\'menu_li_' + item.nodeId + '\'></li>');
				var a = $('<a></a>');
				var icon = $('<i></i>');
				//icon.addClass('glyphicon');
				icon.addClass(item.nodeIcon);
				var text = $('<span></span>');
				text.addClass('menu-text').text(item.nodeDesc);
				a.append(icon);
				a.append(text);
				if (item.children && item.children.length > 0) {
					a.attr('href', '#');
					a.addClass('dropdown-toggle');
					var arrow = $('<b></b>');
					arrow.addClass('arrow').addClass('icon-angle-down');
					a.append(arrow);
					li.append(a);
					var menus = $('<ul></ul>');
					menus.addClass('submenu');
					
					init(menus, item.children);//recursive
					li.append(menus);
				} else {
					if (item.nodeClose == undefined)
						item.nodeClose = true;
					
					//===2017-09-26 weedlu===
					//auto open main page, property 'close' is FALSE
					if (item.nodeClose == false)
						addTabs({id:item.nodeId,title:item.nodeDesc,close:item.nodeClose,url:item.nodeURL});
					
					var href = 'javascript:addTabs({id:\'' + item.nodeId
							+ '\',title: \'' + item.nodeDesc + '\',close: '
							+ item.nodeClose + ',url: \'' + item.nodeURL + '\'});';
					a.attr('href', href);
					li.append(a);
				}
				target.append(li);
			});
		}
	}

	$.fn.sidebarMenu.defaults = {
		url : null,
		param : null,
		data : null
	};
})(jQuery);