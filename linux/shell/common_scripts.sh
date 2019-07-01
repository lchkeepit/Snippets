# Loop boot function.
function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

# Find common usage.
find . -mindepth 2 -maxdepth 3 -type d -name "*name*"
