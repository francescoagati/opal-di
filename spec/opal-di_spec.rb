describe OpalDI do

  it "should exist class OpalDI" do
    OpalDI.should_not nil
  end


  describe OpalDI::Container do

    it "exists Container" do
      OpalDI::Container.should_not nil
    end

    describe "check instance" do
      before { @cont = OpalDI::Container.new }

      it "exists instance" do
        @cont.should_not nil
      end

      it "set and get a service" do
        @cont.set(:name) { |cnt| "mario" }
        @cont.get(:name).should == "mario"
      end

      it "set and get multi services" do

        @cont.set(:name) { |cnt| "mario" }
        @cont.set(:surname) {|cnt| "rossi" }
        @cont.set(:label) {|cnt| "#{@cont.get(:name)} #{@cont.get(:surname)}"  }
        @cont.get(:label).should == "mario rossi"

      end

      it "use array sintax" do

        @cont.set(:name) { |cnt| "mario" }
        @cont.set(:surname) {|cnt| "rossi" }
        @cont.set(:label) {|cnt| "#{@cont[:name]} #{@cont[:surname]}"  }
        @cont[:label].should == "mario rossi"

      end

      it "array sintax for getter" do

        @cont[:name]= proc { |cnt| "mario" }
        @cont[:surname]= ->(cnt) { "rossi" }
        @cont[:label]= ->(cnt)  {"#{@cont[:name]} #{@cont[:surname]}"  }
        @cont[:label].should == "mario rossi"

      end

      it "check for services shared" do

        cnt=0
        Accumulator=Class.new do
          
          define_method :initialize do
            cnt=cnt+1
          end

          define_method :get do
            cnt
          end

        end

        @cont.set(:accumulator, :shared => true) {|cnt|  Accumulator.new }

        @cont[:accumulator].get
        @cont[:accumulator].get
        @cont[:accumulator].get
        @cont[:accumulator].get
        @cont[:accumulator].get
        @cont[:accumulator].get
        @cont[:accumulator].get
        
        @cont[:accumulator].get.should == 1


      end

    end

  end


end
