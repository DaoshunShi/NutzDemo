/**
 * Created by Liusx on 2017-09-15.
 */

"use strict";
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } else {
        factory(jQuery);
    }
}

(function ($) {
    var cropbox = function(options, el){
        var el = el || $(options.imageBox),
            obj =
            {
                state : {},
                ratio : 1,
                options : options,
                imageBox : el,
                thumbBox : el.find(options.thumbBox),
                image : new Image(),
                scale:1,
                tempscale:0,
                getDataURL: function ()
                {
                    var width = this.thumbBox.width(),
                        height = this.thumbBox.height(),
                        canvas = document.createElement("canvas"),
                        dim = el.css('background-position').split(' '),
                        size = el.css('background-size').split(' '),
                        dx = parseInt(dim[0]) - el.width()/2 + width/2,
                        dy = parseInt(dim[1]) - el.height()/2 + height/2,
                        dw = parseInt(size[0]),
                        dh = parseInt(size[1]),
                        sh = parseInt(this.image.height),
                        sw = parseInt(this.image.width);

                    canvas.width = width;
                    canvas.height = height;
                    var context = canvas.getContext("2d");
                    context.fillStyle = "#fff";
                    context.fillRect(0,0,canvas.width,canvas.height);
                    context.drawImage(this.image, 0, 0, sw, sh, dx, dy, dw, dh);
                    var imageData = canvas.toDataURL('image/jpeg');
                    return imageData;
                },
                getBlob: function()
                {
                    var imageData = this.getDataURL();
                    var b64 = imageData.replace('data:image/jpeg;base64,','');
                    var binary = atob(b64);
                    var array = [];
                    for (var i = 0; i < binary.length; i++) {
                        array.push(binary.charCodeAt(i));
                    }
                    return  new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
                }
            },  setBackground = function()
            {
                var w =  parseInt(obj.image.width)*obj.ratio;
                var h =  parseInt(obj.image.height)*obj.ratio;

                var pw = (el.width() - w) / 2;
                var ph = (el.height() - h) / 2;

                el.css({
                    'background-image': 'url(' + obj.image.src + ')',
                    'background-size': w +'px ' + h + 'px',
                    'background-position': pw + 'px ' + ph + 'px',
                    'background-repeat': 'no-repeat'});
            };

            // 此块也可以可以独立出来
            // 使用hammer.min.js对触摸滑动、缩放事件进行监听
            // 先要对监听的DOM进行一些初始化
            var mc = new Hammer(el[0]);
            var pan = new Hammer.Pan();
            var pinch = new Hammer.Pinch();
            mc.add([pan, pinch]);
            
            // 缩放
            mc.on("pinchstart", function (ev) {
                obj.tempscale = ev.scale;
            });
            mc.on("pinchmove", function (ev) {
                obj.scale = ev.scale - obj.tempscale + obj.scale;
                obj.tempscale = ev.scale;
                obj.ratio = obj.scale;
                setBackground();
            });
            
            // 移动
            mc.on("panstart", function (ev) {
                obj.state.dragable = true;
                obj.state.mouseX = ev.center.x;
                obj.state.mouseY = ev.center.y;
            });
            
            mc.on("panend", function (ev) {
                obj.state.dragable = false;
            });

            mc.on("panmove", function (ev) {
                if (obj.state.dragable)
                {
                    var x = ev.center.x - obj.state.mouseX;
                    var y = ev.center.y - obj.state.mouseY;

                    var bg = el.css('background-position').split(' ');

                    var bgX = x + parseInt(bg[0]);
                    var bgY = y + parseInt(bg[1]);

                    el.css('background-position', bgX +'px ' + bgY + 'px');

                    obj.state.mouseX = ev.center.x;
                    obj.state.mouseY = ev.center.y;
                }

            });
            
        obj.image.onload = function() {
            setBackground();
        };
        obj.image.src = options.imgSrc;

        return obj;
    };

    jQuery.fn.cropbox = function(options){
        return new cropbox(options, this);
    };
}));