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


      it "return multi get" do
        @cont[:name]= proc { |cnt| "mario" }
        @cont[:surname]= ->(cnt) { "rossi" }
        @cont[:label]= ->(cnt)  {"#{@cont[:name]} #{@cont[:surname]}"  }

        name,surname,label = @cont.get([:name,:surname,:label])
        name.should == 'mario'
        surname.should == 'rossi'
        label.should  == 'mario rossi'

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


    #describe "merging" do

    #  describe do
    #    @cont1=OpalDI::Container.new
    #    @cont2=OpalDI::Container.new

    #    @cont1.set(:a) { 1 }
    #    @cont1.set(:b) { 2 }
    #    @cont2.set(:c) { 3 }


    #    end

      #it "should merge 2 container in a new" do
      #  cont3=@cont1 + @cont2
      #  cont3.get(:a).should == 1
      #  cont3.get(:b).should == 2
      #  cont3.get(:c).should == 3

      #end

    #end

  end


end
