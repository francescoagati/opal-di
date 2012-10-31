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

    def get(arg)
      if arg.class == Array
        arg.map {|name| real_get(name) }
      else
        real_get(arg)
      end
    end

    def []=(name,blk)
      set(name,&blk)
    end

    alias [] get

    protected

    def real_get(name)

      if @registry[name]
        @registry[name][:blk].call(self)
      else
        @shared[name][:blk] = @shared[name][:blk].call(self) if @shared[name][:blk].class == Proc
        @shared[name][:blk]
      end

    end


  end

end
