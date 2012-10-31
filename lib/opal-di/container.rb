module OpalDI
  
  class Container
    
    def initialize
      @registry={}
    end
    
    def set(name,&blk)
      @registry[name]=blk #.call(self)
    end
    
    def get(name)
      @registry[name].call
    end
    
    def []=(name,blk)
      set(name,&blk)
    end
    
    alias [] get
    
    
  end
  
end