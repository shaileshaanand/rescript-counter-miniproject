@val external document: {..} = "document"

let count_tag = document["querySelector"]("#count")

let change_count = (increment: bool) => {
  let inner = count_tag["innerHTML"]
  let count_raw = inner->Js.String.slice(~from=9, ~to_=Js.String.length(inner))
  let count = if count_raw == "zero" {
    0
  } else {
    switch Belt.Int.fromString(count_raw) {
    | Some(count) => count
    | _ => 0
    }
  }
  let new_count = if increment {
    count + 1
  } else {
    count - 1
  }

  count_tag["innerHTML"] = if new_count == 0 {
    "Count is zero"
  } else {
    `Count is ${Belt.Int.toString(new_count)}`
  }
  if new_count == 0 {
    count_tag["className"] = "count count-zero"
  } else if new_count == -1 {
    count_tag["className"] = "count count-negative"
  } else if new_count == 1 {
    count_tag["className"] = "count count-positive"
  }
}

document["querySelectorAll"]("button")->Belt.Array.forEach(button => {
  switch button["id"] {
  | "plus-one" =>
    button["addEventListener"]("click", _ => {
      change_count(true)
    })
  | "minus-one" =>
    button["addEventListener"]("click", _ => {
      change_count(false)
    })
  | _ => Js.log("err")
  }
})
