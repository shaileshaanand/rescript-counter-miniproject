// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Int from "bs-platform/lib/es6/belt_Int.js";
import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";

var count_tag = document.querySelector("#count");

function change_count(increment) {
  var inner = count_tag.innerHTML;
  var count_raw = inner.slice(9, inner.length);
  var count;
  if (count_raw === "zero") {
    count = 0;
  } else {
    var count$1 = Belt_Int.fromString(count_raw);
    count = count$1 !== undefined ? count$1 : 0;
  }
  var new_count = increment ? count + 1 | 0 : count - 1 | 0;
  count_tag.innerHTML = new_count === 0 ? "Count is zero" : "Count is " + String(new_count);
  if (new_count === 0) {
    count_tag.className = "count count-zero";
    return ;
  } else if (new_count === -1) {
    count_tag.className = "count count-negative";
    return ;
  } else if (new_count === 1) {
    count_tag.className = "count count-positive";
    return ;
  } else {
    return ;
  }
}

Belt_Array.forEach(document.querySelectorAll("button"), (function (button) {
        var match = button.id;
        switch (match) {
          case "minus-one" :
              return button.addEventListener("click", (function (param) {
                            return change_count(false);
                          }));
          case "plus-one" :
              return button.addEventListener("click", (function (param) {
                            return change_count(true);
                          }));
          default:
            console.log("err");
            return ;
        }
      }));

export {
  count_tag ,
  change_count ,
  
}
/* count_tag Not a pure module */
