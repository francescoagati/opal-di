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

        cnt2=0
        Accumulator2=Class.new do
          
          define_method :initialize do
            cnt2=cnt2+1
          end

          define_method :get do
            cnt2
          end

        end


        @cont.set(:accumulator, :shared => true) {|cnt|  Accumulator.new }
        @cont.set(:accumulator_notshared) {|cnt|  Accumulator2.new }

        (0...8).each { @cont[:accumulator].get }  
        (0...8).each { @cont[:accumulator_notshared].get }        
        @cont[:accumulator].get.should == 1
        @cont[:accumulator_notshared].get.should == 9


      end

    end

  end


end
