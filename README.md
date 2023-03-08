# tomap

Encode any V data structure to a map.

### Example

```v
import tomap as tm

struct Data {
	a int
	b ?f32
	c []string
}

fn main() {
	d := Data{2, 2.2, ['qwe', 'wer', 'ert']}
	m := tm.to_map(d)!
	println(m)
	d1 := tm.from_map[Data](m)!
	println(d1)
}
```

### License

MIT