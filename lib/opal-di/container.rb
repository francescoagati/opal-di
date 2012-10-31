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
    
    #alias []= set
    alias [] get
    
    
  end
  
end