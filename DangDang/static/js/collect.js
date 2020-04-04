if (typeof JSON !== "object") {
    JSON = {}
}
(function () {
    "use strict";
    var g = /^[\],:{}\s]*$/;
    var h = /\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g;
    var l = /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g;
    var m = /(?:^|:|,)(?:\s*\[)+/g;
    var o = /[\\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
    var p = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;

    function f(n) {
        return n < 10 ? "0" + n : n
    }

    function this_value() {
        return this.valueOf()
    }

    if (typeof Date.prototype.toJSON !== "function") {
        Date.prototype.toJSON = function () {
            return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + f(this.getUTCMonth() + 1) + "-" + f(this.getUTCDate()) + "T" + f(this.getUTCHours()) + ":" + f(this.getUTCMinutes()) + ":" + f(this.getUTCSeconds()) + "Z" : null
        };
        Boolean.prototype.toJSON = this_value;
        Number.prototype.toJSON = this_value;
        String.prototype.toJSON = this_value
    }
    var q;
    var r;
    var s;
    var t;

    function quote(b) {
        o.lastIndex = 0;
        return o.test(b) ? "\"" + b.replace(o, function (a) {
            var c = s[a];
            return typeof c === "string" ? c : "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4)
        }) + "\"" : "\"" + b + "\""
    }

    function str(a, b) {
        var i;
        var k;
        var v;
        var c;
        var d = q;
        var e;
        var f = b[a];
        if (f && typeof f === "object" && typeof f.toJSON === "function") {
            f = f.toJSON(a)
        }
        if (typeof t === "function") {
            f = t.call(b, a, f)
        }
        switch (typeof f) {
            case"string":
                return quote(f);
            case"number":
                return isFinite(f) ? String(f) : "null";
            case"boolean":
            case"null":
                return String(f);
            case"object":
                if (!f) {
                    return "null"
                }
                q += r;
                e = [];
                if (Object.prototype.toString.apply(f) === "[object Array]") {
                    c = f.length;
                    for (i = 0; i < c; i += 1) {
                        e[i] = str(i, f) || "null"
                    }
                    v = e.length === 0 ? "[]" : q ? "[\n" + q + e.join(",\n" + q) + "\n" + d + "]" : "[" + e.join(",") + "]";
                    q = d;
                    return v
                }
                if (t && typeof t === "object") {
                    c = t.length;
                    for (i = 0; i < c; i += 1) {
                        if (typeof t[i] === "string") {
                            k = t[i];
                            v = str(k, f);
                            if (v) {
                                e.push(quote(k) + (q ? ": " : ":") + v)
                            }
                        }
                    }
                } else {
                    for (k in f) {
                        if (Object.prototype.hasOwnProperty.call(f, k)) {
                            v = str(k, f);
                            if (v) {
                                e.push(quote(k) + (q ? ": " : ":") + v)
                            }
                        }
                    }
                }
                v = e.length === 0 ? "{}" : q ? "{\n" + q + e.join(",\n" + q) + "\n" + d + "}" : "{" + e.join(",") + "}";
                q = d;
                return v
        }
    }

    if (typeof JSON.stringify !== "function") {
        s = {"\b": "\\b", "\t": "\\t", "\n": "\\n", "\f": "\\f", "\r": "\\r", "\"": "\\\"", "\\": "\\\\"};
        JSON.stringify = function (a, b, c) {
            var i;
            q = "";
            r = "";
            if (typeof c === "number") {
                for (i = 0; i < c; i += 1) {
                    r += " "
                }
            } else if (typeof c === "string") {
                r = c
            }
            t = b;
            if (b && typeof b !== "function" && (typeof b !== "object" || typeof b.length !== "number")) {
                throw new Error("JSON.stringify");
            }
            return str("", {"": a})
        }
    }
    if (typeof JSON.parse !== "function") {
        JSON.parse = function (d, e) {
            var j;

            function walk(a, b) {
                var k;
                var v;
                var c = a[b];
                if (c && typeof c === "object") {
                    for (k in c) {
                        if (Object.prototype.hasOwnProperty.call(c, k)) {
                            v = walk(c, k);
                            if (v !== undefined) {
                                c[k] = v
                            } else {
                                delete c[k]
                            }
                        }
                    }
                }
                return e.call(a, b, c)
            }

            d = String(d);
            p.lastIndex = 0;
            if (p.test(d)) {
                d = d.replace(p, function (a) {
                    return "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4)
                })
            }
            if (g.test(d.replace(h, "@").replace(l, "]").replace(m, ""))) {
                j = eval("(" + d + ")");
                return (typeof e === "function") ? walk({"": j}, "") : j
            }
            throw new SyntaxError("JSON.parse");
        }
    }
}());
var DDF;
(function (o, r) {
    var F = function (a, b) {
        return new F.prototype.init(a, b)
    };
    F.idSelectorReg = /^#[\w-]+/i;
    F.classSelectorReg = /^\.[\w-]+$/i;
    F.attrSelectorReg = /^[\w\*]+\[([\w-]+)(=\'(.*)\')?\]$/i;
    F.tagSelectorReg = /^[\w\*]+$/i;
    F.events = ['blur', 'change', 'click', 'dblclick', 'error', 'focus', 'keydown', 'keypress', 'keyup', 'load', 'mousedown', 'mousemove', 'mouseout', 'mouseover', 'mouseup', 'reset', 'resize', 'select', 'submit', 'unload', 'message'];
    F.bindElem = [];
    F.bindFn = {};
    F.fn = F.prototype = {
        init: function (a, b) {
            b = b || document;
            var c = this.qsa(b, a);
            if (c && !F.isEmptyObject(c)) {
                F.merge(this, c);
                this.selector = c
            }
            return this
        }, size: function () {
            return this.length
        }, find: function (d) {
            if (this.selector) {
                var e = false;
                var f = this;
                F.each(this.selector, function (a, b) {
                    if (e === false) {
                        f.clearDom.call(f);
                        e = true
                    }
                    var c = f.qsa(b, d);
                    if (c.length > 0) {
                        f.selector = typeof f.selector == 'array' ? f.selector : [];
                        F.merge(f.selector, c);
                        F.merge(f, c)
                    }
                })
            }
            return this
        }, qsa: function (a, b) {
            if (!b) {
                return null
            } else if (b.nodeType) {
                var c = [];
                c.push(b);
                return c
            } else if (b === "body" && document.body) {
                var c = [];
                c.push(document.body);
                return c
            } else if (b == o) {
                var c = [];
                c.push(o);
                return c
            } else if (typeof b == 'function') {
                return []
            } else if (typeof b === "string") {
                if (F.idSelectorReg.test(b)) {
                    var c = [];
                    c.push(document.getElementById(b.slice(1)));
                    return c
                } else if (a.querySelectorAll) {
                    return a.querySelectorAll(b)
                } else if (F.classSelectorReg.test(b)) {
                    var d = document.getElementsByTagName("*");
                    var c = [];
                    for (var i in d) {
                        if (d[i].nodeType == 1) {
                            var e = u(d[i], 'class');
                            if (e) {
                                var f = e.split(' ');
                                if (F.inArray(b.slice(1), f) >= 0) {
                                    c.push(d[i])
                                }
                            }
                        }
                    }
                    return c
                } else if (F.attrSelectorReg.test(b)) {
                    var d = document.getElementsByTagName("*");
                    var c = [];
                    for (var i in d) {
                        if (d[i] && d[i].nodeType == 1) {
                            var g = b.match(F.attrSelectorReg);
                            if (g && typeof g[1] != 'undefined') {
                                var h = g[1];
                                var j = u(d[i], h);
                                if (typeof g[3] != 'undefined' && g[3] !== null && g[3] !== '') {
                                    if (g[3] == j) {
                                        c.push(d[i])
                                    }
                                } else if (typeof j != 'undefined' && j !== null) {
                                    c.push(d[i])
                                }
                            }
                        }
                    }
                    return c
                } else if (F.tagSelectorReg.test(b)) {
                    var d = document.getElementsByTagName(b);
                    var c = [];
                    for (var i in d) {
                        if (d[i].nodeType == 1) {
                            c.push(i)
                        }
                    }
                    return c
                } else {
                    return null
                }
            }
        }, bind: function (d, e) {
            if (F.inArray(d, F.events) >= 0) {
                F.each(this, function (k, a) {
                    if (a.addEventListener) {
                        a.addEventListener(d, e, false)
                    } else if (a.attachEvent) {
                        a.attachEvent('on' + d, e)
                    } else {
                        a["on" + d] = e
                    }
                    var b = F.inArray(a, F.bindElem);
                    b = F.inArray(a, F.bindElem) < 0 ? (F.bindElem.push(a) - 1) : b;
                    if (F.bindFn[b]) {
                        F.bindFn[b].push(e)
                    } else {
                        var c = [];
                        c.push(e);
                        F.bindFn[b] = c
                    }
                })
            }
        }, unbind: function (c, d) {
            if (F.inArray(c, F.events) >= 0) {
                F.each(this, function (k, a) {
                    if (d) {
                        if (a.removeEventListener) {
                            a.removeEventListener(c, d, false)
                        } else if (a.detachEvent) {
                            a.detachEvent('on' + c, d)
                        } else {
                            a["on" + c] = null
                        }
                    } else {
                        var b = F.inArray(a, F.bindElem);
                        if (b >= 0) {
                            for (var i = 0; i < F.bindFn[b].length; i++) {
                                if (a.removeEventListener) {
                                    a.removeEventListener(c, F.bindFn[b][i], false)
                                } else if (a.detachEvent) {
                                    a.detachEvent('on' + c, F.bindFn[b][i])
                                }
                            }
                            a["on" + c] = null
                        }
                    }
                })
            }
        }, attr: function (a, b) {
            if (arguments.length > 0 && typeof a == 'string') {
                if (arguments.length > 1) {
                    _self = this;
                    return F.each(_self, function () {
                        b == null ? z(this, a) : w(this, a, b)
                    })
                } else {
                    return typeof this[0] != 'undefined' && this[0].nodeType == 1 ? u(this[0], a) : null
                }
            }
            return null
        }, children: function () {
            if (typeof this[0] != 'undefined' && this[0].nodeType == 1) {
                var a = this[0].childNodes;
                var b = [];
                var c = false;
                for (var i = 0; i < a.length; i++) {
                    if (a[i].nodeType == 1) {
                        if (c === false) {
                            this.clearDom.call(this);
                            c = true
                        }
                        b.push(a[i])
                    }
                }
                this.selector = b;
                F.merge(this, b);
                return this
            }
            return null
        }, parent: function () {
            if (typeof this[0] != 'undefined' && this[0].nodeType == 1) {
                var a = [];
                a.push(this[0].parentNode);
                this.selector = a;
                this.clearDom.call(this);
                F.merge(this, a);
                return this
            }
            return null
        }, parents: function (a) {
            if (typeof this[0] != 'undefined' && this[0].nodeType == 1) {
                var b = this[0].parentNode;
                var c = [];
                if (a) {
                    var d = null, regRes = null;
                    if (typeof a == 'function') {
                        d = 'function'
                    } else if (regRes = a.match(F.idSelectorReg)) {
                        d = 'id'
                    } else if (regRes = a.match(F.classSelectorReg)) {
                        d = 'class'
                    } else if (regRes = a.match(F.attrSelectorReg)) {
                        d = 'attr'
                    } else if (regRes = a.match(F.tagSelectorReg)) {
                        d = 'tag'
                    }
                }
                while (b != null && b.tagName != null) {
                    if (a) {
                        if (d == 'id') {
                            attrValue = F(b).attr('id');
                            if (attrValue != null && attrValue == regRes[0].slice(1)) {
                                c.push(b)
                            }
                        }
                        if (d == 'class') {
                            attrValue = F(b).attr('class');
                            if (attrValue != null) {
                                var e = attrValue.split(' ');
                                if (F.inArray(regRes[0].slice(1), e) >= 0) c.push(b)
                            }
                        }
                        if (d == 'attr') {
                            if (typeof regRes[1] != 'undefined' && regRes[1] !== null) {
                                var f = null, attrValue = null;
                                f = regRes[1];
                                if (typeof regRes[3] != 'undefined' && regRes[3] !== null) {
                                    attrValue = F(b).attr(f);
                                    if (regRes[3] == attrValue) c.push(b)
                                } else {
                                    attrValue = F(b).attr(f);
                                    if (attrValue !== null) c.push(b)
                                }
                            }
                        }
                        if (d == 'tag') {
                            if (typeof regRes[0] != 'undefined' && regRes[0] !== null) {
                                if (F(b).tagName() === regRes[0]) c.push(b)
                            }
                        }
                        if (d == 'function') {
                            if (a(b)) {
                                c.push(b)
                            }
                        }
                    } else {
                        c.push(b)
                    }
                    b = b.parentNode
                }
                this.clearDom.call(this);
                if (c.length > 0) {
                    this.selector = c;
                    F.merge(this, c)
                }
                return this
            }
            return null
        }, parentsUntil: function (a) {
            if (typeof this[0] != 'undefined' && this[0].nodeType == 1) {
                var b = this[0].parentNode;
                var c = [];
                var d = null, regRes = null;
                if (typeof a == 'function') {
                    d = 'function'
                } else if (regRes = a.match(F.idSelectorReg)) {
                    d = 'id'
                } else if (regRes = a.match(F.classSelectorReg)) {
                    d = 'class'
                } else if (regRes = a.match(F.attrSelectorReg)) {
                    d = 'attr'
                } else if (regRes = a.match(F.tagSelectorReg)) {
                    d = 'tag'
                }
                while (b != null && b.tagName != null) {
                    if (d == 'id') {
                        attrValue = F(b).attr('id');
                        if (attrValue != null && attrValue == regRes[0].slice(1)) {
                            c.push(b);
                            break
                        }
                    }
                    if (d == 'class') {
                        attrValue = F(b).attr('class');
                        if (attrValue != null) {
                            var e = attrValue.split(' ');
                            if (F.inArray(regRes[0].slice(1), e) >= 0) {
                                c.push(b);
                                break
                            }
                        }
                    }
                    if (d == 'attr') {
                        if (typeof regRes[1] != 'undefined' && regRes[1] !== null) {
                            var f = null, attrValue = null;
                            f = regRes[1];
                            if (typeof regRes[3] != 'undefined' && regRes[3] !== null) {
                                attrValue = F(b).attr(f);
                                if (regRes[3] == attrValue) {
                                    c.push(b);
                                    break
                                }
                            } else {
                                attrValue = F(b).attr(f);
                                if (attrValue !== null) {
                                    c.push(b);
                                    break
                                }
                            }
                        }
                    }
                    if (d == 'tag') {
                        if (typeof regRes[0] != 'undefined' && regRes[0] !== null) {
                            if (F(b).tagName() === regRes[0]) {
                                c.push(b);
                                break
                            }
                        }
                    }
                    if (d == 'function') {
                        if (a(b)) {
                            c.push(b);
                            break
                        }
                    }
                    b = b.parentNode
                }
                this.clearDom.call(this);
                if (c.length > 0) {
                    this.selector = c;
                    F.merge(this, c)
                }
                return this
            }
            return null
        }, each: function (a) {
            F.each(this, a);
            return this
        }, css: function (d, e) {
            if (typeof this[0] != 'undefined' && this[0].nodeType == 1) {
                var f = this[0];
                var g = /^(left|right|bottom|top)$/;
                var h = "getComputedStyle" in o;
                var j = function (c) {
                    c = (c === "float") ? (h ? "CSSFloat" : "styleFloat") : c;
                    c = c.replace(/\-(\w)/g, function (a, b) {
                        return b.toUpperCase()
                    });
                    return c
                };
                if (arguments.length == 1 && e === r) {
                    if (typeof d == "object") {
                        for (var i in d) {
                            var i = j(i);
                            f.style[i] = d[i]
                        }
                        return this
                    }
                    d = j(d);
                    return !!f.style[d] ? f.style[d] : h ? function () {
                        var a = getComputedStyle(f, null)[d];
                        if (g.test(d) && a === "auto") {
                            return "0px"
                        }
                        return a
                    }() : function () {
                        var a = f.currentStyle[d];
                        if (d === "width" || d === "height" && a === "auto") {
                            var b = f.getBoundingClientRect();
                            return (d === "width" ? b.right - b.left : b.bottom - b.top) + "px"
                        }
                        if (d === "opacity") {
                            var c = f.currentStyle.filter;
                            if (/opacity/.test(c)) {
                                a = c.match(/\d /)[0] / 100;
                                return (a === 1 || a === 0) ? a.toFixed(0) : a.toFixed(1)
                            } else if (a === r) {
                                return "1"
                            }
                        }
                        if (rPos.test(p) && a === "auto") {
                            return "0px"
                        }
                        return a
                    }()
                } else if (arguments.length == 2) {
                    f.style[d] = e;
                    return this
                }
            }
        }, width: function () {
            var a = this[0];
            var b;
            var c = document.documentElement, doBody = document.body;
            if (a) {
                if (typeof a == "object" && "setInterval" in a) {
                    b = c.clientWidth || doBody.clientWidth
                } else if (a == document) {
                    b = c.offsetWidth || doBody.offsetWidth
                } else {
                    res = a.getBoundingClientRect();
                    b = res.width || res.right - res.left
                }
                return b
            }
        }, height: function () {
            var a = this[0];
            var b;
            var c = document.documentElement, doBody = document.body;
            if (a) {
                if (typeof a == "object" && "setInterval" in a) {
                    b = c.clientHeight || doBody.clientHeight
                } else if (a == document) {
                    b = c.offsetHeight || doBody.offsetHeight
                } else {
                    res = a.getBoundingClientRect();
                    b = res.height || res.bottom - res.top
                }
                return b
            }
        }, location: function () {
            if (typeof this[0] != 'undefined') {
                var a = this[0];
                if (a && typeof a.getBoundingClientRect === 'function') {
                    var b = a.getBoundingClientRect();
                    var c = document.documentElement.clientTop;
                    var d = document.documentElement.clientLeft;
                    return {top: b.top - c, left: b.left - d, right: b.right - d, bottom: b.bottom - c}
                }
                return null
            }
            return null
        }, tagName: function () {
            if (this[0]) {
                return this[0].tagName.toLowerCase()
            }
            return false
        }, dom: function () {
            return this.selector ? this.selector[0] : null
        }, clearDom: function () {
            for (var i = 0; i < this.length; i++) {
                delete this[i]
            }
            this.length = 0;
            this.selector = ''
        }
    };
    F.prototype.init.prototype = F.prototype;
    var u = function (n, a) {
        if (typeof n != 'object' || typeof a != 'string') return;
        return a == 'class' ? n.className : n.getAttribute(a)
    };
    var w = function (n, a, v) {
        if (typeof n != 'object' || typeof a != 'string') return;
        a == 'class' ? n.className = v : n.setAttribute(a, v)
    };
    var z = function (n, a) {
        if (typeof n != 'object' || typeof a != 'string') return;
        n.removeAttribute(a);
        if (a == 'class') n.removeAttribute('className')
    };
    F.each = function (a, b, c) {
        var d, i = 0, length = a.length, isObj = length === r || typeof a == 'function';
        if (c) {
            if (isObj) {
                for (d in a) {
                    if (b.apply(a[d], c) === false) {
                        break
                    }
                }
            } else {
                for (; i < length;) {
                    if (b.apply(a[i++], c) === false) {
                        break
                    }
                }
            }
        } else {
            if (isObj) {
                for (d in a) {
                    if (b.call(a[d], d, a[d]) === false) {
                        break
                    }
                }
            } else {
                for (var e = a[0]; i < length && b.call(e, i, e) !== false; e = a[++i]) {
                }
            }
        }
        return a
    };
    F.merge = function (a, b) {
        var i = a.length || 0, j = 0;
        if (typeof b.length === "number") {
            for (var l = b.length; j < l; j++) {
                a[i++] = b[j]
            }
        } else {
            while (b[j] !== r) {
                a[i++] = b[j++]
            }
        }
        a.length = i;
        return a
    };
    F.extend = function (a, b) {
        if (typeof a == 'object' && typeof b == 'object') {
            for (var i in b) {
                if (b.hasOwnProperty(i)) {
                    a[i] = b[i]
                }
            }
            return a
        }
        return null
    };
    F.ajax = function (d) {
        var f = {
            url: o.location.href,
            type: "GET",
            async: true,
            data: {},
            dataType: 'json',
            jsonp: 'callback',
            jsonpCallback: 'ddf_' + F.createPid(),
            jsonpTimeout: 6000,
            success: function () {
            },
            error: function () {
            }
        };
        d = F.extend(f, d);
        d.type = (d.type || "GET").toUpperCase();
        if (o.XMLHttpRequest === r) {
            o.XMLHttpRequest = function () {
                try {
                    return new ActiveXObject("MSXML2.XMLHttp.6.0")
                } catch (e) {
                    try {
                        return new ActiveXObject("MSXML2.XMLHttp.3.0")
                    } catch (e1) {
                        F.error("XMLHttpRequest is not supported")
                    }
                }
            }
        }
        var g = function (a) {
            if (typeof a == 'object') {
                var b = [];
                for (var k in a) {
                    b.push(encodeURIComponent(k) + "=" + encodeURIComponent(a[k]))
                }
                return b.join("&")
            }
            return a
        };
        if (d.dataType.toLowerCase() !== 'jsonp') {
            var h = new XMLHttpRequest();
            var i = d.data ? g(d.data) : '';
            if (d.type == "GET") {
                d.url = d.url.indexOf('?') >= 0 ? d.url + '&' + i : d.url + '?' + i;
                h.open("GET", d.url);
                h.send(null)
            } else if (d.type == "POST") {
                h.open("POST", d.url, true);
                h.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                h.send(i)
            }
            if (d.async === true) {
                h.onreadystatechange = function () {
                    if (h.readyState == 4) {
                        j()
                    }
                }
            }
            if (d.async === false) {
                j()
            }
            var j = function () {
                var a = h.status;
                var b = d.dataType.toLowerCase();
                var c;
                switch (b) {
                    case'html':
                        c = h.responseText;
                        break;
                    case'json':
                        c = JSON.parse(h.responseText);
                        break;
                    case'xml':
                        c = h.responseXML;
                        break
                }
                ;
                if (a == 200) {
                    d.success && d.success(c)
                } else {
                    d.error && d.error(a, c)
                }
            }
        } else {
            var i = d.data ? g(d.data) : '';
            var l = d.url.indexOf('?') >= 0 ? d.url + '&' + i : d.url + '?' + i;
            l = l + '&' + d.jsonp + '=' + d.jsonpCallback;
            o[d.jsonpCallback] = function (a) {
                try {
                    d.success && d.success(a)
                } finally {
                    o[d.jsonpCallback] = null;
                    try {
                        delete o[d.jsonpCallback]
                    } catch (e) {
                    }
                    document.body.removeChild(m)
                }
            };
            var m = document.createElement('script');
            m.src = l;
            document.body.appendChild(m);
            o.setTimeout(function () {
                if (typeof o[d.jsonpCallback] == 'function') {
                    o[d.jsonpCallback] = function () {
                        d.error && d.error()
                    };
                    document.body.removeChild(m)
                }
            }, d.jsonpTimeout)
        }
    };
    F.cookie = function (a) {
        var b = {key: '', value: '', expires: new Date('2999/1/1'), path: '/', domain: 'dangdang.com'};
        a = a || {};
        a = F.extend(b, a);
        if (a.value === '') {
            var c = null;
            if (document.cookie && document.cookie != '') {
                var d = document.cookie.split(';');
                for (var i = 0; i < d.length; i++) {
                    var e = (d[i] || "").replace(/^\s+|\s+$/g, "");
                    if (e.substring(0, (a.key.length) + 1) == (a.key + '=')) {
                        c = decodeURIComponent(e.substring(a.key.length + 1));
                        break
                    }
                }
            }
            return c
        } else {
            if (a.value === null) {
                a.expires = -1
            }
            var f = '';
            if (a.expires && (typeof a.expires == 'number' || a.expires.toUTCString)) {
                var g;
                if (typeof a.expires == 'number') {
                    g = new Date();
                    g.setTime(g.getTime() + (a.expires * 24 * 60 * 60 * 1000))
                } else {
                    g = a.expires
                }
                f = '; expires=' + g.toUTCString()
            }
            var h = a.path ? '; path=' + a.path : '', domain = a.domain ? '; domain=' + a.domain : '',
                secure = a.secure ? '; secure' : '';
            document.cookie = [a.key, '=', encodeURIComponent(a.value), f, h, domain, secure].join('')
        }
    };
    F.Deferred = function () {
        var c = {
            status: 'pending', doneList: [], failList: [], resolve: function (a) {
                this.status = 'resolved';
                for (var i = 0; i < this.doneList.length; i++) {
                    this.doneList[i].call(this, a);
                    this.doneList.shift()
                }
            }, reject: function (a) {
                this.status = 'rejected';
                for (var i = 0; i < this.failList.length; i++) {
                    this.failList[i].call(this, a);
                    this.doneList.shift()
                }
            }, done: function (a) {
                if (typeof a === 'function') {
                    this.doneList.push(a)
                }
                return this
            }, fail: function (a) {
                if (typeof a === 'function') {
                    this.failList.push(a)
                }
                return this
            }, then: function (a, b) {
                this.done(a).fail(b);
                return this
            }, always: function (a) {
                this.done(a).fail(a);
                return this
            }
        };
        return c
    };
    F.inArray = function (a, b) {
        if (b.indexOf) {
            return b.indexOf(a)
        }
        for (var i = 0, length = b.length; i < length; i++) {
            if (b[i] === a) {
                return i
            }
        }
        return -1
    };
    F.chunkArray = function (a, b) {
        var c = [];
        for (var x = 0; x < Math.ceil(a.length / b); x++) {
            var d = x * b;
            var e = d + b;
            c.push(a.slice(d, e))
        }
        return c
    };
    F.isArray = function (a) {
        return Object.prototype.toString.call(a) === '[object Array]'
    };
    F.isEmptyObject = function (a) {
        var i;
        for (i in a) {
            return false
        }
        return true
    };
    F.now = function () {
        return (new Date()).getTime()
    };
    F.error = function (a) {
        throw a;
    };
    F.md5 = function (k) {
        var l = {
            hexcase: 0, b64pad: "", chrsz: 8, binl2hex: function (a) {
                var b = this.hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
                var c = "";
                for (var i = 0; i < a.length * 4; i++) {
                    c += b.charAt((a[i >> 2] >> ((i % 4) * 8 + 4)) & 0xF) + b.charAt((a[i >> 2] >> ((i % 4) * 8)) & 0xF)
                }
                return c
            }, core_md5: function (x, e) {
                x[e >> 5] |= 0x80 << ((e) % 32);
                x[(((e + 64) >>> 9) << 4) + 14] = e;
                var a = 1732584193;
                var b = -271733879;
                var c = -1732584194;
                var d = 271733878;
                for (var i = 0; i < x.length; i += 16) {
                    var f = a;
                    var g = b;
                    var h = c;
                    var j = d;
                    a = this.md5_ff(a, b, c, d, x[i + 0], 7, -680876936);
                    d = this.md5_ff(d, a, b, c, x[i + 1], 12, -389564586);
                    c = this.md5_ff(c, d, a, b, x[i + 2], 17, 606105819);
                    b = this.md5_ff(b, c, d, a, x[i + 3], 22, -1044525330);
                    a = this.md5_ff(a, b, c, d, x[i + 4], 7, -176418897);
                    d = this.md5_ff(d, a, b, c, x[i + 5], 12, 1200080426);
                    c = this.md5_ff(c, d, a, b, x[i + 6], 17, -1473231341);
                    b = this.md5_ff(b, c, d, a, x[i + 7], 22, -45705983);
                    a = this.md5_ff(a, b, c, d, x[i + 8], 7, 1770035416);
                    d = this.md5_ff(d, a, b, c, x[i + 9], 12, -1958414417);
                    c = this.md5_ff(c, d, a, b, x[i + 10], 17, -42063);
                    b = this.md5_ff(b, c, d, a, x[i + 11], 22, -1990404162);
                    a = this.md5_ff(a, b, c, d, x[i + 12], 7, 1804603682);
                    d = this.md5_ff(d, a, b, c, x[i + 13], 12, -40341101);
                    c = this.md5_ff(c, d, a, b, x[i + 14], 17, -1502002290);
                    b = this.md5_ff(b, c, d, a, x[i + 15], 22, 1236535329);
                    a = this.md5_gg(a, b, c, d, x[i + 1], 5, -165796510);
                    d = this.md5_gg(d, a, b, c, x[i + 6], 9, -1069501632);
                    c = this.md5_gg(c, d, a, b, x[i + 11], 14, 643717713);
                    b = this.md5_gg(b, c, d, a, x[i + 0], 20, -373897302);
                    a = this.md5_gg(a, b, c, d, x[i + 5], 5, -701558691);
                    d = this.md5_gg(d, a, b, c, x[i + 10], 9, 38016083);
                    c = this.md5_gg(c, d, a, b, x[i + 15], 14, -660478335);
                    b = this.md5_gg(b, c, d, a, x[i + 4], 20, -405537848);
                    a = this.md5_gg(a, b, c, d, x[i + 9], 5, 568446438);
                    d = this.md5_gg(d, a, b, c, x[i + 14], 9, -1019803690);
                    c = this.md5_gg(c, d, a, b, x[i + 3], 14, -187363961);
                    b = this.md5_gg(b, c, d, a, x[i + 8], 20, 1163531501);
                    a = this.md5_gg(a, b, c, d, x[i + 13], 5, -1444681467);
                    d = this.md5_gg(d, a, b, c, x[i + 2], 9, -51403784);
                    c = this.md5_gg(c, d, a, b, x[i + 7], 14, 1735328473);
                    b = this.md5_gg(b, c, d, a, x[i + 12], 20, -1926607734);
                    a = this.md5_hh(a, b, c, d, x[i + 5], 4, -378558);
                    d = this.md5_hh(d, a, b, c, x[i + 8], 11, -2022574463);
                    c = this.md5_hh(c, d, a, b, x[i + 11], 16, 1839030562);
                    b = this.md5_hh(b, c, d, a, x[i + 14], 23, -35309556);
                    a = this.md5_hh(a, b, c, d, x[i + 1], 4, -1530992060);
                    d = this.md5_hh(d, a, b, c, x[i + 4], 11, 1272893353);
                    c = this.md5_hh(c, d, a, b, x[i + 7], 16, -155497632);
                    b = this.md5_hh(b, c, d, a, x[i + 10], 23, -1094730640);
                    a = this.md5_hh(a, b, c, d, x[i + 13], 4, 681279174);
                    d = this.md5_hh(d, a, b, c, x[i + 0], 11, -358537222);
                    c = this.md5_hh(c, d, a, b, x[i + 3], 16, -722521979);
                    b = this.md5_hh(b, c, d, a, x[i + 6], 23, 76029189);
                    a = this.md5_hh(a, b, c, d, x[i + 9], 4, -640364487);
                    d = this.md5_hh(d, a, b, c, x[i + 12], 11, -421815835);
                    c = this.md5_hh(c, d, a, b, x[i + 15], 16, 530742520);
                    b = this.md5_hh(b, c, d, a, x[i + 2], 23, -995338651);
                    a = this.md5_ii(a, b, c, d, x[i + 0], 6, -198630844);
                    d = this.md5_ii(d, a, b, c, x[i + 7], 10, 1126891415);
                    c = this.md5_ii(c, d, a, b, x[i + 14], 15, -1416354905);
                    b = this.md5_ii(b, c, d, a, x[i + 5], 21, -57434055);
                    a = this.md5_ii(a, b, c, d, x[i + 12], 6, 1700485571);
                    d = this.md5_ii(d, a, b, c, x[i + 3], 10, -1894986606);
                    c = this.md5_ii(c, d, a, b, x[i + 10], 15, -1051523);
                    b = this.md5_ii(b, c, d, a, x[i + 1], 21, -2054922799);
                    a = this.md5_ii(a, b, c, d, x[i + 8], 6, 1873313359);
                    d = this.md5_ii(d, a, b, c, x[i + 15], 10, -30611744);
                    c = this.md5_ii(c, d, a, b, x[i + 6], 15, -1560198380);
                    b = this.md5_ii(b, c, d, a, x[i + 13], 21, 1309151649);
                    a = this.md5_ii(a, b, c, d, x[i + 4], 6, -145523070);
                    d = this.md5_ii(d, a, b, c, x[i + 11], 10, -1120210379);
                    c = this.md5_ii(c, d, a, b, x[i + 2], 15, 718787259);
                    b = this.md5_ii(b, c, d, a, x[i + 9], 21, -343485551);
                    a = this.safe_add(a, f);
                    b = this.safe_add(b, g);
                    c = this.safe_add(c, h);
                    d = this.safe_add(d, j)
                }
                return Array(a, b, c, d)
            }, md5_cmn: function (q, a, b, x, s, t) {
                return this.safe_add(this.bit_rol(this.safe_add(this.safe_add(a, q), this.safe_add(x, t)), s), b)
            }, md5_ff: function (a, b, c, d, x, s, t) {
                return this.md5_cmn((b & c) | ((~b) & d), a, b, x, s, t)
            }, md5_gg: function (a, b, c, d, x, s, t) {
                return this.md5_cmn((b & d) | (c & (~d)), a, b, x, s, t)
            }, md5_hh: function (a, b, c, d, x, s, t) {
                return this.md5_cmn(b ^ c ^ d, a, b, x, s, t)
            }, md5_ii: function (a, b, c, d, x, s, t) {
                return this.md5_cmn(c ^ (b | (~d)), a, b, x, s, t)
            }, str2binl: function (a) {
                var b = Array();
                var c = (1 << this.chrsz) - 1;
                for (var i = 0; i < a.length * this.chrsz; i += this.chrsz) b[i >> 5] |= (a.charCodeAt(i / this.chrsz) & c) << (i % 32);
                return b
            }, safe_add: function (x, y) {
                var a = (x & 0xFFFF) + (y & 0xFFFF);
                var b = (x >> 16) + (y >> 16) + (a >> 16);
                return (b << 16) | (a & 0xFFFF)
            }, bit_rol: function (a, b) {
                return (a << b) | (a >>> (32 - b))
            }, hex_md5: function (s) {
                return this.binl2hex(this.core_md5(this.str2binl(s), s.length * this.chrsz))
            }
        };
        return l.hex_md5(k)
    };
    F.urlParam = function (a, b, c) {
        if (a) {
            if (b) {
                var d = a.split('#')[0];
                var e = new RegExp("([&|?]" + b + "=)([^&]*)", "g");
                if (typeof c != 'undefined') {
                    var f = /^https?:\/\/(.*?)($|\/)/.exec(d);
                    if (f && f[3] == '') {
                        d += '/'
                    }
                    if (/\?/g.test(d)) {
                        if (e.test(d)) {
                            d = d.replace(e, "$1" + c)
                        } else {
                            if (d.substr(-1, 1) == '&') {
                                d += b + '=' + c
                            } else {
                                d += '&' + b + '=' + c
                            }
                        }
                    } else {
                        d += "?" + b + "=" + c
                    }
                    if (d.split('#')[1]) {
                        d += d.split('#')[1]
                    }
                    return d
                } else {
                    var g = e.exec(a);
                    if (g != null && typeof g[2] != 'undefined') return g[2];
                    return false
                }
            } else {
                var h = new Object();
                if (a.indexOf("?") > 0) {
                    var j = a.substring(a.indexOf("?") + 1);
                    if (j.indexOf("#") > 0) {
                        j = j.substring(0, j.indexOf("#"))
                    }
                    var k = j.split("&");
                    for (var i = 0; i < k.length; i++) {
                        h[k[i].split("=")[0]] = k[i].split("=")[1]
                    }
                }
                return h
            }
        }
        return false
    };
    F.hashKey = 'DDClick521';
    F.hash = function (c) {
        var d = function (a, b) {
            return new Array(b + 1).join(a)
        };
        var e = parseInt(c.substr(0, 8), 16);
        var f = String(e).substr(0, 6);
        var g = f.length;
        if (g < 6) {
            f += d('0', Math.abs(6 - g))
        }
        return f
    };
    F.createPid = function () {
        var n = new Date();
        var y = n.getFullYear() + '';
        var m = n.getMonth() + 1;
        if (m < 10) m = "0" + m;
        var d = n.getDate();
        if (d < 10) d = "0" + d;
        var H = n.getHours();
        if (H < 10) H = "0" + H;
        var M = n.getMinutes();
        if (M < 10) M = "0" + M;
        var S = n.getSeconds();
        if (S < 10) S = "0" + S;
        var a = "00" + n.getMilliseconds();
        a = a.substr(a.length - 3, 3);
        var b = Math.floor(100000 + Math.random() * 900000);
        var c = Math.floor(100000 + Math.random() * 900000);
        var e = y + m + d + H + M + S + a + b + c + F.hashKey;
        var f = F.md5(e);
        f = F.hash(f);
        return y + m + d + H + M + S + a + f + b + c
    };
    F.checkPid = function (a) {
        if (a) {
            if (a.length != 35) {
                return false
            }
            return true
        }
        return false
    };
    o.DDF = F
})(window);
var DDT;
(function (j, l) {
    var F = DDF;
    var T = {
        __url: "",
        __referrer: "",
        __out_refer: '',
        __meta_data: '',
        __perm_id: '',
        __udid: '',
        __client_version: '',
        __page_id: '',
        __platform: '',
        __platform_name: 'platform',
        __meta_platform: '',
        __meta_viewport: '',
        __meta_listen_name: 'listen',
        __meta_listen: '',
        __ios_protocol: 'applewebdata://',
        __android_protocol: 'androidwebdata://',
        __pm_page: 'ddt-page',
        __pm_area: 'ddt-area',
        __pm_pit: 'ddt-pit',
        __pm_src: 'ddt-src',
        __pm_attrs: ['ddt-src', 'ddt-pit', 'ddt-area', 'ddt-page'],
        __pm_nested: ['ddt-area'],
        __pm_click: '',
        __rpm_name: 'rpm',
        __rpm_key: 'ddt-rpm',
        __rpm: '',
        __rpms: '',
        __rpms_line: '',
        __rpm_attrs: ['ddt-page', 'ddt-area', 'ddt-pit'],
        __rpm_max: 50,
        __rpm_split: '|',
        __pm_key: 'ddt-data-key',
        __pm_data: 'ddt-data',
        __data: '',
        __ddc_pid: '__permanent_id',
        __ddc_out_refer: '__out_refer',
        __ddc_rpm: '__rpm',
        __sites: ['dangdang.com', 'globaldangdang.hk', 'dangm.cn']
    };
    T.domainReg = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = /^((https?|androidwebdata|applewebdata):\/\/((([\w\-]+\.)*)([\w\-]+\.[A-Za-z]+))(\:\d+)?)\/?(.)*?/;
        return b.exec(a)
    };
    T.domainProtocol = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = T.domainReg(a);
        return b[2] ? b[2] : null
    };
    T.domain = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = T.domainReg(a);
        return b[3] ? b[3] : null
    };
    T.topDomain = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = T.domainReg(a);
        return typeof b[6] != 'undefined' ? b[6] : null
    };
    T.getMeta = function () {
        var e = F("meta");
        e.each(function () {
            var a = F(this);
            var b = a.attr('name'), content = a.attr('content');
            if (b && content) {
                if (b == T.__platform_name) {
                    T.__meta_platform = content
                }
                if (b == 'viewport' && content.indexOf('width=device-width') >= 0) {
                    T.__meta_viewport = 'touch'
                }
                var c = /ddclick_(.*)/i;
                var d = b.match(c);
                if (d) {
                    T.__meta_data += d[1] + '=' + content + ';'
                }
                if (b == T.__meta_listen_name && content != '') {
                    T.__meta_listen = content
                }
            }
        })
    };
    T.platform = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = 'pc';
        var c = navigator.userAgent.toLowerCase();
        if (T.__meta_platform != '') {
            return T.__meta_platform
        }
        if (c.indexOf('dangdang-android') >= 0) {
            return 'android'
        }
        if (c.indexOf('dangdang-ios') >= 0) {
            return 'iphone'
        }
        if (T.__meta_viewport != '') {
            return T.__meta_viewport
        }
        if (c.indexOf('miniProgram') >= 0) {
            return 'miniprogram'
        }
        if (c.indexOf('micromessenger') >= 0) {
            return 'wechat'
        }
        return b
    };
    T.serverUrl = function () {
        var a = T.domainProtocol();
        return a + '://' + 'databack.dangdang.com/ddt.php'
    };
    T.currentUrl = function () {
        return j.location.href || document.URL || document.location.href
    };
    T.decodeUrl = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b;
        try {
            b = decodeURIComponent(a)
        } catch (e) {
            b = a.replace(/%3a/ig, ":");
            b = a.replace(/%2f/ig, "/")
        }
        return b
    };
    T.referUrl = function (a) {
        a = a ? a : T.__url || T.currentUrl();
        var b = '';
        if (a.indexOf("#dd_refer=http") > 0) {
            b = (a.substring(a.indexOf("#dd_refer=") + "#dd_refer=".length));
            b = T.decodeUrl(b)
        } else {
            if (document.referrer) {
                b = document.referrer
            } else {
                try {
                    if (j.opener && j.opener.location) {
                        b = j.opener.location.href
                    }
                } catch (e) {
                }
            }
        }
        return b
    };
    T.isOutRefer = function (a) {
        a = a ? a : T.__referrer || T.referUrl();
        return F.inArray(T.topDomain(a), T.__sites) >= 0 ? false : true
    };
    T.outRefer = function (a) {
        a = a ? a : T.__referrer || T.referUrl();
        if (T.isOutRefer(a)) {
            var b = Math.round(F.now() / 1000);
            var c = T.domain(a);
            var d = b + "|!|" + c;
            var e = [["baidu", "word"], ["baidu", "wd"], ["baidu", "w"], ["baidu", "kw"], ["google", "q"], ["soso", "w"], ["soso", "key"], ["sogou", "query"], ["sogou", "keyword"], ["youdao", "q"], ["bing", "q"], ["yahoo", "p"], ["ask", "q"], ["360", "q"], ["yahoo", "p"], ["ask", "q"], ["360", "q"], ["jike", "q"], ["ucweb", "keyword"], ["ucweb", "word"], ["so", "q"], ["haosou", "q"]];
            var f = T.topDomain(a);
            var g = F.urlParam(a);
            for (var i = 0; i < e.length; i++) {
                if (e[i][0] == f && typeof g[e[i][1]] != 'undefined') {
                    d += "|!|" + g[e[i][1]].substring(0, 10);
                    return d;
                    break
                }
            }
            return d
        }
        return ''
    };
    T.permId = function (a) {
        a = a || T.currentUrl();
        var b;
        if (a.indexOf(T.__android_protocol) >= 0 || a.indexOf(T.__ios_protocol) >= 0) {
            var c = new RegExp("PermanentID=([^&]*)", 'i');
            var d = c.exec(a);
            if (d != null && typeof d[1] != 'undefined') {
                b = d[1]
            }
        } else {
            var e = {key: T.__ddc_pid, domain: T.topDomain()};
            if (F.urlParam(a, 'permanent_id')) {
                b = F.urlParam(a, 'permanent_id')
            } else {
                b = F.cookie(e);
                if (!b) {
                    b = F.createPid();
                    e.value = b;
                    F.cookie(e)
                }
            }
        }
        return b
    };
    T.udId = function (a) {
        a = a || T.currentUrl();
        if (a.indexOf(T.__ios_protocol) >= 0 || a.indexOf(T.__ios_protocol) >= 0) {
            var b = new RegExp("UDID=([^&]*)", 'i');
            var c = b.exec(a);
            if (c != null && typeof c[1] != 'undefined') {
                return c[1]
            }
        }
        if (F.urlParam(a, 'udid')) {
            var d = F.urlParam(a, 'udid');
            return d
        }
        return ''
    };
    T.clientVersion = function (a) {
        a = a || T.currentUrl();
        if (F.urlParam(a, 'client_version')) {
            var b = F.urlParam(a, 'client_version');
            return b
        }
        return ''
    };
    T.pageId = function () {
        var a = F('body').attr(T.__pm_page);
        if (a) {
            a = a.replace(/\s+/g, '');
            return a
        }
        return ''
    };
    T.isClickElem = function (a) {
        if (a == null || a.nodeType !== 1) return false;
        var b = F(a);
        var c = b.tagName();
        var d = ['a', 'button', 'input', 'submit', 'reset', 'area', 'img'];
        if (b.attr('onclick') != null || b.attr('ddt-click') != null) {
            return true
        }
        if (F.inArray(c, d) >= 0) {
            return true
        }
        return false
    };
    T.getClickAttr = function (a) {
        var b = {};
        var c = F(a);
        var d = null;
        if (d = c.attr('id')) {
            b['oi'] = d
        }
        if (d = c.attr('name')) {
            b['on'] = d
        }
        if (d = c.attr('ddt-click') || c.attr('dd_name')) {
            b['dn'] = d
        }
        if (d = c.attr('ddt-src') || c.attr('dd_src')) {
            b['ds'] = d
        }
        if (c.tagName() == 'a' && !b['ds']) {
            var e = a.getElementsByTagName('img');
            var f = /(<.*>)/;
            var g = (e.length == 1 && e[0].alt) || ((!f.test(a.innerHTML)) && a.innerHTML) || '';
            if (g) b['ds'] = g
        }
        if (d = c.attr('nname')) {
            b['nn'] = d
        }
        return F.isEmptyObject(b) ? false : b
    };
    T.getClickInfo = function (a) {
        var b = {
            objId: '',
            objName: '',
            objHref: a.href ? a.href : '',
            objTagName: a.tagName ? a.tagName : '',
            objDdName: '',
            objDdSrc: '',
            regionIds: '',
            regionDdNames: '',
        };
        var c = T.getClickAttr(a);
        if (c) {
            b['objId'] = c['oi'] || '';
            b['objName'] = c['on'] || c['oi'] || '';
            b['objDdName'] = c['dn'] || '';
            b['objDdSrc'] = c['ds'] || '';
            if (c['oi']) b['regionIds'] = c['oi'] + ',';
            if (c['on']) b['regionIds'] = c['on'] + ',';
            if (c['dn']) b['regionDdNames'] = c['dn'] + ','
        }
        F(a).parents().each(function () {
            c = T.getClickAttr(this);
            if (!b['objHref'] && this.href) {
                b['objHref'] = this.href
            }
            if (c) {
                if (c['oi']) {
                    b['regionIds'] += c['oi'] + ','
                } else if (c['on']) {
                    b['regionIds'] += c['on'] + ','
                }
                if (c['dn']) b['regionDdNames'] += c['dn'] + ',';
                if (!b['objDdSrc'] && c['ds']) {
                    b['objDdSrc'] = c['ds']
                }
            }
        });
        return b
    };
    T.getMisc = function (e) {
        var a = 0, sHeight = 0;
        if (j.screen) {
            a = j.screen.width;
            sHeight = j.screen.height
        }
        var b = 0, dHeight = 0;
        if ((document.body) && (document.body.clientWidth)) {
            b = document.body.clientWidth
        }
        if ((document.body) && (document.body.scrollHeight)) {
            dHeight = document.body.scrollHeight
        }
        var c = '';
        if (e) {
            var d = (e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft))) || 'null';
            var f = (e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop))) || 'null';
            if (d != null && f != null) {
                c = d + ',' + f
            }
        }
        return a + ',' + sHeight + '|' + c + '|' + b + ',' + dHeight
    };
    T.lastRpm = function (a) {
        var b = '';
        a = a ? a : F.cookie({key: T.__ddc_rpm});
        if (a && (T.__referrer || T.referUrl()) != '') {
            b = a.slice(a.indexOf(T.__rpm_split) + 1)
        }
        return b
    };
    T.getPm = function (a) {
        var b = {};
        var c = T.__pm_attrs;
        var d = F.merge([a], F(a).parents());
        F.each(d, function (k, v) {
            for (var i = 0; i < c.length; i++) {
                if (F(v).attr(c[i]) !== null) {
                    if (c[i] == T.__pm_nested) {
                        b[c[i]] = b[c[i]] ? b[c[i]] : [];
                        b[c[i]].push(F(v).attr(c[i]).replace(/\s+/g, ''))
                    } else {
                        b[c[i]] = F(v).attr(c[i]).replace(/\s+/g, '')
                    }
                }
            }
        });
        return b
    };
    T.getClickPm = function (a) {
        var b = '';
        if (a) {
            var c = T.__pm_attrs.slice().reverse();
            for (var i = 0; i < c.length; i++) {
                if (a[c[i]]) {
                    if (F.isArray(a[c[i]])) {
                        b += a[c[i]].slice().reverse().join(',') + '.'
                    } else {
                        b += a[c[i]] + '.'
                    }
                } else {
                    b += '.'
                }
            }
        }
        return b
    };
    T.createRpm = function (a) {
        var b = '', lrpm = T.__rpm, rAttrs = T.__rpm_attrs;
        if (a) {
            for (var i = 0; i < rAttrs.length; i++) {
                if (a[rAttrs[i]]) {
                    if (F.isArray(a[rAttrs[i]])) {
                        b += a[rAttrs[i]].slice().reverse().join(',') + '.'
                    } else {
                        b += a[rAttrs[i]] + '.'
                    }
                } else {
                    b += '.'
                }
            }
            b += new Date().getTime()
        }
        return b
    };
    T.getSrc = function (a) {
        var b = '';
        if (a && a[T.__pm_src]) {
            b = a[T.__pm_src]
        }
        return b
    };
    T.collectData = function (b) {
        var c = {};
        if (b) {
            var d = F(b);
            if (d.attr(T.__pm_key)) {
                c[d.attr(T.__pm_key)] = d.attr(T.__pm_data)
            }
        } else {
            F("*[" + T.__pm_key + "]").each(function () {
                var a = F(this);
                if (a.attr(T.__pm_key)) {
                    if (typeof c[a.attr(T.__pm_key)] != 'undefined') {
                        c[a.attr(T.__pm_key)] += ', ' + a.attr(T.__pm_data)
                    } else {
                        c[a.attr(T.__pm_key)] = a.attr(T.__pm_data)
                    }
                }
            })
        }
        return F.isEmptyObject(c) ? '' : JSON.stringify(c)
    };
    T.server = function (a) {
        if (top.location == self.location) {
            var b = {
                ctr_id: '',
                ctr_ids: '',
                refer_url: encodeURIComponent(T.__referrer || T.referUrl()),
                out_refer: encodeURIComponent(T.__out_refer || T.outRefer()),
                url: encodeURIComponent(T.__url || T.currentUrl()),
                to_url: '',
                type: 1,
                title: encodeURIComponent(document.title),
                ctr_type: '',
                charset: document.charset,
                perm_id: T.__perm_id || T.permId(),
                udid: T.__udid || T.udId(),
                client_version: T.__client_version || T.clientVersion(),
                meta_data: encodeURIComponent(T.__meta_data),
                misc: '',
                ctr_dns: '',
                ctr_dn: '',
                ctr_src: '',
                cif: '',
                platform: T.__platform || T.platform(),
                page_id: T.__page_id || T.pageId(),
                data: '',
                website: T.topDomain()
            };
            a = F.extend(b, a);
            F.each(a, function (k, v) {
                if (v == '') {
                    delete a[k]
                }
            });
            F.ajax({
                url: T.serverUrl(), dataType: 'jsonp', data: a, jsonp: 'callback', success: function () {
                }
            })
        }
    };
    T.setBasic = function () {
        T.__url = T.currentUrl();
        T.__referrer = T.referUrl(T.__url);
        T.__out_refer = T.outRefer(T.__referrer);
        T.getMeta();
        T.__perm_id = T.permId();
        T.__udid = T.udId();
        T.__client_version = T.clientVersion();
        T.__page_id = T.pageId();
        T.__platform = T.platform();
        T.__rpm = T.lastRpm();
        T.__data = T.collectData()
    };
    T.trackLoad = function (a) {
        var b = {type: 1, misc: T.getMisc(), data: T.__data || T.collectData()};
        if (a) b.url = a;
        T.server(b)
    };
    T.trackClick = function () {
        F(document).bind('click', function (e) {
            e = e || j.event;
            var a = e.target || e.srcElement;
            if (!T.isClickElem(a) && a != document) {
                a = F(a).parentsUntil(function (o) {
                    if (T.isClickElem(o)) return true;
                    return false
                }).dom()
            }
            if (a && a.nodeType == 1) {
                var b = T.getClickInfo(a);
                var c = T.getPm(a);
                var d = T.createRpm(c);
                var f = T.__rpm;
                var g = f + T.__rpm_split + d;
                var h = new Date();
                h.setTime(h.getTime() + 24 * 60 * 60 * 1000);
                F.cookie({key: T.__ddc_rpm, value: g, expires: h, domain: T.topDomain()});
                T.__url = T.currentUrl();
                T.__perm_id = T.permId();
                T.__udid = T.udId();
                T.__client_version = T.clientVersion();
                T.__page_id = T.pageId();
                T.__platform = T.platform();
                T.__pm_click = T.getClickPm(c);
                var i = {
                    ctr_id: encodeURIComponent(b['objName']),
                    ctr_ids: encodeURIComponent(b['regionIds']),
                    to_url: encodeURIComponent(b['objHref']),
                    type: 2,
                    ctr_type: encodeURIComponent(b['objTagName']),
                    misc: T.getMisc(e),
                    ctr_dns: encodeURIComponent(b['regionDdNames']),
                    ctr_dn: encodeURIComponent(b['objDdName']),
                    ctr_src: encodeURIComponent(T.getSrc(c) || b['objDdSrc']),
                    cif: T.__pm_click,
                    data: T.collectData(a)
                };
                T.server(i)
            }
        })
    };
    T.trackSpa = function () {
        if (T.__meta_listen == 'hash') {
            if ("onhashchange" in j) {
                j.onhashchange = function (e) {
                    T.__url = e.newURL;
                    T.__referrer = e.oldURL;
                    var a = {type: 1, misc: T.getMisc(), data: T.__data || T.collectData()};
                    T.server(a)
                }
            }
        }
    };
    T.init = function () {
        T.setBasic();
        T.trackLoad();
        T.trackClick();
        T.trackSpa()
    };
    T.api = function () {
        this.trackPingPHP = function (a) {
            var b = T.referUrl(a);
            var c = {refer_url: b, url: a, type: 5};
            T.server(c)
        };
        this.trackRecommend = function (a) {
            var b = T.referUrl(a);
            var c = {refer_url: b, url: a, type: 6};
            T.server(c)
        };
        this.track_transfer = function (a) {
            var b = T.referUrl(a);
            if (a.indexOf('#dd_refer') == -1) {
                a += '#dd_refer=' + b
            }
            var c = {refer_url: b, url: a, type: 0};
            T.server(c);
            return a
        }
    };
    j.DDT = T;
    DDT.Api = new T.api();
    DDT.init()
})(window);
var DDE;
(function (j, l) {
    var F = DDF;
    var T = DDT;
    var E = {
        __expose_attr: 'ddt-expose',
        __server_url: 'databack.dangdang.com/dde.php',
        __doms: [],
        __doms_all: [],
        __doms_attr: {},
        __doms_relative: {},
        __dom_time: 500,
        __time: 600,
        __epm: {},
        __error_count: 0,
        __max_error_count: 10,
        __epm_attrs: ['ddt-page', 'ddt-area', 'ddt-pit', 'ddt-src'],
        __dom_pid: '',
        __loop_pid: ''
    };
    E.attrReg = /^attr(\[(.*)\])?/;
    E.relativeReg = /^relative(\[(.*)\])?/;
    E.serverUrl = function () {
        var a = T.domainProtocol();
        E.__server_url = a + '://' + E.__server_url;
        return E.__server_url
    };
    E.isVisible = function (a) {
        var b = F(a);
        if (!b.location()) return false;
        var c = b.location().right;
        var d = b.location().bottom;
        var e = b.height();
        var f = b.width();
        var g = F(j).height();
        var h = F(j).width();
        if (d >= (e / 2) && d <= g + (e / 2)) {
            if (c >= (f / 2) && c <= (f / 2) + h) {
                return true
            }
        }
        return false
    };
    E.getDoms = function () {
        var d = F("*[" + E.__expose_attr + "]");
        if (d.length > 0) {
            F.merge(E.__doms, d.selector);
            d.each(function (k, a) {
                var b = E.getEpm(a);
                var c = E.__doms_all.push(a) - 1;
                if (c >= 0) E.__epm[c] = b;
                E.__doms_attr[c] = F(a).attr(E.__expose_attr)
            });
            d.attr(E.__expose_attr, null)
        }
    };
    E.getEpm = function (a) {
        var b = T.getPm(a), attrs = E.__epm_attrs, epm = '';
        if (b) {
            for (var i = 0; i < attrs.length; i++) {
                if (b[attrs[i]]) {
                    if (F.isArray(b[attrs[i]])) {
                        epm += b[attrs[i]].slice().reverse().join(',') + '.'
                    } else {
                        epm += b[attrs[i]] + '.'
                    }
                } else {
                    epm += '.'
                }
            }
        }
        return epm.substring(0, epm.length - 1)
    };
    E.isExpose = function (a) {
        var b = F.inArray(a, E.__doms_all);
        if (E.isVisible(a) && b >= 0) {
            var c = E.__doms_attr[b];
            if (c == "on") {
                return true
            } else if (E.attrReg.test(c)) {
                return E.byAttr(a, c)
            } else if (E.relativeReg.test(c)) {
                return E.byRelative(a, c)
            } else {
                return false
            }
        }
        return false
    };
    E.byAttr = function (a, b) {
        var c = 0, attr, $el = F(a);
        var d = E.attrReg.exec(b);
        if (!d && !d[2]) return false;
        var e = d[2].split(",");
        for (var i = 0, len = e.length; i < len; i++) {
            attr = e[i].split("=");
            if ($el.css(attr[0]) == attr[1]) {
                c++
            }
        }
        return (c == e.length) ? true : false
    };
    E.byRelative = function (a, b) {
        var c = E.relativeReg.exec(b);
        var d = F(a);
        var e;
        if (c && c[1]) {
            if (E.__doms_relative[c[1]]) {
                e = E.__doms_relative[c[1]]
            } else {
                e = F(a).parentsUntil("*" + c[1]);
                E.__doms_relative[c[1]] = e
            }
        } else {
            e = d.parent()
        }
        if (e) {
            var f = d.location().left, _pLeft = e.location().left;
            var g = d.location().top, _pTop = e.location().top;
            var h = d.height(), _domWidth = d.width();
            var i = e.height(), _pWidth = e.width();
            if (f + (_domWidth / 2) >= _pLeft && f + (_domWidth / 2) - _pLeft <= _pWidth) {
                if (g + (h / 2) >= _pTop && g + (h / 2) - _pTop <= i) {
                    return true
                }
            }
        }
        return false
    };
    E.server = function (a) {
        if (top.location == self.location) {
            var b = {
                platform: T.__platform || T.platform(),
                type: 3,
                url: encodeURIComponent(T.__url || T.currentUrl()),
                charset: document.charset,
                perm_id: T.__perm_id || T.permId(),
                page_id: T.__page_id || T.pageId(),
                website: T.topDomain(),
                expose: '',
            };
            a = F.extend(b, a);
            F.ajax({
                url: E.__server_url, dataType: 'jsonp', data: a, jsonp: 'callback', error: function () {
                    E.__error_count++
                }
            });
            if (E.__error_count >= E.__max_error_count) {
                clearInterval(E.__dom_pid);
                clearInterval(E.__loop_pid)
            }
        }
    };
    E.trackExpose = function () {
        var c = {}, exposeDoms = [], expose = [];
        F.each(E.__doms, function (k, a) {
            if (E.isExpose(a)) {
                var b = F.inArray(a, E.__doms_all);
                if (b >= 0 && E.__epm[b]) {
                    expose.push(E.__epm[b])
                }
                exposeDoms.push(a)
            }
        });
        for (var i in exposeDoms) {
            E.__doms.splice(F.inArray(exposeDoms[i], E.__doms), 1)
        }
        if (expose.length > 0) {
            var d = F.chunkArray(expose, 10);
            F.each(d, function (k, a) {
                c['expose'] = encodeURIComponent(JSON.stringify(a));
                E.server(c)
            })
        }
    };
    E.loop = function () {
        E.getDoms();
        E.trackExpose();
        E.__dom_pid = j.setInterval(function () {
            E.getDoms()
        }, E.__dom_time);
        E.__loop_pid = j.setInterval(function () {
            E.trackExpose()
        }, E.__time)
    };
    E.init = function () {
        E.serverUrl();
        E.loop()
    };
    j.DDE = E;
    DDE.init()
})(window);
(function (e, f) {
    var F = DDF;
    var T = DDT;
    var L = {
        __listen_attr: 'ddt-listen',
        __server_url: 'databack.dangdang.com/ddl.php',
        __time: 500,
        __error_count: 0,
        __max_error_count: 10,
        __loop_pid: '',
        __data: ''
    };
    L.serverUrl = function () {
        var a = T.domainProtocol();
        L.__server_url = a + '://' + L.__server_url;
        return L.__server_url
    };
    L.server = function (a) {
        if (top.location == self.location) {
            var b = {
                platform: T.__platform || T.platform(),
                type: 4,
                url: encodeURIComponent(T.__url || T.currentUrl()),
                charset: document.charset,
                perm_id: T.__perm_id || T.permId(),
                page_id: T.__page_id || T.pageId(),
                website: T.topDomain(),
                data: ''
            };
            a = F.extend(b, a);
            F.ajax({
                url: L.__server_url, dataType: 'jsonp', data: a, jsonp: 'callback', error: function () {
                    L.__error_count++
                }
            });
            if (L.__error_count >= L.__max_error_count) {
                clearInterval(L.__loop_pid)
            }
        }
    };
    L.listen = function () {
        var b = F("*[" + L.__listen_attr + "]");
        if (b.length > 0) {
            var c = {};
            b.each(function () {
                var a = F(this);
                if (a.attr(T.__pm_key)) {
                    if (typeof c[a.attr(T.__pm_key)] != 'undefined') {
                        c[a.attr(T.__pm_key)] += ', ' + a.attr(T.__pm_data)
                    } else {
                        c[a.attr(T.__pm_key)] = a.attr(T.__pm_data)
                    }
                }
            });
            if (!F.isEmptyObject(c) && JSON.stringify(c) != L.__data) {
                var d = {};
                d.data = JSON.stringify(c);
                L.server(d)
            }
            L.__data = JSON.stringify(c)
        }
    };
    L.loop = function () {
        L.__loop_pid = e.setInterval(function () {
            L.listen()
        }, L.__time)
    };
    L.init = function () {
        L.serverUrl();
        L.loop()
    };
    L.init()
})(window);