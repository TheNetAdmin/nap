import click
import csv
import sys
import pandas

class makefile(object):
    def __init__(self, filename):
        self.content = ''
        self.filename = filename
        self.comment(f'This Makefile is generated by {sys.argv[0]}')
        self.comment(
            f'Do not modify this file manually, instead, modify the config file')
        self.newline()
        self.variable('.DEFAULT_GOAL', 'all_tikz')
        self.newline()
        self.variable('make_flag', '--no-print-directory -j8')
        self.newline()
        self.variable('RSCRIPT', 'Rscript --no-save --no-restore')
        self.newline()

    def newline(self):
        self.content += '\n'

    def rule(self, target, deps:list, cmds, phony=False):
        if isinstance(cmds, str):
            cmd = f'{cmds}'
        else:
            cmd = '\n\t'.join(cmds) + '\n'

        if phony:
            l = len(target) + 2 - len('.PHONY:')
            if l >= 0 and len(deps) != 0:
                space = ' '*l
            else:
                space = ' '
            self.content += f'\n.PHONY:{space}{target}'

        dep = ''
        if isinstance(deps, str):
            dep = deps
        else:
            if len(deps) != 0:
                pre_space = ' ' * (len(target) + 2)
                max_len = max([ len(s) for s in deps ])
                for i, v in enumerate(deps):
                    dep += '' if i == 0 else pre_space
                    dep += v
                    dep += ' ' * (max_len - len(v) + 1) + '\\\n' if i != len(deps)-1 else '\n'

        self.content += f'\n{target}: {dep}\n'
        if len(cmd) != 0:
            self.content += f'\t{cmd}\n'

    def comment(self, content):
        if isinstance(content, str):
            text = f'{content}'
        else:
            text = '\n# '.join(content)
        self.content += f'\n# {text}'

    def variable(self, vname, vvalue):
        self.content += f'\n{vname}:={vvalue}'

    def save(self):
        with open(self.filename, 'w') as file:
            file.write(self.content)


class texfile(object):
    def __init__(self, filename):
        self.content = ''
        self.filename = filename
        self.cmd('documentclass', '../config/paper')
        self.cmd('title', 'All TIKZ Figures')
        self.newline()
        self.cmd('begin', 'document')
        self.newline()
        self.cmd('author', '')
        self.cmd('date', '')
        self.cmd_noarg('maketitle')
        self.cmd('thispagestyle', 'empty')
        self.newline()

    def newline(self):
        self.content += '\n'

    def cmd(self, cmd, arg):
        self.content += f'\\{cmd}' + '{' + f'{arg}' + '}\n'

    def cmd_noarg(self, cmd):
        self.content += f'\\{cmd}\n'

    def insert_tikz(self, figname):
        self.newline()
        self.cmd('begin', 'figure')
        self.cmd_noarg('centering')
        self.cmd('input', figname)
        self.cmd('caption', figname)
        self.cmd('end', 'figure')
        self.newline()

    def save(self):
        self.newline()
        self.cmd('end', 'document')
        with open(self.filename, 'w') as file:
            file.write(self.content)



def read_config(cfg_filename):
    configs = []
    data_path = '../data'
    fig_script_path = './src'
    with open(cfg_filename, 'r') as file:
        cfg_data = pandas.read_csv(file, sep=r'\s+,')
        for _, cfg in cfg_data.iterrows():
            cfg['data'] = f'{data_path}/{cfg["data"]}'
            cfg['script'] = f'{fig_script_path}/{cfg["script"]}'
            configs.append(cfg)
    return configs


@click.group()
def cli():
    pass

@cli.command()
@click.argument('cfg_filename')
@click.argument('tex_filename')
def gen_texfile(cfg_filename, tex_filename):
    configs = read_config(cfg_filename)
    tex = texfile(tex_filename)
    for cfg in configs:
        if 'tikz' in cfg['type'].split(','):
            tex.insert_tikz(f'{cfg["figure"]}.tikz')
    tex.save()


@cli.command()
@click.argument('cfg_filename')
@click.argument('make_filename')
def gen_makefile(cfg_filename, make_filename):
    configs = read_config(cfg_filename)

    make = makefile(make_filename)
    all_targets = dict()
    all_targets['tikz'] = []
    all_targets['pdf'] = []
    for cfg in configs:
        for t in cfg['type'].split(':'):
            target = f'{cfg["figure"]}.{t}'
            all_targets[t].append(target)
            make.rule(f'{target}',
                      [cfg["data"], cfg["script"]],
                      [f'@echo -e \"R \\t $@\"',
                       '@${RSCRIPT} ' + f'{cfg["script"]} --data {cfg["data"]} --out $@ --type {t}'])
    make.rule('all', ['all_tikz', 'all_pdf'], '', phony=True)
    make.rule('all_tikz',all_targets['tikz'], '', phony=True)
    make.rule('all_pdf',all_targets['pdf'], '', phony=True)
    make.rule('tikz_to_pdf', ["out/rplots.pdf"], '', phony=True)
    make.rule('out/rplots.pdf', ["rplots.tex"] + all_targets['tikz'], '@latexmk -pdf -outdir=out -quiet rplots.tex')
    make.rule('clean', ['clean_tikz', 'clean_pdf'], '', phony=True)
    make.rule('clean_tikz', '', f'rm -f {" ".join(all_targets["tikz"])}', phony=True)
    make.rule('clean_pdf', '', f'rm -f {" ".join(all_targets["pdf"])}', phony=True)
    make.save()


if __name__ == "__main__":
    cli()
