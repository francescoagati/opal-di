A dependency injection for opal ruby inspired to pimple.

```

  cont = OpalDI::Container.new
  
  cont.set(:name) { |cnt| "mario" }
  cont.set(:surname) {|cnt| "rossi" }
  cont.set(:label) {|cnt| "#{cont.get(:name)} #{cont.get(:surname)}"  }
  cont.get(:label).should == "mario rossi"


```

or use array syntax for  access

```
  cont[:name]= proc { |cnt| "mario" }
  cont[:surname]= ->(cnt) { "rossi" }
  cont[:label]= ->(cnt)  {"#{cont[:name]} #{cont[:surname]}"  }
  cont[:label].should == "mario rossi"

```