Various data-bind options based on values, events and :
* value
* checked
* keyup
* readonly
* disabled
* 

Can perform a foreach for the:

  <select data-bind="value: {$value}; foreach: {$collection}; {$disabledBinding}">
  
or...

  <select data-bind="value: selected; foreach: categories">
    <option data-bind="attr: {value: id()}; text: name(); selected: isSelected()" selected="selected">
    </option>
  </select>
  
