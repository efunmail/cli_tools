// https://cuelang.org/docs/tour/expressions/dynamic-fields/

import (
	"list"
	"strings"
)

a:       "foo"
b:       "bar"
(a + b): "foobar"

#ObjectStruct: {
	name: string
	age:  int & >20
	foo:  string
}

// An input schema
#Input: {
	count: int
	msg:   string
}

// An output schema
#Output: {
	val: string
}

// https://cuetorials.com/patterns/functions/
#MyFunction: {
	// IN="in": #Input
	IN:  #Input
	OUT: #Output

	// intermediate fields
	_upper: strings.ToUpper(IN.msg)
	_msg: strings.Join(list.Repeat([_upper], IN.count), " ")

	// set output
	OUT: val: _msg
}

#WipStruct: {
	num: int
	txt: string
	result: (#MyFunction & {in: {msg: txt, count: num}}).OUT.val
}

#RecStruct: {
	num_default: int
	wip_list: [...#WipStruct]
}

s: REC={
	// s: REC=#RecStruct & {
	//"\(a)_and_\(b)": "foobar"

	// Valid references using a selector and an index expression // s.foo_and_bar  X["foo_and_bar"]
	// FooAndBar: REC.foo_and_bar

	// object: {
	// 	name: "Ami"
	// 	age:  30
	// 	foo:  X.foo_and_bar
	// }
	// object: #ObjectStruct & {
	// 	name: "Ami"
	// 	age:  30
	// 	// foo:  REC.foo_and_bar
	// }

	// result: (#MyFunction & {IN: {msg: "ra!", count: 3}}).OUT.val

	num_default: 4
	wip_list: [...{
		num: *REC.num_default | int // OKAY:
		//   ================
		txt: string
		result: (#MyFunction & {IN: {msg: txt, count: num}}).OUT.val
	}]
}

// Data VALUES...
s: wip_list: [
	{num: 2, txt: "Hiya."},
	// {num: 3, txt: "Bye."},
	{txt: "Bye."},
]
