function formatDate(time,cFormat) {
  if (arguments.length === 0) {
      return null
  }
  if(!time){
      return '';
  }

  let fmt = cFormat || 'yyyy-MM-dd HH:mm:ss';

  let date;
  if (typeof time === 'object') {
      date = time;
  } else if(typeof time === 'string'){
      date = new Date(time);
  }else{
      date = new Date(parseInt(time));
  }

  var o = {
      "M+" : date.getMonth()+1, //月份
      "d+" : date.getDate(), //日
      "h+" : date.getHours()%12 == 0 ? 12 : date.getHours()%12, //小时
      "H+" : date.getHours(), //小时
      "m+" : date.getMinutes(), //分
      "s+" : date.getSeconds(), //秒
      "q+" : Math.floor(( date.getMonth()+3)/3), //季度
      "S" : date.getMilliseconds() //毫秒
  };
  var week = {
      "0" : "\u65e5",
      "1" : "\u4e00",
      "2" : "\u4e8c",
      "3" : "\u4e09",
      "4" : "\u56db",
      "5" : "\u4e94",
      "6" : "\u516d"
  };
  if(/(y+)/.test(fmt)){
      fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"" ).substr(4 - RegExp.$1.length));
  }
  if(/(E+)/.test(fmt)){
      fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "\u661f\u671f" : "\u5468" ) : "")+week[date .getDay()+"" ]);
  }
  for(var k in o){
      if(new RegExp( "("+ k + ")").test(fmt)){
          fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00" + o[k]).substr((""+ o[k]).length)));
      }
  }
  return fmt;
}

/**
* 日期范围工具类
*/
/***
  * 获得今日时间
  */
function getCurrentToday () {
  var today = new Date();
  var todayNow = new Date(today.setTime(today.getTime()));
  var s=formatDate(todayNow,"yyyy-MM-dd HH:mm")//昨日日期
  //返回
  return s;
}
/**
 * base64加密
 */
var Base64 = { 
	_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
	encode:function(e){
		var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9+/=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/rn/g,"n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t
		},
}


module.exports = {
	formatDate: formatDate,
	getCurrentToday: getCurrentToday,
	Base64:Base64
}
