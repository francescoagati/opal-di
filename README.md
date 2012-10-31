A dependency injection for opal ruby inspired to pimple.

```

  cont = OpalDI::Container.new
  
  cont.set(:name) { |cnt| "mario" }
  cont.set(:surname) {|cnt| "rossi" }
  cont.set(:label) {|cnt| "#{cont.get(:name)} #{cont.get(:surname)}"  }
  cont.get(:label).should == "mario rossi"


```

or use array syntax for read access

```
  cont[:label].should == "mario rossi"
```