module main

import tomap as tm

struct Data {
	a int
	b f32
	c []string
	d SubData1
	// e ?SubData2
}

struct SubData1 {
	a ?u32
	// b []?int
}

struct SubData2 {
	a f32
}

fn main() {
	d := Data{
		a: 2
		b: 2.2
		c: ['qwe', 'wer']
		d: SubData1{
			a: none
			// b: [?int(none), ?int(none)]
		}
	}
	m := tm.to_map(d)!
	m.prettyprint('')
	d1 := tm.from_map[Data](m)!
	println(d1)
}
