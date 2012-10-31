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
      Container_prototype.registry = nil;

      Container_prototype.$initialize = function() {
        
        return this.registry = __hash2([], {});
      };

      Container_prototype.$set = TMP_1 = function(name) {
        var __context, blk;
        blk = TMP_1._p || nil, __context = blk._s, TMP_1._p = null;
        
        return this.registry['$[]='](name, blk);
      };

      Container_prototype.$get = function(name) {
        
        return this.registry['$[]'](name).$call();
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
