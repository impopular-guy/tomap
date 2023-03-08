module tomap

pub fn (m map[string]Any) prettyprint(tab string) {
	println('{')
	for k, v in m {
		print('${tab}    ${k}: ')
		match v {
			Null { print(v) }
			[]Any { print(v) }
			map[string]Any { v.prettyprint(tab + '    ') }
			else { print(v) }
		}
		println('')
	}
	println('${tab}}')
}
