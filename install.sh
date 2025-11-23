REQ_FILE="requirements.txt"

command -v python3 >/dev/null 2>&1 || exit 1
command -v pip3 >/dev/null 2>&1 || exit 1

while IFS= read -r pkg || [ -n "$pkg" ]; do
    python3 -c "import $pkg" >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        pip3 install "$pkg" >/dev/null 2>&1
    fi
done < "$REQ_FILE"