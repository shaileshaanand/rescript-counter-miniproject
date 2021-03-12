@val external document: {..} = "document"

let count_tag = document["querySelector"]("#count")

let count = ref(0)

let change_count = (increment: bool) => {
  // let inner = count_tag["innerHTML"]
  // let count_raw = inner->Js.String.slice(~from=9, ~to_=Js.String.length(inner))
  // let count = if count_raw == "zero" {
  // 0
  // } else {
  // switch Belt.Int.fromString(count_raw) {
  // | Some(count) => count
  // | _ => 0
  // }
  // }
  if increment {
    count := count.contents + 1
  } else {
    count := count.contents - 1
  }

  count_tag["innerHTML"] = if count.contents == 0 {
    "Count is zero"
  } else {
    `Count is ${Belt.Int.toString(count.contents)}`
  }
  if count.contents == 0 {
    count_tag["className"] = "count count-zero"
  } else if count.contents == -1 {
    count_tag["className"] = "count count-negative"
  } else if count.contents == 1 {
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
