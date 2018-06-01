/**
 * jquery photoSwipe
 * Created by wuxp on 2017/4/13.
 */
(function($) {

	/**
	 * @param options    配置
	 * 
	 * 常用配置
	 *  
	 *  
	 * 
	 * @callBack         画廊渲染成功回调函数
	 * @param holdState  在图片预览状态下刷新页面是否保持展开状态
	 * @param hasUseDefTem  是否使用默认的html结构
	 */
	$.fn.photoSwipe = function(options, callBack, holdState, hasUseDefTem) {
		//var photoSwipes=[];
		if (hasUseDefTem !== false) {
			buildContainer();
		}
		var $galleryElements = $(this);
		$galleryElements.each(function(index) {
			var $gallery = $(this);
			$gallery.data('pswp-uid', index);
			//点击图片打开photoSwipe
			$gallery.find("[data-photo]").click(
					function(event, data) {
						event = event || window.event;
						event.preventDefault ? event.preventDefault() : event.returnValue = false;
						var $self = $(this);
						openPhotoSwipe(callBack, $self.index(), $gallery,options);
						return false;
					});
		});
		//在打开图片预览的情况下刷新页面，则默认打开
		var hashData = photoSwipeParseHash(); //计算打开的画廊位置和图片位置
		if (holdState === false) {
			return;
		}
		if (hashData.pid !== undefined && hashData.gid !== undefined) {
			//如果url中有pid和gid则打开该图片的预览
			openPhotoSwipe(callBack, hashData.pid, $galleryElements.eq(hashData.gid),options, true, true);
		}
		//  return photoSwipes;
	}

	/**
	 * 解析图片索引和URL库指数（# PID = 1和GID = 2）
	 * @returns {{}}
	 */
	var photoSwipeParseHash = function() {
		var hash = window.location.hash.substring(1), params = {};

		if (hash.length < 5) {
			return params;
		}

		var vars = hash.split('&');
		for (var i = 0; i < vars.length; i++) {
			if (!vars[i]) {
				continue;
			}
			var pair = vars[i].split('=');
			if (pair.length < 2) {
				continue;
			}
			params[pair[0]] = pair[1];
		}

		if (params.gid) {
			params.gid = parseInt(params.gid, 10);
		}

		return params;
	};

	/**
	 * 打开photoSwipe
	 * @param callBack          画廊渲染成功回调函数
	 * @param index             点击元素在当前画廊的序号
	 * @param $gallery          画廊容器元素
	 * @param disableAnimation  不启用动画
	 * @param fromURL
	 */
	var openPhotoSwipe = function(callBack, index, $gallery, opts, disableAnimation, fromURL) {
		var pswpElement = document.querySelectorAll('.pswp')[0], gallery, options, items;

		items = parseThumbnailElements($gallery);

		// define options (if needed)
		options = {
			// define gallery index (for URL)
			galleryUID : $gallery.data('pswp-uid'),
			getThumbBoundsFn : function(index) {
				// See Options -> getThumbBoundsFn section of documentation for more info
				var $container = items[index].el;
				var thumbnail = $container.find('img').eq(0), // find thumbnail
				pageYScroll = window.pageYOffset || document.documentElement.scrollTop, 
				rect = thumbnail[0].getBoundingClientRect();

				return {
					x : rect.left,
					y : rect.top + pageYScroll,
					w : rect.width
				};
			}

		};
		$.extend(options, opts);

		// PhotoSwipe opened from URL
		if (fromURL) {
			if (options.galleryPIDs) {
				// parse real index when custom PIDs are used
				// http://photoswipe.com/documentation/faq.html#custom-pid-in-url
				for (var j = 0; j < items.length; j++) {
					if (items[j].pid == index) {
						options.index = j;
						break;
					}
				}
			} else {
				// in URL indexes start from 1
				options.index = parseInt(index, 10) - 1;
			}
		} else {
			options.index = parseInt(index, 10);
		}

		// exit if index not found
		if (isNaN(options.index)) {
			return;
		}

		if (disableAnimation) {
			options.showAnimationDuration = 0;
		}

		// Pass data to PhotoSwipe and initialize it
		gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
		gallery.init();
		if ($.isFunction(callBack)) {
			callBack(gallery);
		}
	};

	/**
	 * 获取items配置
	 * @param $gallery 容器元素
	 * @returns {Array}
	 */
	var parseThumbnailElements = function($gallery) {
		var items = []; //图片items
		$gallery.find("[data-photo]").each(
				function() {
					var $self = $(this);
					var $img = $self.find("img");
					var bigSrc = $img.data("big"); //大图url
					var mSrc = $img.prop("src"); //小图url
					var title = $self.data("title"); //标题
					if (bigSrc === undefined || bigSrc.length === 0) {
						//如果未配置大图url则使用原图
						bigSrc = mSrc;
					}
					var sizes;
					var sizeStrings = $self.data("size");
					if (sizeStrings != undefined && sizeStrings.length > 0 && sizeStrings.indexOf("x") > 0) {
						sizes = sizeStrings.split("x"); //宽高
					} else {
						sizes = [];
						var imageWidth = $img.width();
						var imageHeight = $img.height();
						sizes[0] = $(window).width(); //默认宽等于全屏
						sizes[1] = imageHeight/imageWidth * sizes[0];  // 计算高
					}
					items[items.length] = {
						src : bigSrc,
						msrc : mSrc,
						w : parseInt(sizes[0], 10),
						h : parseInt(sizes[1], 10),
						title : title,
						el : $self
					}
				});
		return items;
	};

	var buildContainer = function() {
		if ($("div.pswp[data-photoswipe='1']").length > 0) {
			return;
		}
		var html = '<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true"><div class="pswp__bg"></div><div class="pswp__scroll-wrap"><div class="pswp__container"><div class="pswp__item"></div><div class="pswp__item"></div><div class="pswp__item"></div></div><div class="pswp__ui pswp__ui--hidden"><div class="pswp__top-bar"><div class="pswp__counter"></div><button class="pswp__button pswp__button--close" title="Close (Esc)"></button><button class="pswp__button pswp__button--share" title="Share"></button><button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button><button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button><div class="pswp__preloader"><div class="pswp__preloader__icn"><div class="pswp__preloader__cut"><div class="pswp__preloader__donut"></div></div></div></div></div><div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap"><div class="pswp__share-tooltip"></div></div><button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button><button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button><div class="pswp__caption"><div class="pswp__caption__center"></div></div></div></div></div>';
		$("body").append($(html));
	}
})(jQuery);