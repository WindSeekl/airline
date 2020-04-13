function tabSwitch(i, e, t, o) {
	var n = $(i);
	n.siblings("li").removeClass("active"), n.addClass("active");
	var a = n.parents("." + e).siblings("." + t).find("div[rel=" + o + "]"),
		r = "",
		c = "";
	"flight" == o ? (r = a.find("input[name=deptDt]"), c = a.find("input[name=deptDtRt]"), bindCalendar(r, c)) : "hotel" == o && (r = a.find("input[name=hotel_date]"), c = a.find("input[name=hotel_l_date]"), bindCalendar(r, c)), a.siblings().removeClass("active"), a.addClass("active")
}

function searchSwitch() {
	var i, e, t = $("body"),
		o = t.find("#switch_hover");
	o.find(".head").find("li:first").addClass("active"), o.find(".body").find(".b_content:first").show(), o.find(".head").find("li").live("mouseover", function() {
		e = $(this).parents("#switch_hover"), e.find(".head").find("li").removeClass("active"), $(this).addClass("active"), i = $(this).attr("rel"), e.find(".body .b_content").hide(), e.find(".body").find(".b_content#" + i).show()
	});
	var n = t.find("#switch_inside_hover");
	n.find(".s_head").find("li:first").addClass("active"), n.find(".s_body").find(".s_b_content:first").show(), n.find(".s_head").find("li").live("mouseover", function() {
		e = $(this).parents("#switch_inside_hover"), e.find(".s_head").find("li").removeClass("active"), $(this).addClass("active"), i = $(this).attr("rel"), e.find(".s_body .s_b_content").hide(), e.find(".s_body").find(".s_b_content#" + i).show()
	});
	var a = t.find("div.box#rt,div.row#rt");
	a.addClass("dis"), a.find(".input").attr("disabled", "disabled"), t.find("input.input_rc#f_ow").click(function() {
		a.addClass("dis"), a.find(".input").attr("disabled", "disabled")
	}), t.find("input.input_rc#f_rt").click(function() {
		a.removeClass("dis"), a.find(".input").attr("disabled", "")
	});
	var r = t.find("div.row#rt");
	r.addClass("dis"), r.find(".input").attr("disabled", "disabled"), $("select#flight_type").change(function() {
		var i = $(this).val();
		"2" == i ? (r.removeClass("dis"), r.find(".input").attr("disabled", "")) : "un" == i ? window.location.href = "flight_booking_select_od.html" : (r.addClass("dis"), r.find(".input").attr("disabled", "disabled"))
	})
}
var host = host || "http://easternmiles.ceair.com",
	config = $.extend(config || {}, {
		restoreFlightParamFlag: !0
	}),
	Resource = $.extend(Resource || {}, {
		indexIframeUrl: "http://easternmiles.ceair.com/member/auth!loginCheckHome.shtml"
	});
