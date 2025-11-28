#!/bin/sh

OUTPUT="index.html"

echo "Generating index…"

cat > $OUTPUT <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Index of /</title>
<style>
  body {
    font-family: "JetBrains Mono", "Fira Code", monospace;
    background: #0c0c0d;
    color: #eaeaea;
    padding: 40px;
  }
  h1 {
    font-size: 24px;
    margin-bottom: 20px;
    font-weight: 600;
    color: #fff;
  }
  ul {
    list-style: none;
    padding-left: 0;
  }
  li {
    margin: 8px 0;
  }
  a {
    text-decoration: none;
    color: #cfcfcf;
    transition: 0.15s;
  }
  a:hover {
    color: #fff;
    text-shadow: 0 0 6px #ffffff70;
  }
</style>
</head>
<body>
<h1>Index</h1>
<ul>
EOF

# List items except hidden and ignored
for item in *; do
  case "$item" in
    .*|node_modules|scripts)
      continue
      ;;
    *)
      echo "<li><a href=\"./$item\">$item</a></li>" >> $OUTPUT
      ;;
  esac
done

cat >> $OUTPUT <<EOF
</ul>
</body>
</html>
EOF

echo "✔ index.html generated"
