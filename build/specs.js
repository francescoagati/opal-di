// spec/opal-di_spec.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice;
  var __a, __b;
  return (__b = self, __b.$describe._p = (__a = function() {

    var __a, __b, __c;
    
    (__b = this, __b.$it._p = (__a = function() {

      
      
      return __scope.OpalDI.$should_not(nil)
    }, __a._s = this, __a), __b.$it("should exist class OpalDI"));
    return (__c = this, __c.$describe._p = (__a = function() {

      var __a, __b, __c;
      
      (__b = this, __b.$it._p = (__a = function() {

        
        
        return (__scope.OpalDI)._scope.Container.$should_not(nil)
      }, __a._s = this, __a), __b.$it("exists Container"));
      return (__c = this, __c.$describe._p = (__a = function() {

        var __a, __b, __c, __d, __e, __f;
        
        (__b = this, __b.$before._p = (__a = function() {

          
          
          return this.cont = (__scope.OpalDI)._scope.Container.$new()
        }, __a._s = this, __a), __b.$before());
        (__c = this, __c.$it._p = (__a = function() {

          
          if (this.cont == null) this.cont = nil;

          
          return this.cont.$should_not(nil)
        }, __a._s = this, __a), __c.$it("exists instance"));
        (__d = this, __d.$it._p = (__a = function() {

          var __a, __b;
          if (this.cont == null) this.cont = nil;

          
          (__b = this.cont, __b.$set._p = (__a = function(cnt) {

            
            if (cnt == null) cnt = nil;

            return "mario"
          }, __a._s = this, __a), __b.$set("name"));
          return this.cont.$get("name").$should()['$==']("mario");
        }, __a._s = this, __a), __d.$it("set and get a service"));
        (__e = this, __e.$it._p = (__a = function() {

          var __a, __b, __c, __d;
          if (this.cont == null) this.cont = nil;

          
          (__b = this.cont, __b.$set._p = (__a = function(cnt) {

            
            if (cnt == null) cnt = nil;

            return "mario"
          }, __a._s = this, __a), __b.$set("name"));
          (__c = this.cont, __c.$set._p = (__a = function(cnt) {

            
            if (cnt == null) cnt = nil;

            return "rossi"
          }, __a._s = this, __a), __c.$set("surname"));
          (__d = this.cont, __d.$set._p = (__a = function(cnt) {

            
            if (this.cont == null) this.cont = nil;

            if (cnt == null) cnt = nil;

            return "" + (this.cont.$get("name")) + " " + (this.cont.$get("surname"))
          }, __a._s = this, __a), __d.$set("label"));
          return this.cont.$get("label").$should()['$==']("mario rossi");
        }, __a._s = this, __a), __e.$it("set and get multi services"));
        return (__f = this, __f.$it._p = (__a = function() {

          var __a, __b, __c, __d;
          if (this.cont == null) this.cont = nil;

          
          (__b = this.cont, __b.$set._p = (__a = function(cnt) {

            
            if (cnt == null) cnt = nil;

            return "mario"
          }, __a._s = this, __a), __b.$set("name"));
          (__c = this.cont, __c.$set._p = (__a = function(cnt) {

            
            if (cnt == null) cnt = nil;

            return "rossi"
          }, __a._s = this, __a), __c.$set("surname"));
          (__d = this.cont, __d.$set._p = (__a = function(cnt) {

            
            if (this.cont == null) this.cont = nil;

            if (cnt == null) cnt = nil;

            return "" + (this.cont['$[]']("name")) + " " + (this.cont['$[]']("surname"))
          }, __a._s = this, __a), __d.$set("label"));
          return this.cont['$[]']("label").$should()['$==']("mario rossi");
        }, __a._s = this, __a), __f.$it("use array sintax"));
      }, __a._s = this, __a), __c.$describe("check instance"));
    }, __a._s = this, __a), __c.$describe((__scope.OpalDI)._scope.Container));
  }, __a._s = self, __a), __b.$describe(__scope.OpalDI))
})();
// spec/spec_helper.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice;
  
  return (__scope.OpalSpec)._scope.Runner.$autorun()
})();
