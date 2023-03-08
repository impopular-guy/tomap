module tomap

pub type Any = Null
	| []Any
	| bool
	| f32
	| f64
	| i16
	| i64
	| i8
	| int
	| map[string]Any
	| rune
	| string
	| u16
	| u32
	| u64
	| u8

// [bool, f32 	, f64 	, i16 	, i64 	, i8 	, int 	, rune 	, string 	, u16 	, u32 	, u64 	, u8]

pub struct Null {}

pub fn to_map[T](data T) !map[string]Any {
	$if T is $Struct {
		return struct_to_map[T](data)!
	} $else $if T is $Array {
		return array_to_map[T](data)!
	} $else $if T is $Map {
		return map_to_map[T](data)!
	} $else {
		return error('Failed to encode `${typeof(data).name}`. Please create an issue.')
	}
}

fn struct_to_map[T](data T) !map[string]Any {
	mut res := map[string]Any{}
	$for field in T.fields {
		$if field.is_option {
			if data.$(field.name).str() == 'Option(error: none)' {
				res[field.name] = Any(Null{})
			} else {
				$if field.typ is ?bool {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?u8 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?u16 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?u32 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?u64 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?i8 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?i16 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?int {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?i64 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?f32 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?f64 {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?rune {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.typ is ?string {
					res[field.name] = Any(data.$(field.name))
				} $else $if field.is_struct {
					x := data.$(field.name) ?
					res[field.name] = struct_to_map(x)!
				} $else $if field.is_array {
					res[field.name] = array_to_map(data.$(field.name))!
					// } $else $if field is $Map {
					// res[field.name] = struct_to_map(data.$(field.name))!
				} $else {
					return error('struct: Failed to encode `${typeof(data).name}.${field.name}`. Please create an issue.')
				}
			}
		} $else $if field.typ is bool {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is u8 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is u16 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is u32 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is u64 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is i8 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is i16 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is int {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is i64 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is f32 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is f64 {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is rune {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.typ is string {
			res[field.name] = Any(data.$(field.name))
		} $else $if field.is_struct {
			res[field.name] = struct_to_map(data.$(field.name))!
		} $else $if field.is_array {
			res[field.name] = array_to_map(data.$(field.name))!
			// } $else $if field is $Map {
			// res[field.name] = struct_to_map(data.$(field.name))!
		} $else {
			return error('struct: Failed to encode field `${typeof(data).name}.${field.name}`. Please create an issue.')
		}
	}
	return res
}

fn array_to_map[T](arr T) ![]Any {
	mut res := []Any{}
	if arr.len == 0 {
		return res
	}
	$if T is []bool {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []u8 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []u16 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []u32 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []u64 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []i8 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []i16 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []int {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []i64 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []f32 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []f64 {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []rune {
		for x in arr {
			res << Any(x)
		}
	} $else $if T is []string {
		for x in arr {
			res << Any(x)
		}
	} $else {
		x := arr[0]
		$if x is $Struct {
			for a in arr {
				res << struct_to_map(a)!
			}
		} $else {
			return error('array: Failed to encode `${typeof(arr).name}`. Please create an issue.')
		}
	}
	return res
}

pub fn from_map[T](data map[string]Any) !T {
	mut res := T{}
	return res
}