Public.filterHotIndex(),
	function() {
		var i = {
				cn: '<option value="http://www.ceair.com/">简体中文</option>',
				en: '<option value="http://en.ceair.com/">English</option>',
				tw: '<option value="http://tw.ceair.com/">繁体中文 </option>',
				hk1: '<option value="http://ck.ceair.com/">繁体中文</option>',
				hk2: '<option value="http://hk.ceair.com/">English</option>',
				jp: '<option value="http://jp.ceair.com/">日语</option>',
				kr: '<option value="http://kr.ceair.com/">한국어</option>',
				ca: '<option value="http://ca.ceair.com/">English</option>',
				au: '<option value="http://au.ceair.com/">English</option>',
				uk: '<option value="http://uk.ceair.com/">English</option>',
				us: '<option value="http://us.ceair.com/">English</option>',
				fr: '<option value="http://fr.ceair.com/">Français</option>',
				de: '<option value="http://de.ceair.com/">Deutsch</option>',
				it: '<option value="http://it.ceair.com/">Italiano</option>',
				ru: '<option value="http://ru.ceair.com/">Русский</option>',
				sg: '<option value="http://sg.ceair.com/">English</option>',
				ph: '<option value="http://ph.ceair.com/">English</option>'
			},
			e = {
				cn: ["cn", "en"],
				tw: ["tw"],
				hk1: ["hk1", "hk2"],
				jp: ["jp"],
				kr: ["kr"],
				ca: ["ca"],
				au: ["au"],
				uk: ["uk"],
				us: ["us"],
				fr: ["fr"],
				de: ["de"],
				it: ["it"],
				ru: ["ru"],
				sg: ["sg"],
				ph: ["ph"]
			};
		$("#header #language").find('select[name="country"]').live("change", function() {
			var t = $(this).attr("value"),
				o = $("#header #language").find('select[name="language"]'),
				n = o.attr("region");
			if (t == n) return !1;
			var a, r = "";
			for (a in e[t]) r += i[e[t][a]];
			o.html(r), o.attr("region", t)
		}), $("#header #language").find('input[name="confirm"]').live("click", function() {
			window.open($("#header #language").find('select[name="language"]').attr("value"))
		});
		var t = "<option value='cn'>中国</option><option value='tw'>中国台湾</option><option value='hk1'>中国香港</option><option value='jp'>にほん</option><option value='kr'>한국</option><option value='ca'>Canada</option><option value='uk'>United Kingdom</option><option value='us'>United States</option><option value='au'>Australia</option><option value='de'>Deutschland</option><option value='fr'>France</option><option value='it'>Italian</option><option value='ru'>Россия</option><option value='sg'>Singapore</option><option value='ph'>Philippines</option>",
			o = '<option selected="" value="http://www.ceair.com/"> 简体中文 </option><option value="http://en.ceair.com/"> English </option>',
			n = $("#header .dropdown .select[name='country']");
		n.length && ($("#header .dropdown .select[name='language']").html(o), n.html(t), n.attr("value", "cn"));
		var a = function() {
			var i, e = {
					language: !1,
					link: !1
				},
				t = document.getElementsByTagName("body")[0],
				o = !1;
			return function(n) {
				if (e[n]) return !1;
				i = $("#" + n), i.mouseover(function() {
					o = !0
				}), i.mouseleave(function() {
					o = !1
				}), i.find("a").click(function() {
					window.open($(this).attr("href"))
				}), e[n] = !0;
				var a = !0,
					r = document.getElementById(n);
				t.onclick = function() {
					return o ? !1 : (a && $("#header").find(".active").attr("class", "dropdown down"), a = !0, void 0)
				}, r.onclick = function() {
					a = !1
				}
			}
		}();
		$("#header .dropdown").live("click", function() {
			var i = $(this),
				e = i.attr("id");
			if (/active/.test(i.attr("class")) && "links" != e) return !1;
			a(e);
			var t = $("#header").find(".active");
			t.length && t.attr("class", "dropdown down"), i.attr("class", "dropdown active up")
		})
	}(),
	function() {
		var i = {
				menu_0: "menu_0",
				booking: "flight",
				flight: "flight",
				myceair: "myceair",
				order: "myceair",
				apply: "myceair",
				member: "myceair",
				talent: "myceair",
				coupon: "myceair",
				guide: "guide",
				guide2: "guide",
				aoc: "aoc",
				server: "server"
			},
			e = "menu_0",
			t = new RegExp("//"),
			o = location.href.replace(t, "");
		if (t = new RegExp("\\/[^/]+(?=\\/|\\.)"), !o.match(t)) return $("#function-area .menu ul").find("li[id='flight']").addClass("current"), !1;
		e = o.match(t)[0].replace("/", "");
		var n = i[e];
		$("#function-area .menu ul").find("li[id='" + n + "']").addClass("current")
	}(),
	function() {
		var i = function(i) {
				i && $("a").live("mouseover", function() {
					var i = this.href; - 1 == i.indexOf(".ceair.com") && -1 != i.indexOf("http") && $(this).attr("target", "_blank")
				})
			},
			e = function(i) {
				i && $('input[type="text"]:enabled:visible').live("focus", function() {
					$(this).select()
				})
			},
			o = function() {},
			n = function() {
				i(!0), e(!0), t(), o()
			};
		n()
	}(), $(function() {
		$.browser.msie && "6.0" == $.browser.version && !$.support.style && ($("body").prepend("<div id='ie6_tips' class='blue font14'>您的浏览器版本过低，推荐您升级您的浏览器，升级后可享受更好的体验。<input type='button' class='button-red' value='立即升级>' style='width:150px;' onclick=location.href='http://easternmiles.ceair.com/explore_update.html' /></div>"), $("#ie6_tips").slideDown("normal"))
	});
