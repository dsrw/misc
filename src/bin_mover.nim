import std / [os]

# Workaround for:
# https://youtrack.jetbrains.com/issue/NIM-43#focus=Comments-27-5469609.0-0
# Add to run configuration to execute after build

for file in walk_pattern(get_home_dir() / ".cache/nim/jb_*/*_d/*_*.json"):
  let (path, name, _) = file.split_file
  let base_name = name[0..^42]
  try:
    move_file(path / name, path / base_name)
  except OSError:
    discard
