import os

fn walk_func(path string) {
	if !path.contains("..") && path != "." {
		if os.is_dir(path) {
			os.walk(path, walk_func)
		}else{
			if path.ends_with(".prefab") {
				os.mv(path, path.replace(".prefab", "PRE-EDITED.prefab")) or { panic(err) }
			}
		}
	}
}

fn walk_func2(path string) {
	if !path.contains("..") && path != "." {
		if os.is_dir(path) {
			os.walk(path, walk_func2)
		}else{
			if path.ends_with(".prefab") {
				os.mv(path, path.replace("PRE-EDITED", "")) or { panic(err) }
			}
		}
	}
}

fn main() {
	println("Choose mode:\n(1) Current directory\n(2) Custom directory")
	mut choice1 := os.get_line()
	if choice1 == "1" {
		next(".")
	} else if choice1 == "2" {
		println("Enter path: ")
		mut dirname := os.get_line()
		next(dirname)
	} else {
		println("Invalid choice")
	}
}

fn next(p string) {
	println("Choose mode:\n(1) Rename\n(2) Revert renames")
	mut choice2 := os.get_line()
	if choice2 == "1" {
		os.walk(p, walk_func)
	} else if choice2 == "2" {
		os.walk(p, walk_func2)
	} else {
		println("Invalid choice")
	}
}