var newSearchCookie = function() {
	var i = $.cookie("newSearch") || "3";
	return "3" == i && (i = Math.ceil(10 * Math.random()) > 3 ? function() {
		return $.cookie("newSearch", "2", {
			domain: ".ceair.com",
			expires: 7,
			path: "/"
		}), "2"
	}() : function() {
		return $.cookie("newSearch", "1", {
			domain: ".ceair.com",
			expires: 1,
			path: "/"
		}), "1"
	}()), "2" == i ? "/flight2014/" : "/flight2014/"
};
window.adtchdNum = function(i, e) {
	return i > 3 ? (alert("机票预定旺季来临，为了保护您和所有用户的购票需求，一笔订单允许的乘机人数将有所限制（成人不超过3位），请您将乘机人分开预定，感谢您一直以来对东方航空的支持！"), !1) : e > 2 ? (alert("机票预定旺季来临，为了保护您和所有用户的购票需求，一笔订单允许的乘机人数将有所限制（儿童不超过2位），请您将乘机人分开预定，感谢您一直以来对东方航空的支持！"), !1) : i + e > 5 ? (alert("机票预定旺季来临，为了保护您和所有用户的购票需求，一笔订单允许的乘机人数将有所限制（成人不超过3位，儿童不超过2位），请您将乘机人分开预定，感谢您一直以来对东方航空的支持！"), !1) : !0
};
var Login = function() {
	function Login(config) {
		var asy = new AsyncLock(["user", "loginMode", "loginCheck"], [], function() {
			this.username = userInfo.username, this.mobileNo = userInfo.mobileNo, this.tier = userInfo.tier, this.serverTime = Time.server, this.localTime = Time.local, this.LoginCheck = LoginInfo.LoginCheck, this.LoginMode = LoginInfo.LoginMode
		}, this);
		this.asyn = asy, config = config || {}, this.local = config.local || "zh_CN";
		var userInfo = {},
			Time = {},
			LoginInfo = {};
		$.getLoginMode = function(i) {
			LoginInfo.LoginMode = i, asy.Unlock("loginMode")
		}, $.getUser = function(i) {
			userInfo = i, Time.server = i.time || Time.server, Time.local = new Date, asy.Unlock("user"), -1 == host.indexOf(location.host) && (LoginInfo.LoginCheck = "" != i.username, asy.Unlock("loginCheck"))
		};
		var init = function() {
			$.getScript(ActionURL.LoginMode), $.getScript(ActionURL.userInfo), -1 != host.indexOf(location.host) && $.ajax({
				url: ActionURL.LoginCheck,
				success: function(check) {
					LoginInfo.LoginCheck = eval(check), asy.Unlock("loginCheck")
				}
			})
		};
		return init()
	}
	var iFrame = '<iframe id="centerWindow" frameborder="0" style="z-index:1000;position:fixed;left:{{left}}px;top:{{top}}px;" height="{{height}}px" width="{{width}}px" src="{{src}}"></iframe>',
		divMask = '<div id="divMask" style="z-index:999;position:fixed;left:0;top:0;width:{{width}}px;height:{{height}}px;opacity:0.4;-moz-opacity:0.4;filter:alpha(opacity=40);background:#000;"></div>',
		LoginUrl = "https://passport.ceair.com/cesso/login2!check.shtml?redirectUrl={{redirectUrl}}&ltv={{LoginMode}}&local={{local}}",
		divClose = '<div id="popClose" style="left:{{left}}px;top:{{top}}px;z-index:1001;position:fixed; width:20px;height:20px;line-height:18px;text-align:center;font-weight:bold;cursor: pointer;font-size:14px;font-family:arial;display: block;">X</div>',
		host = host || "http://easternmiles.ceair.com";
	Login.callbackList = {};
	var makeMask = function() {
			var i = divMask.replace("{{width}}", $(window).width()).replace("{{height}}", $(window).height());
			$("body").append(i)
		},
		showCenterWindow = function(i, e, t) {
			var o = ($(window).width() - e) / 2,
				n = ($(window).height() - t) / 2,
				a = iFrame.replace("{{left}}", o.toString()).replace("{{top}}", n.toString()).replace("{{height}}", t).replace("{{width}}", e).replace("{{src}}", i);
			$("body").append(a)
		},
		appendClose = function() {
			var i = $(window).width() / 2 + 275,
				e = $(window).height() / 2 - 139,
				t = divClose.replace("{{left}}", i).replace("{{top}}", e);
			$("body").append(t), $("#popClose").click(function() {
				$("#centerWindow,#popClose,#divMask").remove()
			})
		};
	$(window).resize(function() {
		var i = $(window).width(),
			e = $(window).height(),
			t = $("#centerWindow").height(),
			o = $("#centerWindow").width();
		$("#centerWindow").css({
			top: (e - t) / 2 + "px",
			left: (i - o) / 2 + "px"
		}), $("#popClose").css({
			top: e / 2 - 139 + "px",
			left: i / 2 + 275 + "px"
		}), $("#divMask").width(i).height(e)
	});
	var showMask = function(i, e, t) {
			makeMask(), showCenterWindow(i, e, t), appendClose()
		},
		ActionURL = {
			userInfo: host + "/member/auth!getUserInfo.shtml?_=" + Math.random(),
			LoginMode: host + "/member/auth!getLoginMode.shtml?_=" + Math.random(),
			LoginCheck: host + "/member/auth!loginCheck.shtml?_=" + Math.random(),
			quitLogin: host + "/member/auth!logout.shtml?_=" + Math.random(),
			login_popup: "https://passport.ceair.com/cesso/login!check.shtml?site=1&isAlert=1&ltv={{LoginMode}}&redirectUrl={{redirectUrl}}&local={{local}}&&_toDo=top.Login.callbackList.{{callback}}()"
		};
	return Login.prototype.popupLogin = function(i) {
		this.asyn.run([i], function(i) {
			var e = this;
			if (this.LoginCheck) return "function" == typeof i ? i() : null;
			var t = "callback" + Math.ceil(1e3 * Math.random()),
				o = ActionURL.login_popup.replace("{{LoginMode}}", this.LoginMode).replace("{{redirectUrl}}", "http://" + location.host + "/LoginCallback.html?" + t).replace("{{local}}", this.local).replace("{{callback}}", t);
			Login.callbackList[t] = function() {
				$("#centerWindow,#popClose,#divMask").remove(), i.call(e)
			}, showMask(o, 610, 300)
		}, this)
	}, Login.prototype.quit = function(i) {
		$.getScript(ActionURL.quitLogin, i)
	}, Login.prototype.getUserName = function(i) {
		this.asyn.run([i], function(i) {
			i(this.username)
		}, this)
	}, Login.prototype.getMobileNo = function(i) {
		this.asyn.run([i], function(i) {
			i(this.mobileNo)
		}, this)
	}, Login.prototype.getTier = function(i) {
		this.asyn.run([i], function(i) {
			i(this.tier)
		}, this)
	}, Login.prototype.getLoginCheck = function(i) {
		this.asyn.run([i], function(i) {
			i(this.LoginCheck)
		}, this)
	}, Login.prototype.getServerTime = function(i) {
		this.asyn.run([i], function(i) {
			var e = new Date,
				t = e - this.localTime;
			i(new Date(this.serverTime.valueOf() + t))
		}, this)
	}, Login.prototype.getLoginURL = function(i) {
		this.asyn.run([i], function(i) {
			i(LoginUrl.replace("{{redirectUrl}}", location.href).replace("{{LoginMode}}", this.LoginMode).replace("{{local}}", this.local))
		}, this)
	}, Login
}();
! function() {
	function i() {
		e.getLoginURL(function(i) {
			$("a#login").attr("href", i)
		});
		var i = function() {
			e.quit(function() {
				$.cookie("JSESSIONID", null, {
					path: "/"
				}), $.cookie("com.ceair.cesso.portal", null, {
					path: "/",
					domain: ".ceair.com"
				}), window.location.href = "http://www.ceair.com"
			})
		};
		e.getLoginCheck(function(t) {
			t && e.getUserName(function(e) {
				var t = '你好，<a href="http://easternmiles.ceair.com/member/my-ceair!init.shtml">[username]</a> | <a href="javascript:void(0)" id="m_quit">退出</a>',
					o = t.replace("[username]", e);
				$(top.document).find("#login").parent().empty().append(o), $("#m_quit").live("click", i)
			})
		})
	}
	if ($("a#login").size() > 0) {
		var e = new Login;
		i(), window.writeTopName = function() {
			e = new Login, i()
		}
	}
}(),
function() {
	var i = i || "http://easternmiles.ceair.com",
		e = window._cemvc || [];
	"[object Object]" != Object.prototype.toString.call(e) && $.getScript(i + "/resource3/js/public/mvc/j.cemvc.js")
}(),
function() {
	var i = function(i) {
		var e = document.createElement("script");
		e.async = !0, e.type = "text/javascript", e.src = i, document.getElementsByTagName("body")[0].appendChild(e)
	};
	$("[id*=filter-]").length > 0 && i("http://easternmiles.ceair.com/resource3/js/siteserver/advertiseData.js")
}();