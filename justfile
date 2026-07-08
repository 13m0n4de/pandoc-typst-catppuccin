example_md := "examples/test.md"
example_dir := "examples"
pandoc_dir := "~/.local/share/pandoc"

flavors := "latte frappe macchiato mocha"

default:
    just --list

install:
    mkdir -p {{pandoc_dir}}/templates {{pandoc_dir}}/defaults
    cp catppuccin.typ {{pandoc_dir}}/templates/
    cp catppuccin.yaml {{pandoc_dir}}/defaults/

_typst flavor:
    pandoc {{example_md}} -o {{example_dir}}/{{flavor}}.typ \
        --template=catppuccin.typ \
        --resource-path={{example_dir}} \
        -V flavor={{flavor}}

_example flavor: (_typst flavor)
    typst compile {{example_dir}}/{{flavor}}.typ {{example_dir}}/{{flavor}}.pdf
    rm {{example_dir}}/{{flavor}}.typ

_preview flavor: (_typst flavor)
    typst compile --format png --ppi 250 --pages 1 {{example_dir}}/{{flavor}}.typ {{example_dir}}/{{flavor}}.png
    oxipng {{example_dir}}/{{flavor}}.png
    rm {{example_dir}}/{{flavor}}.typ

examples:
    for flavor in {{flavors}}; do \
        just _example $flavor; \
    done

previews:
    for flavor in {{flavors}}; do \
        just _preview $flavor; \
    done

clean:
    for flavor in {{flavors}}; do \
        rm -f {{example_dir}}/$flavor.pdf {{example_dir}}/$flavor.png; \
    done
