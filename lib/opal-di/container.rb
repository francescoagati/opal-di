module OpalDI

  class Container

    def initialize
      @registry={}
      @shared={}
    end

    def set(name,opt = {},&blk)

      register= opt[:shared] == true ?  @shared :  @registry
      register[name]={ blk:blk }

    end

    def get(name)
      if @registry[name]
        @registry[name][:blk].call(self)
      else
        @shared[name][:blk] = @shared[name][:blk].call(self) if @shared[name][:blk].class == Proc
        @shared[name][:blk]
      end
    end

    def []=(name,blk)
      set(name,&blk)
    end

    alias [] get


  end

end
