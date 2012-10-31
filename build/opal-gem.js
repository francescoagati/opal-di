// lib/opal-di/container.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice, __module = __opal.module, __klass = __opal.klass, __hash2 = __opal.hash2;
  
  return (function(__base){
    function OpalDI() {};
    OpalDI = __module(__base, "OpalDI", OpalDI);
    var OpalDI_prototype = OpalDI.prototype, __scope = OpalDI._scope;

    (function(__base, __super){
      function Container() {};
      Container = __klass(__base, __super, "Container", Container);

      var Container_prototype = Container.prototype, __scope = Container._scope, TMP_1;
      Container_prototype.shared = Container_prototype.registry = nil;

      Container_prototype.$initialize = function() {
        
        this.registry = __hash2([], {});
        return this.shared = __hash2([], {});
      };

      Container_prototype.$set = TMP_1 = function(name, opt) {
        var __context, blk;
        blk = TMP_1._p || nil, __context = blk._s, TMP_1._p = null;
        if (opt == null) {
          opt = __hash2([], {})
        }
        if (opt['$[]']("shared")['$=='](true)) {
          return this.shared['$[]='](name, __hash2(["blk"], {"blk": blk}))
          } else {
          return this.registry['$[]='](name, __hash2(["blk"], {"blk": blk}))
        };
      };

      Container_prototype.$get = function(name) {
        var __a;
        if ((__a = this.registry['$[]'](name)) !== false && __a !== nil) {
          return this.registry['$[]'](name)['$[]']("blk").$call(this)
          } else {
          if (this.shared['$[]'](name)['$[]']("blk").$class()['$=='](__scope.Proc)) {
            this.shared['$[]'](name)['$[]=']("blk", this.shared['$[]'](name)['$[]']("blk").$call(this))
          };
          return this.shared['$[]'](name)['$[]']("blk");
        };
      };

      Container_prototype['$[]='] = function(name, blk) {
        var __a;
        return (__a = this, __a.$set._p = blk.$to_proc(), __a.$set(name));
      };

      return Container_prototype['$[]'] = Container_prototype.$get;
    })(OpalDI, null)
    
  })(self)
})();
// lib/opal-di.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice, __module = __opal.module;
  
  return (function(__base){
    function OpalDI() {};
    OpalDI = __module(__base, "OpalDI", OpalDI);
    var OpalDI_prototype = OpalDI.prototype, __scope = OpalDI._scope;

    nil
    
  })(self)
})();
