module main

import tomap as tm

struct Data {
	a int
	b f32
	c []string
	d SubData1
	e []SubData2
}

struct SubData1 {
	a u32
	// b [][]int
}

struct SubData2 {
	a f32
}

fn main() {
	sd2 := SubData2{123.234}
	d := Data{
		a: 2
		b: 2.2
		c: ['qwe', 'wer']
		d: SubData1{
			a: 23
			// b: [][]int{len: 2, init: []int{len: 2, init: 2}}
		}
		e: []SubData2{len: 1, init: sd2}
	}
	m := tm.to_map(d)!
	println(d)
	m.prettyprint('')
	// md := tm.from_map[Data](m)!
	// println(md)
}
