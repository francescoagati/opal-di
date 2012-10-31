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

    end

  end


end
