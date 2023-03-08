module tomap

pub type Any = int | string

pub fn to_map[T](data T) !map[string]Any {
	mut res := map[string]Any{}
	return res
}

pub fn from_map[T](data map[string]Any) !T {
	mut res := T{}
	return res
}
